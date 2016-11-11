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
    clk_40MHz             : in std_logic;
    reset                 : in std_logic;
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- commands from Command Prcoessor block
    cp_command            : in std_logic_vector(2 downto 0);
    -- number of triggers to accept, output trigger frequency divider, module(s) to accept stub from, ~ 67.1 million as a maximum should be enough
    cp_data               : in std_logic_vector(25 downto 0);    
    done                  : out std_logic;
    failed                : out std_logic;
    -- 320Mhz clock   
    clk_320MHz            : out std_logic;
    -- output trigger to Hybrids
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal trigger_i                : std_logic := '0';
    signal clk_320MHz_i             : std_logic := '0';
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '0');
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    type trigger_source_type is (None, LHC, Stubs, UserFrequency);
    signal trigger_source           : trigger_source_type := None;
    signal user_divider             : std_logic_vector(25 downto 0);
    signal user_trigger             : std_logic;
    -- accept N triggers related signals
    signal accepting_triggers       : std_logic := '0';
    signal trigger_count            : std_logic_vector(25 downto 0) := (others => '0');
    signal counter                  : std_logic_vector(25 downto 0) := (others => '0');
    signal reset_counter       : std_logic := '0';
    signal reset_counter_loc       : std_logic := '0';

begin

    trigger_out <= trigger_i;
    clk_320MHz <= clk_320MHz_i;

--===================================--
clk_generator: entity work.usrpll
--===================================--
port map
(
    clk_in1         => clk_40MHz,
    reset           => reset,
    clk_out1        => clk_320MHz_i,
    locked          => open
);             
--===================================--
--===================================--
clk_divider: entity work.clock_divider
--===================================--
port map
(
    i_clk           => clk_40MHz,
    i_rst           => reset,
    i_clk_divider   => user_divider,
    o_clk           => user_trigger
);             
--===================================--

process (clk_40MHz)
begin
    if rising_edge(clk_40MHz) then
        if reset = '1' then
            trigger_source <= None;
            failed <= '0';
        end if;
        case cp_command is
            -- switch to no triggers
            when "000" =>
                trigger_source <= None;
                done <= '1';
                failed <= '0';
            -- switch to 40MHz clock as trigger
            when "001" =>
                trigger_source <= LHC;
                done <= '1';
                failed <= '0';
            -- switch to triggering using stubs from the hybrids, could be coincidence
            when "010" =>
                hybrid_mask_inv <= not cp_data(NUM_HYBRIDS downto 1);
                trigger_source <= Stubs;
                done <= '1';
                failed <= '0';
            when "011" =>
                user_divider <= cp_data;
                trigger_source <= UserFrequency;
                done <= '1';
                failed <= '0';
            when "100" =>                
                if trigger_source = None then
                    done <= '1';
                    failed <= '1';
                elsif accepting_triggers = '0' then
                    done <= '0';
                    failed <= '0';
                    trigger_count <= cp_data;
                    reset_counter <= not reset_counter;
                    accepting_triggers <= '1';
                else
                    if counter >= trigger_count then
                        done <= '1';
                        failed <= '0';
                        accepting_triggers <= '0';
                    end if;
                end if;
            when others =>
                done <= '1';
                failed <= '1';    
        end case;            
    end if;    
end process;

process (trigger_source, clk_40MHz)
begin
    case trigger_source is
        -- no triggers
        when None =>
            trigger_i <= '0';
        -- spread 40MHz clock as trigger
        when LHC =>
            trigger_i <= clk_40MHz;
        -- triggers using stubs from the hybrids, could be coincidence
        when Stubs =>
            if ones_mask = (hybrid_mask_inv OR in_stubs) then
                trigger_i <= '1';
            else
                trigger_i <= '0';
            end if;
        -- trigger with defined user frequency <= 40MHz
        when UserFrequency =>
            trigger_i <= user_trigger;
        -- no triggers
        when others =>
            trigger_i <= '0';
    end case;            
end process;

process (trigger_i)
begin
    if rising_edge(trigger_i) then
        if(reset_counter /= reset_counter_loc) then
            reset_counter_loc <= reset_counter;
            counter <= (others => '0');
        else
            counter <= counter + 1;
        end if;
    end if;
end process;

end rtl;
