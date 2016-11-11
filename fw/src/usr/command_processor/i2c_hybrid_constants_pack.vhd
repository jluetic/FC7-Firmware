----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2016 04:08:28 PM
-- Design Name: 
-- Module Name: i2c_hybrid_constants_pack - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package i2c_hybrid_constants_pack is

    type hybrid_address_array is array (1 to 16) of std_logic_vector(6 downto 0);
    
    -- defining chip addresses
    constant hybrid_address	: hybrid_address_array := ("1000001","1000010","1000011","1000100",
                                                     "1000101","1000110","1000111","1001000",
                                                     "1001001","1001010","1001011","1001100",
                                                     "1001101","1001110","1001111","1010000");
    
    -- defining register addresses
    constant REGISTER_fe_control            : std_logic_vector(7 downto 0) := "00000000";
    constant REGISTER_trig_latency          : std_logic_vector(7 downto 0) := "00000001";
    constant REGISTER_hit_detect_slvs       : std_logic_vector(7 downto 0) := "00000010";
    constant REGISTER_VCth                  : std_logic_vector(7 downto 0) := "00001100";
    

end i2c_hybrid_constants_pack;
