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
use work.user_package.all;
use work.system_package.all;

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
  command_in      : in array_4x32bit;
  -- output command
  i2c_request     : out cmd_wbus;
  i2c_reply        : in cmd_rbus;
  -- fast command block control line
  cmd_fast_block  : out cmd_to_fastbus;
  -- status back using IpBus
  status_out      : out std_logic_vector(31 downto 0);
  -- 8 chips data back
  status_data     : out array_4x32bit;
  -- errors from other blocks
  error_fast_block: in std_logic_vector(7 downto 0)
  );
end component;

component answer_block
    Port ( clk : in STD_LOGIC;
           request_strobe : in STD_LOGIC;
           i2c_reply : out cmd_rbus);
end component;

component sim_ipbus_processor
    Port ( 
    clk            : in std_logic;
    -- status
    status_in      : in std_logic_vector(31 downto 0);
    -- 8 chips data back
    status_data    : in array_4x32bit;
    data_processed : out std_logic_vector(4 downto 0));
end component;


constant clk40_period : time := 25 ns;
signal clk : std_logic;
signal clk_prev : std_logic := '0';
signal command_in : array_4x32bit := (others => (others => '0'));
signal status_out : std_logic_vector(31 downto 0);
signal status_data : array_4x32bit;
signal i2c_request              : cmd_wbus;
signal i2c_reply                : cmd_rbus;

signal command_type           : std_logic_vector(3 downto 0) := (others => '0');
-- hybrid_id
signal hybrid_id              : std_logic_vector(4 downto 0) := "00000";
-- cbc on hybrid id
signal chip_id                : std_logic_vector(3 downto 0) := x"1";
-- page in the CBC
signal page                   : std_logic := '0';
-- read or write setting
signal read                   : std_logic := '1';
-- register_address
signal register_address       : std_logic_vector(7 downto 0) := x"23";
-- write mask
signal write_mask             : std_logic_vector(7 downto 0) := "00000011";
signal data                   : std_logic_vector(7 downto 0) := x"AB";

signal data_processed         : std_logic_vector(4 downto 0) := "00000";

begin

    command_in(0) <= command_type & x"000" & data_processed & hybrid_id & chip_id & read & page;
    command_in(1) <= x"00" & register_address & write_mask & data;

    UUT: command_processor_core generic map (2,2)
    port map(clk, '0', command_in,i2c_request,i2c_reply,open,status_out,status_data,x"00");
    
    PHY_REPONSE_GENERATOR: answer_block port map(clk, i2c_request.cmd_strobe, i2c_reply);
    IPBUS_PROCESSOR: sim_ipbus_processor port map(clk, status_out, status_data, data_processed);
        
    clk40_process: process
    begin
        clk <= '1';
        wait for clk40_period/2;
        clk <= '0';
        wait for clk40_period/2;
    end process;
    
    commands_process: process
    begin
        command_type <= x"0";
        wait for 200 ns;
        command_type <= x"1";
        wait for 200 ns;
        command_type <= x"2";
        wait for 2000 ns;
        command_type <= x"3";
        wait for 2000 ns;
        command_type <= x"9";
        wait for 100 ns;
    end process;

end Behavioral;
