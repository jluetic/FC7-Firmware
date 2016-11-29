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
use work.cmdbus.all;


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
-- trigger control register input
trigger_control_in    : in std_logic_vector(31 downto 0);
-- output trigger frequency divider
trigger_divider_in    : in std_logic_vector(31 downto 0);
-- number of triggers to accept
triggers_to_accept_in       : in std_logic_vector(31 downto 0);
-- hybrid mask
trigger_hybrid_mask_in       : in std_logic_vector(31 downto 0);
-- stubs from hybrids
in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
-- trigger status register output
trigger_status_out    : out std_logic_vector(31 downto 0);
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
signal trigger_control_in : std_logic_vector(31 downto 0) := x"11_00_00_00";
signal trigger_divider_in : std_logic_vector(31 downto 0) := x"00_00_00_04";
signal triggers_to_accept_in : std_logic_vector(31 downto 0) := x"00_00_00_0A";
signal trigger_hybrid_mask_in : std_logic_vector(31 downto 0) := x"00_00_00_01";

begin

    UUT: fast_command_core generic map (NUM_HYBRIDS)
    port map(clk_40MHz, clk_lhc, '0', trigger_control_in, trigger_divider_in, triggers_to_accept_in, trigger_hybrid_mask_in, in_stubs, open, open);
    
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
        trigger_control_in <= x"11_00_00_00";
        wait for 500 ns;
        trigger_control_in <= x"21_00_00_00";
        wait for 500 ns;
        trigger_control_in <= x"31_00_00_00";
        wait for 500 ns;
        trigger_control_in <= x"00_00_00_00";
        wait for 100 ns;
        trigger_control_in <= x"12_00_00_00";
        wait for 20 ns;
        trigger_control_in(23) <= not trigger_control_in(23);        
        wait for 500 ns;
    end process;

end Behavioral;
