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
library UNISIM;
use UNISIM.VComponents.all;

entity fast_command_core is
  Generic (
    NUM_HYBRIDS           : integer := 1
  );
  Port (
    clk_40MHz             : in std_logic;
    l1_trigger_in         : in std_logic;
    reset                 : in std_logic;
    -- trigger control register input (31-28 - source, 27-24 - state, 23 - reset_counter)
    trigger_control_in    : in std_logic_vector(31 downto 0);
    -- output trigger frequency divider
    trigger_divider_in    : in std_logic_vector(31 downto 0);
    -- number of triggers to accept
    triggers_to_accept_in       : in std_logic_vector(31 downto 0);
    -- hybrid mask
    trigger_hybrid_mask_in       : in std_logic_vector(31 downto 0);
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- trigger status register output (31-28 - source, 27-24 - state, 23-20 - error code)
    trigger_status_out    : out std_logic_vector(31 downto 0);
    -- output trigger to Hybrids
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal trigger_i                : std_logic;
    signal ClkOutputMuxA            : std_logic;
    signal ClkOutputMuxB            : std_logic;
    signal clock_enable             : std_logic := '0';
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '0');
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    
    signal trigger_source           : std_logic_vector(3 downto 0);
    signal trigger_state            : std_logic_vector(3 downto 0);
    signal user_trigger             : std_logic;
    signal user_trigger_selector             : std_logic;
    signal stubs_trigger            : std_logic;
    -- accept N triggers related signals
    signal counter                  : std_logic_vector(31 downto 0) := (others => '0');
    signal reset_counter            : std_logic := trigger_control_in(23);
    signal reset_counter_loc        : std_logic := trigger_control_in(23);
    
    -- trigger checker counter
    signal trigger_checker          : std_logic_vector(31 downto 0) := (others => '0');
    signal trigger_source_prev       : std_logic_vector(3 downto 0) := "0000";
    signal counter_prev             : std_logic_vector(31 downto 0) := (others => '0');
    
    -- status signals
    signal status_source            : std_logic_vector(3 downto 0) := "0000";
    signal status_state            : std_logic_vector(3 downto 0) := "0000";
    signal status_error            : std_logic_vector(3 downto 0) := "0000";


begin

    trigger_source <= trigger_control_in(31 downto 28);
    trigger_state <= trigger_control_in(27 downto 24);
    reset_counter <= trigger_control_in(23);
    hybrid_mask_inv <= not trigger_hybrid_mask_in(NUM_HYBRIDS-1 downto 0);
    stubs_trigger <= '1' when ones_mask = (hybrid_mask_inv XOR in_stubs) else '0';
    user_trigger_selector <= '1' when TO_INTEGER(unsigned(trigger_divider_in)) > 1 else '0';
    
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

--===================================--
BufGCtrlMuxA_l : BUFGCTRL  
--===================================--
generic map (  
  INIT_OUT     => 0,  
  PRESELECT_I0 => FALSE,  
  PRESELECT_I1 => FALSE)  
port map (  
  O       => ClkOutputMuxA,  
  CE0     => '1',  
  CE1     => '1',  
  I0      => clk_40MHz,  
  I1      => user_trigger,  
  IGNORE0 => '1',  
  IGNORE1 => '1',  
  S0      => not user_trigger_selector, -- Clock select0 input  
  S1      => user_trigger_selector -- Clock select1 input  
);
--===================================--

--===================================--
BufGCtrlMuxB_l : BUFGCTRL  
--===================================--
generic map (  
  INIT_OUT     => 0,  
  PRESELECT_I0 => FALSE,  
  PRESELECT_I1 => FALSE)  
port map (  
  O       => ClkOutputMuxB,  
  CE0     => '1',  
  CE1     => '1',  
  I0      => stubs_trigger,  
  I1      => ClkOutputMuxA,  
  IGNORE0 => '1',  
  IGNORE1 => '1',  
  S0      => not trigger_source(0), -- Clock select0 input  
  S1      => trigger_source(0) -- Clock select1 input  
);
--===================================--

--===================================--
BufGCtrlMuxC_l : BUFGCTRL  
--===================================--
generic map (  
  INIT_OUT     => 0,  
  PRESELECT_I0 => FALSE,  
  PRESELECT_I1 => FALSE)  
port map (  
  O       => trigger_i,  
  CE0     => '1',  
  CE1     => '1',  
  I0      => l1_trigger_in,  
  I1      => ClkOutputMuxB,  
  --I1        => ClkOutputMuxA,
  IGNORE0 => '1',  
  IGNORE1 => '1',  
  S0      => not trigger_source(1), -- Clock select0 input  
  S1      => trigger_source(1) -- Clock select1 input  
);
--===================================--

--===================================--
BufGCE_Out : BUFGCE
--===================================--
port map (
    I   => trigger_i,
    O   => trigger_out,
    CE  => clock_enable
);
--===================================--

SOURCE_PROCESS: process (reset, clk_40MHz)
begin
    if reset = '1' then
        status_source <= x"0";
        trigger_source_prev <= trigger_source;
    elsif rising_edge(clk_40MHz) then
        trigger_checker <= trigger_checker + 1;
    case trigger_source is
        -- spread L1-Trigger as trigger
        when x"1" =>
            status_source <= x"1";
        -- triggers using stubs from the hybrids, could be coincidence
        when x"2" =>
            status_source <= x"2";
        -- trigger with defined user frequency <= 40MHz
        when x"3" =>
            status_source <= x"3";
        -- no triggers
        when others =>
            status_source <= x"0";
    end case;
        if trigger_source /= trigger_source_prev then
            trigger_source_prev <= trigger_source;
            trigger_checker <= (others => '0');
            counter_prev <= counter;
        end if;
    end if;            
end process;

STATE_PROCESS: process (reset, clk_40MHz)
begin
    if reset = '1' then
       clock_enable <= '0';
       status_state <= x"0"; 
       status_error <= x"0";
    elsif rising_edge(clk_40MHz) then
    case trigger_state is
        -- Idle
        when x"0" =>
            clock_enable <= '0';
            status_state <= x"0";
            status_error <= x"0";             
        -- Continuous Triggering
        when x"1" =>
            clock_enable <= '1';
            status_state <= x"1";
            status_error <= x"0";
        -- Accept N Triggers, then stop    
        when x"2" =>            
            if TO_INTEGER(unsigned(counter)) <= TO_INTEGER(unsigned(triggers_to_accept_in)) then
                clock_enable <= '1';
                status_state <= x"2";
                status_error <= x"0";
            else
                clock_enable <= '0';
                status_state <= x"3";
                status_error <= x"0";
            end if;
        when others =>
            clock_enable <= '0';
            status_state <= x"0"; 
            status_error <= x"1";             
    end case;
        -- if no trigger for 10s => bye bye
        --if TO_INTEGER(unsigned(trigger_checker)) >= 10 and counter = counter_prev then
        if trigger_state /= x"0" and TO_INTEGER(unsigned(trigger_checker)) >= 400_000_000 and counter = counter_prev then
            clock_enable <= '0';
            status_state <= x"0"; 
            status_error <= x"2";
        end if;
    end if;
end process;

COUNTER_PROCESS: process(reset_counter, trigger_i)
begin
    if reset_counter /= reset_counter_loc then
        reset_counter_loc <= reset_counter;
        counter <= (others => '0');
    elsif rising_edge(trigger_i) then
        counter <= counter + 1;
    end if;
end process;

end rtl;
