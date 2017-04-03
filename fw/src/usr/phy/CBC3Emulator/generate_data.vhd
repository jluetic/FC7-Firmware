----------------------------------------------------------------------------------
-- Engineer: 
-- 
-- Create Date: 12/13/2016 04:40:07 PM
-- Description: 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity generate_data is
Port ( 
    clk_40 : in std_logic;
    data : out std_logic_vector(253 downto 0);
    masks_i : std_logic_vector(253 downto 0)
);
end generate_data;

architecture Behavioral of generate_data is
    signal data_tmp : std_logic_vector(253 downto 0) := (others=>'1');
begin
    process(clk_40)
    variable strip_num : integer := 12;
    begin
        if rising_edge(clk_40) then
            data <= data_tmp and (not masks_i);
        end if;
    end process;
end Behavioral;
