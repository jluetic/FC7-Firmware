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
end component;

constant clk40_period : time := 25 ns;
signal clk : std_logic;
signal clk_320Mhz : std_logic;
signal NUM_HYBRIDS : integer := 1;
signal in_stubs : std_logic_vector(NUM_HYBRIDS downto 1) := "0";
signal cp_command : std_logic_vector(2 downto 0) := "011";
signal cp_data : std_logic_vector(25 downto 0) := "00000000000000000000000100"; 
begin

    UUT: fast_command_core generic map (NUM_HYBRIDS)
    port map(clk, '0', in_stubs, cp_command, cp_data, open, open, clk_320Mhz, open);
    
    clk40_process: process
    begin
        clk <= '1';
        wait for clk40_period/2;
        clk <= '0';
        wait for clk40_period/2;
    end process;


end Behavioral;
