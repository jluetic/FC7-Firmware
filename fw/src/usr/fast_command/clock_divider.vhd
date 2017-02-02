----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2016 04:55:38 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

use work.user_package.all;

entity clock_divider is
    port(
        i_clk         : in  std_logic;
        i_rst         : in  std_logic;
        i_clk_frequency : in integer range 1 to MAX_USER_TRIGGER_FREQUENCY;
        o_clk         : out std_logic
    );
end clock_divider;

architecture rtl of clock_divider is
    constant half_clock_frequency_khz: integer := CLK_FREQUENCY_HZ/2000;
    signal i_clk_frequency_int: integer range 1 to MAX_USER_TRIGGER_FREQUENCY := 1;
    signal divider: integer range 1 to half_clock_frequency_khz := 1;
        
    signal clk_int: STD_LOGIC := '0';
    signal counter : integer range 0 to half_clock_frequency_khz-1 := 0;
begin

divider <= half_clock_frequency_khz/i_clk_frequency_int - 1;

frequency_divider: process (i_rst, i_clk) begin
    if (i_rst = '1') or i_clk_frequency_int /= i_clk_frequency then
        i_clk_frequency_int <= i_clk_frequency;
        clk_int <= '0';
        counter <= 0;
    elsif rising_edge(i_clk) then
        if (counter = divider) then
            clk_int <= not clk_int;
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
    end if;
end process;

o_clk <= clk_int;
end rtl;
