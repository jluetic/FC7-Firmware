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
use work.user_package.all;

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
    -- control bus from Command Processor Block
    control_in            : in cmd_to_fastbus;
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- trigger status register output (3-2 - source, 1-0 - state)
    trigger_status_out    : out std_logic_vector(7 downto 0);
    -- fast command block error
    error_code            : out std_logic_vector(7 downto 0);
    -- output trigger to Hybrids (temporary, for tests)
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal trigger_i                : std_logic;
    signal ClkOutputMuxA            : std_logic;
    signal ClkOutputMuxB            : std_logic;
    signal clock_enable             : std_logic := '0';
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    
    signal trigger_source           : std_logic_vector(3 downto 0) := x"1";
    signal trigger_mode             : std_logic_vector(3 downto 0) := x"0";
    signal user_trigger             : std_logic;
    signal user_trigger_selector    : std_logic;
    signal user_trigger_divider     : integer range 1 to MAX_TRIGGER_DIVIDER := 1;
    signal stubs_trigger            : std_logic;
    signal triggers_to_accept       : integer range 1 to MAX_NTRIGGERS_TO_ACCEPT := 1;
    -- accept N triggers related signals
    signal counter                  : std_logic_vector(31 downto 0) := (others => '0');
    signal reset_counter            : std_logic := '0';
    signal triggering_done          : std_logic := '0';
    
    -- trigger checker counter
    signal trigger_checker          : std_logic_vector(31 downto 0) := (others => '0');
    signal trigger_source_prev       : std_logic_vector(3 downto 0) := "0000";
    signal counter_prev             : std_logic_vector(31 downto 0) := (others => '0');
    
    -- status signals
    signal status_source            : std_logic_vector(1 downto 0) := "00";
    signal status_mode             : std_logic_vector(1 downto 0) := "00";

begin

    stubs_trigger <= '1' when ones_mask = (hybrid_mask_inv XOR in_stubs) else '0';
    user_trigger_selector <= '1' when user_trigger_divider > 1 else '0';
    
    -- status
    trigger_status_out(7 downto 4) <= x"0";
    trigger_status_out(3 downto 2) <= status_source;
    trigger_status_out(1 downto 0) <= status_mode;


--===================================--
clk_divider: entity work.clock_divider
--===================================--
port map
(
    i_clk           => clk_40MHz,
    i_rst           => reset,
    i_clk_divider   => std_logic_vector(to_unsigned(user_trigger_divider,32)),
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

COMMAND_HANDLER: process (reset, clk_40MHz)
begin
    if reset = '1' then
            trigger_source <= x"1";
            trigger_mode <= x"0";
            hybrid_mask_inv <= (others => '1');
            user_trigger_divider <= 1;
            triggers_to_accept <= 1; 
            reset_counter <= '0';           
    elsif rising_edge(clk_40MHz) then
        if control_in.cmd_strobe = '1' then
            trigger_source <= control_in.trigger_source;
            trigger_mode <= control_in.trigger_mode;
            hybrid_mask_inv <= not control_in.stubs_mask(NUM_HYBRIDS-1 downto 0);
            user_trigger_divider <= control_in.divider;
            triggers_to_accept <= control_in.triggers_to_accept;
            reset_counter <= '1';
        else
            reset_counter <= '0';
        end if;
    end if;
end process;

SOURCE_PROCESS: process (reset, clk_40MHz)
begin
    if reset = '1' then
        status_source <= "00";
        trigger_source_prev <= trigger_source;
    elsif rising_edge(clk_40MHz) then
        trigger_checker <= trigger_checker + 1;
    case trigger_source is
        -- spread L1-Trigger as trigger
        when x"1" =>
            status_source <= "01";
        -- triggers using stubs from the hybrids, could be coincidence
        when x"2" =>
            status_source <= "10";
        -- trigger with defined user frequency <= 40MHz
        when x"3" =>
            status_source <= "11";
        -- no triggers
        when others =>
            status_source <= "00";
    end case;
        if trigger_source /= trigger_source_prev then
            trigger_source_prev <= trigger_source;
            trigger_checker <= (others => '0');
            counter_prev <= counter;
        end if;
    end if;            
end process;

MODE_PROCESS: process (reset, clk_40MHz)
begin
    if reset = '1' then
       clock_enable <= '0';
       status_mode <= "00"; 
       error_code <= x"00";
    elsif rising_edge(clk_40MHz) then
    case trigger_mode is
        -- Idle
        when x"0" =>
            clock_enable <= '0';
            status_mode <= "00";
            error_code <= x"00";             
        -- Continuous Triggering
        when x"1" =>
            clock_enable <= '1';
            status_mode <= "01";
            error_code <= x"00";
        -- Accept N Triggers, then stop    
        when x"2" =>            
            if TO_INTEGER(unsigned(counter)) <= triggers_to_accept and triggering_done = '0' then
                clock_enable <= '1';
                status_mode <= "10";
                error_code <= x"00";
            else
                triggering_done <= '1';
                clock_enable <= '0';
                status_mode <= "11";
                error_code <= x"00";
            end if;
            if reset_counter = '1' then
                triggering_done <= '0';
            end if;
        when others =>
            clock_enable <= '0';
            status_mode <= "00";
            -- unknown mode 
            error_code <= x"01";             
    end case;
        if control_in.cmd_strobe = '1' then
            clock_enable <= '0';
        end if;
        if to_integer(unsigned(trigger_source)) > 3 then
            -- unknown source
            error_code <= x"02";
            clock_enable <= '0';
        end if;
        if trigger_source = x"0" then
            clock_enable <= '0';
        end if;
        -- if no trigger for 10s => bye bye
        --if trigger_mode /= x"0" and TO_INTEGER(unsigned(trigger_checker)) >= 10 and counter = counter_prev then
        if trigger_mode /= x"0" and TO_INTEGER(unsigned(trigger_checker)) >= 400_000_000 and counter = counter_prev then
            clock_enable <= '0';
            status_mode <= "00"; 
            -- no triggers
            error_code <= x"03";
        end if;
    end if;
end process;

COUNTER_PROCESS: process(reset_counter, trigger_i)
begin
    if reset_counter = '1' then
        counter <= (others => '0');
    elsif rising_edge(trigger_i) then
        counter <= counter + 1;
    end if;
end process;

end rtl;
