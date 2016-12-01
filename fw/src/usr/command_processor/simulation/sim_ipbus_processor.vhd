----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2016 05:36:07 PM
-- Design Name: 
-- Module Name: sim_ipbus_processor - rtl
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
use work.system_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_ipbus_processor is
    Port ( 
    clk            : in std_logic;
    -- status
    status_in      : in std_logic_vector(31 downto 0);
    -- 8 chips data back
    status_data    : in array_4x32bit;
    data_processed : out std_logic_vector(4 downto 0));
end sim_ipbus_processor;

architecture rtl of sim_ipbus_processor is

    signal counter : std_logic := '0';

begin

response_process: process (clk)
begin
    if rising_edge(clk) then
        if status_in(15) = '1' then
            if counter = '0' then
                data_processed <= "00000";
                counter <= '1';
            else
                data_processed <= "00001";
                counter <= '0';
            end if;
        end if;
    end if;
end process; 

end rtl;
