----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2016 01:39:32 PM
-- Design Name: 
-- Module Name: sim_command_processor_core - Behavioral
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

entity sim_command_processor_core is
--  Port ( );
end sim_command_processor_core;

architecture Behavioral of sim_command_processor_core is

component command_processor_core
  Port ( 
    clk             : in std_logic;
    reset           : in std_logic;
    
    ------
    i2c_hybrids_scl  : inout std_logic;
    i2c_hybrids_sda  : inout std_logic
  );
end component;

constant clk40_period : time := 25 ns;
signal i2c_hybrids_scl,i2c_hybrids_sda : std_logic;
signal clk : std_logic;
begin

    UUT: command_processor_core port map(clk, '0', i2c_hybrids_scl,i2c_hybrids_sda);
    
    clk40_process: process
    begin
        clk <= '1';
        wait for clk40_period/2;
        clk <= '0';
        wait for clk40_period/2;
    end process;


end Behavioral;
