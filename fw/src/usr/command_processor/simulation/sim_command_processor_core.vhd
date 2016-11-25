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
use work.cmdbus.all;

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
  Generic (
  NUM_HYBRIDS     : integer := 1;
  NUM_CHIPS       : integer := 1
  );
  Port ( 
  clk             : in std_logic;
  reset           : in std_logic;    
  -- command from IpBus
  command_in      : in std_logic_vector(31 downto 0);
  -- output command
  i2c_request     : out cmd_wbus;
  i2c_reply       : in cmd_rbus;
  -- status back using IpBus
  status_out      : out std_logic_vector(31 downto 0)
  );
end component;

constant clk40_period : time := 25 ns;
signal clk : std_logic;
signal command_in : std_logic_vector(31 downto 0) := x"00_00_00_00";
signal status_out : std_logic_vector(31 downto 0);
signal i2c_request              : cmd_wbus;
signal i2c_reply                : cmd_rbus;

begin

    UUT: command_processor_core generic map (4,2)
    port map(clk, '0', command_in,i2c_request,i2c_reply,status_out);
    
    clk40_process: process
    begin
        clk <= '1';
        wait for clk40_period/2;
        clk <= '0';
        wait for clk40_period/2;
    end process;
    
    commands_process: process
    begin
        command_in <= x"00_00_00_00";
        wait for 200 ns;
        command_in <= "00001" & "00111" & x"8" & "00" & x"00_00";
        wait for 200 ns;
        command_in <= "00010" & "00111" & x"8" & "00" & x"00_00";
        wait for 2000 ns;
        command_in <= "00011" & "00111" & x"8" & "00" & x"00_00";
        wait for 2000 ns;
    end process;

end Behavioral;
