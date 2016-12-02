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

component fast_command_core
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
trigger_status_out    : out std_logic_vector(3 downto 0);
-- fast command block error
error_code            : out std_logic_vector(7 downto 0);
-- output trigger to Hybrids
trigger_out          : out std_logic
);
end component;

constant clk40_period : time := 25 ns;
constant clk160_period : time := 6.25 ns;
constant clk_lhc_period : time := 23 ns;

signal clk_40MHz : std_logic;
signal clk_lhc : std_logic;
signal NUM_HYBRIDS : integer := 1;
signal in_stubs : std_logic_vector(NUM_HYBRIDS downto 1) := "0";
signal trigger_control_in : cmd_to_fastbus;

signal trigger_source : std_logic_vector(3 downto 0) := x"0";
signal trigger_mode : std_logic_vector(3 downto 0) := x"0";

begin

    trigger_control_in.trigger_source     <= trigger_source;
    trigger_control_in.trigger_mode       <= trigger_mode;
    trigger_control_in.triggers_to_accept <= 10;
    trigger_control_in.divider            <= 4;
    trigger_control_in.stubs_mask         <= x"00000003";

    UUT: fast_command_core generic map (NUM_HYBRIDS)
    port map(clk_40MHz, clk_lhc, '0', trigger_control_in, in_stubs, open, open);
    
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
        trigger_mode <= x"1";
        wait for 500 ns;
        trigger_source <= x"2";
        wait for 500 ns;
        trigger_source <= x"3";
        wait for 500 ns;
        trigger_source <= x"0";
        wait for 100 ns;
        trigger_source <= x"1";
        trigger_mode <= x"2";
        trigger_control_in.reset_counter <= '1';
        wait for 25 ns;
        trigger_control_in.reset_counter <= '0';        
        wait for 500 ns;
    end process;

end Behavioral;
