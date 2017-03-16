----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2017 07:37:06 PM
-- Design Name: 
-- Module Name: triggered_data_CBC2_readout - rtl
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity triggered_data_CBC2_readout is
Port (
    clk40: in std_logic; 
    reset_i: in std_logic;
    triggered_data_from_fe_i: in std_logic;
    stub_from_CBC_i: in std_logic;
    -- output triggered data frame
    triggered_data_frame_o: out triggered_data_frame_r    
 );
end triggered_data_CBC2_readout;

architecture rtl of triggered_data_CBC2_readout is

begin

process(clk40)
begin
    if rising_edge(clk40) then
        triggered_data_frame_o.start <= (others => '0');
        triggered_data_frame_o.latency_error <= '0';
        triggered_data_frame_o.buffer_overflow <= '0';
        triggered_data_frame_o.pipe_address <= (others => '0');
        triggered_data_frame_o.l1_counter <= (others => '0');
        triggered_data_frame_o.channels <= (others => '0');     
    end if;
end process;

end rtl;
