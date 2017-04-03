----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2016 01:39:32 PM
-- Design Name: 
-- Module Name: sim_fast_command_core - Behavioral
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
use work.user_package.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_fast_command_core is
--  Port ( );
end sim_fast_command_core;

architecture Behavioral of sim_fast_command_core is

constant clk40_period : time := 25 ns;
constant clk160_period : time := 6.25 ns;
constant clk_lhc_period : time := 23 ns;

constant ctrl_fastblock_init0   : ctrl_fastblock_type := (cmd_strobe => '0',
                                                     reset => '0',
                                                     load_config => '0',
                                                     start_trigger => '0',
                                                     stop_trigger => '0',
                                                     ipb_fast_reset => '0',
                                                     ipb_test_pulse => '0',
                                                     ipb_trigger => '0',
                                                     ipb_orbit_reset => '0');

signal clk_40MHz : std_logic;
signal clk_lhc : std_logic;
signal in_stubs : std_logic_vector(NUM_HYBRIDS downto 1) := "00";
signal cnfg_fastblock_i : cnfg_fastblock_type;
signal ctrl_fastblock_i : ctrl_fastblock_type := ctrl_fastblock_init0;

signal trigger_source : std_logic_vector(3 downto 0) := x"0";
signal trigger_source_prev : std_logic_vector(3 downto 0) := x"0";

signal trigger_start : std_logic := '0';
signal trigger_start_prev : std_logic := '0';

begin

    cnfg_fastblock_i.trigger_source     <= trigger_source;
    cnfg_fastblock_i.triggers_to_accept <= 0;
    cnfg_fastblock_i.user_trigger_frequency            <= 1000;
    cnfg_fastblock_i.stubs_mask         <= x"00000003";
 
    --===================================--
    -- Fast commands. Connected to: physical interface, hybrids.
    --===================================--
    uut_fast_command_block: entity work.fast_command_core
    --===================================--
    port map
    (
        clk_40Mhz               => clk_40MHz,
        l1_trigger_in           => clk_lhc,
        reset                   => '0',
        -- control buses from Command Processor Block
        ctrl_fastblock_i        => ctrl_fastblock_i,
        cnfg_fastblock_i        => cnfg_fastblock_i,
        -- stubs from hybrids
        in_stubs                => in_stubs,
        -- trigger status
        stat_fastblock_o        => open,
        -- output fast signals to phy_block
        fast_signal             => open
    );        
    --===================================-- 
    
    clk40_process: process
    begin
        clk_40MHz <= '1';
        wait for clk40_period/2;
        clk_40MHz <= '0';
        wait for clk40_period/2;
    end process;
       
    clk_lhc_process: process
      begin
          clk_lhc <= '1';
          wait for clk_lhc_period/2;
          clk_lhc <= '0';
          wait for clk_lhc_period/2;
      end process;

    restart_process: process
    begin
        trigger_source <= x"1";
        wait for 100 ns;
        trigger_start <= not trigger_start;
        wait for 500 ns;
        trigger_source <= x"2";
        wait for 100 ns;
        trigger_start <= not trigger_start;
        wait for 500 ns;
        trigger_source <= x"3";
        wait for 500 ns;
        trigger_start <= not trigger_start;
        wait for 5000 ns;
    end process;
    
    strobe_process: process(clk_40MHz)
    begin
        if rising_edge(clk_40MHz) then
        if trigger_source /= trigger_source_prev then
            trigger_source_prev <= trigger_source;
            ctrl_fastblock_i.cmd_strobe <= '1';
            ctrl_fastblock_i.load_config <= '1';
        elsif trigger_start /= trigger_start_prev then
            trigger_start_prev <= trigger_start;
            ctrl_fastblock_i.cmd_strobe <= '1';
            ctrl_fastblock_i.start_trigger <= '1';
        else
            ctrl_fastblock_i.start_trigger <= '0';
            ctrl_fastblock_i.load_config <= '0';
            ctrl_fastblock_i.cmd_strobe <= '0';
        end if;
        end if;
    end process;

end Behavioral;