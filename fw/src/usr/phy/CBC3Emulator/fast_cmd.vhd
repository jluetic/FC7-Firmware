----------------------------------------------------------------------------------
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic -- 
-- Create Date: 11/28/2016 03:48:43 PM 
-- Description: Fast command input and clock recovery
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.user_package.ALL;

entity fast_cmd is
    port (   
        clk320 : in std_logic;
        clk40_o : out std_logic;     
        fast_cmd_i: in std_logic; -- at 320 MHz
        fast_reset_o: out std_logic;
        trigger_o : out std_logic;
        test_pulse_trigger_o : out std_logic;
        orbit_reset_o : out std_logic      
    );

end fast_cmd;

architecture Behavioral of fast_cmd is

    type state_t is (SYNCING, DONE);
    signal counter : integer := 0;   
    signal state : state_t := SYNCING;
    signal clk40_internal : std_logic := '0';
    --signal counter : integer := 0;
    signal fast_reset : std_logic := '0';
    signal trigger : std_logic := '0';
    signal test_pulse_trigger : std_logic := '0';
    signal orbit_reset : std_logic := '0';
    
    attribute keep: boolean;
    attribute keep of clk320: signal is true;     
begin

    -- put recovered clock on clock line
    bufg_inst : bufg port map( o => clk40_o, i => clk40_internal);
   
    --make fast commands available
    fast_reset_o <= fast_reset;
    trigger_o <= trigger;
    test_pulse_trigger_o <= test_pulse_trigger;
    orbit_reset_o <= orbit_reset;
      
    process(clk320)
        variable sync_bit_candidate : std_logic_vector(3 downto 0) := (others => '0');   
    
    begin
        if(rising_edge(clk320)) then   
            case state is     
                when SYNCING =>
                    --== reset output ==--                    
                    fast_reset <= '0';
                    trigger <= '0';
                    test_pulse_trigger <= '0';
                    orbit_reset <= '0';
                    clk40_internal <= '0';
                    
                    --save the input to a 4 bit signal
                    sync_bit_candidate := sync_bit_candidate(2 downto 0) & fast_cmd_i;
                    --check if the input sequence is equal to the sync pattern (also using the trailing 1 of the end of a fast frame)                  
                    if (sync_bit_candidate = "1110") then 
                        counter <= 5; 
                        state <= DONE;                         
                    end if;
                                   
                when DONE =>
                  case counter is
                    when 8 => 
                        counter <= 7;
                        
                    when 7 =>                         
                        counter <= 6;                      

                    when 6 =>   
                        counter <= 5;                         

                    when 5 =>   
                        counter <= 4;
                        -- Read fast reset
                        fast_reset <= fast_cmd_i;
                        clk40_internal <= '0';

                    when 4 => 
                        -- Read trigger
                        trigger <= fast_cmd_i;
                        counter <= 3;

                    when 3 =>
                        -- Read test pulse (does nothing)    
                        test_pulse_trigger <= fast_cmd_i;
                        counter <= 2;

                    when 2 =>
                        -- Read orbit reset (does nothing)  
                        orbit_reset <= fast_cmd_i; 
                        counter <= 1;

                    when 1 =>                    
                        --== reset counter for next batch ==-
                        clk40_internal <= '1';
                        counter <= 8; 
       
                    when others =>
                         --== reset output ==--
                         fast_reset <= '0';
                         trigger <= '0';
                         test_pulse_trigger <= '0';
                         orbit_reset <= '0';
                         clk40_internal <= '0';    
                                                
                  end case;  --end case counter
                  
              when others =>
                       --== reset output ==--
                       fast_reset <= '0';
                       trigger <= '0';
                       test_pulse_trigger <= '0';
                       orbit_reset <= '0';
                       clk40_internal <= '0';
                
            end case; --end case states     
        end if;    
    end process;
end Behavioral;
