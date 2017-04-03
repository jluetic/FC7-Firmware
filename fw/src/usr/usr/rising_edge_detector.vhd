----------------------------------------------------------------------------------
-- Create Date: 12/22/2016 11:42:48 AM
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

entity rising_edge_detector is
    Port ( clk : in STD_LOGIC;
           signal_in : in STD_LOGIC;
           output_1 : out STD_LOGIC
         );
end rising_edge_detector;
    
architecture rtl of rising_edge_detector is

    signal signal_d : STD_LOGIC;

begin

    process(clk)
    begin
         if clk= '1' and clk'event then
               signal_d<=signal_in;
         end if;
    end process;
    output_1<= (not signal_d) and signal_in;

end rtl;
