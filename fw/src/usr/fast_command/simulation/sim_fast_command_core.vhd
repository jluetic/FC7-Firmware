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
  clk_160MHz            : in std_logic;
  clk_40MHz             : in std_logic;
  clk_lhc               : in std_logic;
  reset                 : in std_logic;
  -- stubs from hybrids
  in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
  -- commands from Command Prcoessor block
  cp_command            : in std_logic_vector(3 downto 0);
  -- number of triggers to accept, output trigger frequency divider, module(s) to accept stub from, ~ 67.1 million as a maximum should be enough
  cp_data               : in std_logic_vector(25 downto 0);    
  done                  : out std_logic;
  failed                : out std_logic;
  -- output trigger to Hybrids
  trigger_out           : out std_logic
);
end component;

constant clk40_period : time := 25 ns;
constant clk160_period : time := 6.25 ns;
constant clk_lhc_period : time := 23 ns;

signal clk_40MHz : std_logic;
signal clk_160MHz : std_logic;
signal clk_lhc : std_logic;
signal NUM_HYBRIDS : integer := 1;
signal in_stubs : std_logic_vector(NUM_HYBRIDS downto 1) := "0";
signal cp_command : std_logic_vector(3 downto 0) := "0100";
signal cp_data : std_logic_vector(25 downto 0) := "00000000000000000000000011"; 
begin

    UUT: fast_command_core generic map (NUM_HYBRIDS)
    port map(clk_160MHz, clk_40MHz, clk_lhc, '0', in_stubs, cp_command, cp_data, open, open, open);
    
    clk40_process: process
    begin
        clk_40MHz <= '1';
        wait for clk40_period/2;
        clk_40MHz <= '0';
        wait for clk40_period/2;
    end process;
    
    clk160_process: process
    begin
        clk_160MHz <= '1';
        wait for clk160_period/2;
        clk_160MHz <= '0';
        wait for clk160_period/2;
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
        cp_command(2 downto 0) <= "001";
        cp_command(3) <= not cp_command(3);
        wait for 100 ns;
        --cp_command(2 downto 0) <= "100";
        --cp_command(3) <= not cp_command(3);
        wait for 1000 ns;
    end process;

end Behavioral;
