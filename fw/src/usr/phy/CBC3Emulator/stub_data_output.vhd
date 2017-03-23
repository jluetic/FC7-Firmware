----------------------------------------------------------------------------------
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic -- 
-- Create Date: 12/12/2016 06:16:37 PM
-- Description: Stub data generator
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use ieee.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;
use work.cbc3_emulator_package.ALL;

entity stub_data_output is
  Port (
      clk320: in std_logic; 
      clk40 : in std_logic;
      reset_i: in std_logic;
      stub_data_to_fc7_o: out stub_lines_r;
      synch_bit_o         : out std_logic;
      VTH_i : in std_logic_vector(9 downto 0)  
   );
end stub_data_output;

architecture Behavioral of stub_data_output is
    signal counter : integer := 8;
    signal VTH_integer : integer := 0;
    signal dp5_temp : std_logic := '0';
    signal rand_num : integer range 4 downto 0 := 0;
    signal random_number_vector : std_logic_vector(4 downto 0) := (others => '0');
    signal is40 :std_logic := '0';
begin
    process(clk40)
        begin
            if(rising_edge(clk40)) then
                is40 <= '1';
            end if;
    end process;

    process(clk320)
        --for the random generator
        --variable random_number_vector : std_logic_vector(4 downto 0);        
        --end of random generator stuff      
        
        begin
            --for the random generator
            rand_num<=(random_number_seed_A*rand_num+random_number_seed_B) mod 31;
            --rand_num <= rand_num+1;
            random_number_vector<=conv_std_logic_vector(rand_num,5);
            --random_number_vector:= (others => '1');
            --end of random generator stuff
            if (rising_edge(clk320)) then 
                if (reset_i = '1') then
                    stub_data_to_fc7_o <= (dp1=>'0',dp2=>'0',dp3=>'0',dp4=>'0',dp5=>'0');
                    counter <= 0;
                    synch_bit_o <= '0';
                else --output random data on all dp's (for this first version) except for the sync bit that always has to be one                 
                    if (is40='1' and counter>7) then
                        counter <= 2;
                    else
                        counter <= counter + 1;
                    end if;
                    
                    if (counter = 7) then
                        dp5_temp <= '1';
                        counter<=0;
                        synch_bit_o <= '1';
                    else 
                        dp5_temp <= '0';
                        synch_bit_o <= '0';
                    end if; --end of counter condition 
                    VTH_integer <= to_integer(ieee.numeric_std.unsigned(VTH_i));
                    --define ranges of the output of the CBC on the dp's depending on the
                    --setting of the VTH register. If threshold is low all 1's on lines 1-3;
                    --if threshold medium random data on lines 1-3; if threshold high all 0's on lines 1-3
                    --line 4 is always zero and line 5 is always 'random' except every 8th clock cycle where it needs to be 1 (synch bit) 
                    if(VTH_integer < 350) then
                        stub_data_to_fc7_o <= (dp1=>'1',dp2=>'1',dp3=>'1',dp4=>'0',dp5=>dp5_temp or random_number_vector(3));
                    elsif(VTH_integer < 700) then
                        stub_data_to_fc7_o <= (dp1=>random_number_vector(0),dp2=>random_number_vector(1),dp3=>random_number_vector(2),dp4=>'0',dp5=>dp5_temp or random_number_vector(3));
                    else
                        stub_data_to_fc7_o <= (dp1=>'0',dp2=>'0',dp3=>'0',dp4=>'0',dp5=>dp5_temp or random_number_vector(3));                    
                    end if;--end of condition of VTH register  

                               
                end if; -- end reset condition          
            end if; -- end rising_edge(clk320) condition                      
    end process;
end Behavioral;
