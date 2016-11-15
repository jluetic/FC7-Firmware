----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2016 12:52:31 PM
-- Design Name: 
-- Module Name: fast_command_core - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fast_command_core is
  Generic (
    NUM_HYBRIDS           : integer := 1
  );
  Port (
    clk_160MHz            : in std_logic;
    clk_40MHz             : in std_logic;
    clk_lhc               : in std_logic;
    reset                 : in std_logic;
    -- trigger control register input (31-28 - source, 27-24 - state, 23 - reset_counter, 22-1 - hybrid mask)
    trigger_control_in    : in std_logic_vector(31 downto 0);
    -- output trigger frequency divider
    trigger_divider_in    : in std_logic_vector(31 downto 0);
    -- number of triggers to accept
    triggers_to_accept_in       : in std_logic_vector(31 downto 0);
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- trigger status register output (31-28 - source, 27-24 - state, 23-20 - error code)
    trigger_status_out    : out std_logic_vector(31 downto 0);
    -- output trigger to Hybrids
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal trigger_i                : std_logic := '0';
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '0');
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    
    signal trigger_source           : std_logic_vector(3 downto 0);
    signal trigger_state            : std_logic_vector(3 downto 0);
    signal user_trigger             : std_logic;
    -- accept N triggers related signals
    signal counter                  : std_logic_vector(31 downto 0) := (others => '0');
    signal reset_counter            : std_logic := trigger_control_in(23);
    signal reset_counter_loc        : std_logic := trigger_control_in(23);
    
    -- status signals
    signal status_source            : std_logic_vector(3 downto 0) := "0000";
    signal status_state            : std_logic_vector(3 downto 0) := "0000";
    signal status_error            : std_logic_vector(3 downto 0) := "0000";


begin

    trigger_source <= trigger_control_in(31 downto 28);
    trigger_state <= trigger_control_in(27 downto 24);
    reset_counter <= trigger_control_in(23);
    hybrid_mask_inv <= not trigger_control_in(NUM_HYBRIDS downto 1);
    
    -- status
    trigger_status_out(31 downto 28) <= status_source;
    trigger_status_out(27 downto 24) <= status_state;
    trigger_status_out(23 downto 20) <= status_error;


--===================================--
clk_divider: entity work.clock_divider
--===================================--
port map
(
    i_clk           => clk_40MHz,
    i_rst           => reset,
    i_clk_divider   => trigger_divider_in,
    o_clk           => user_trigger
);             
--===================================--

process (trigger_source, clk_160MHz, clk_40MHz, user_trigger, clk_lhc)
begin
    if reset <= '1' then
        status_source <= "0000";
    end if;
    case trigger_source is
        -- no triggers
        when "0000" =>
            trigger_i <= '0';
            status_source <= "0000";
        -- spread LHC clock as trigger
        when "0001" =>
            trigger_i <= clk_lhc;
            status_source <= "0001";
        -- triggers using stubs from the hybrids, could be coincidence
        when "0010" =>
            if ones_mask = (hybrid_mask_inv XOR in_stubs) then
                trigger_i <= '1';
            else
                trigger_i <= '0';
            end if;
            status_source <= "0010";
        -- trigger with defined user frequency <= 40MHz
        when "0011" =>
            if trigger_divider_in = "00000000000000000000000000000001" then
                trigger_i <= clk_40MHz;
            else
                trigger_i <= user_trigger;
            end if;
            status_source <= "0011";
        -- no triggers
        when others =>
            trigger_i <= '0';
            status_source <= "0000";
    end case;            
end process;

process (trigger_i)
begin
    if reset_counter /= reset_counter_loc then
        reset_counter_loc <= reset_counter;
        counter <= (others => '0');
        status_state <= "0000";
    end if;
    case trigger_state is
        -- Idle
        when "0000" =>
            trigger_out <= '0';
            status_state <= "0000";
        -- Continuous Triggering
        when "0001" =>
            trigger_out <= trigger_i;
            status_state <= "0001";
        -- Accept N Triggers, then stop    
        when "0010" =>            
            if TO_INTEGER(unsigned(counter)) < TO_INTEGER(unsigned(triggers_to_accept_in)) then
                trigger_out <= trigger_i;
                if rising_edge(trigger_i) then
                    counter <= counter + 1;
                    status_state <= "0010";
                end if;
            else
                trigger_out <= '0';
                status_state <= "0011";
            end if;
        when others =>
            trigger_out <= '0';
            status_state <= "0000";            
    end case;
end process;

end rtl;
