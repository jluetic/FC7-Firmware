----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2016 05:03:36 PM
-- Design Name: 
-- Module Name: answer_block - rtl
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

entity answer_block is
    Port ( clk : in STD_LOGIC;
           request_strobe : in STD_LOGIC;
           i2c_reply : out cmd_rbus);
end answer_block;

architecture rtl of answer_block is

begin

response_process: process (clk)
begin
    if rising_edge(clk) then
        if request_strobe = '1' then
            i2c_reply.cmd_strobe <= '1';
            i2c_reply.cmd_err <= '0';
            i2c_reply.cmd_data <= x"AA";
        else
            i2c_reply.cmd_strobe <= '0';
            i2c_reply.cmd_err <= '0';
            i2c_reply.cmd_data <= x"00";
        end if;
    end if;
end process;    

end rtl;
