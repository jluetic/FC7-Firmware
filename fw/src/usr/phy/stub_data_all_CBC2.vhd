----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2017 06:50:14 PM
-- Design Name: 
-- Module Name: stub_data_all_CBC2 - rtl
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

entity stub_data_all_CBC2 is
port (
    clk40: in std_logic; -- 320 MHz
    -- stub data lines from FE
    stub_lines_i: in stub_lines_r_cbc2_array;       
    -- output stub data frame to hybrid block
    cbc_data_to_hb_o: out one_cbc_stubs_r_array      
);
end stub_data_all_CBC2;

architecture rtl of stub_data_all_CBC2 is
    signal cbc_data_to_hb: one_cbc_stubs_r_array;

begin

    CBCs:
    for I in 0 to NUM_CHIPS - 1 generate
        process (clk40)
        begin
            if rising_edge(clk40) then
                cbc_data_to_hb(I).sync_bit <= stub_lines_i(I);
                cbc_data_to_hb(I).error_flags <= '0';
                cbc_data_to_hb(I).or254 <= stub_lines_i(I);
                cbc_data_to_hb(I).s_overflow <= '0';
                cbc_data_to_hb(I).stub1(7 downto 1) <= (others => '0');
                cbc_data_to_hb(I).stub1(0) <= stub_lines_i(I);
                cbc_data_to_hb(I).bend1 <= (others => '0');
                cbc_data_to_hb(I).stub2 <= (others => '0');
                cbc_data_to_hb(I).bend2 <= (others => '0');
                cbc_data_to_hb(I).stub3 <= (others => '0');
                cbc_data_to_hb(I).bend3 <= (others => '0');
            end if;
        end process;
    end generate CBCs;
    -- connect stub data frame to the hybrid block
    cbc_data_to_hb_o <= cbc_data_to_hb;

end rtl;
