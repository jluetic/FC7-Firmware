----------------------------------------------------------------------------------
-- Engineer: Jarne De Clercq, Alexandre Leonard, Jelena Luetic
-- 
-- Create Date: 11/24/2016 01:38:25 PM
-- Description: Sending triggered data to hybrid block, one line per hybrid
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;

entity triggered_data_all_CBCs is
Port ( 
    clk40 : in std_logic;
    reset_i : in std_logic;
    triggered_data_frame_r_array_i : in triggered_data_frame_r_array;
    trig_data_to_hb_o : out triggered_data_frame_r
);
end triggered_data_all_CBCs;

architecture Behavioral of triggered_data_all_CBCs is
    type trig_data_to_hb_t_array is array (15 downto 0) of trig_data_to_hb_t;
    signal trig_data_tmp : triggered_data_frame_r_array(0 to NUM_CHIPS-1); 
    signal cycle_for_sending : integer := NUM_CHIPS;
    signal nDummys : integer := 0;
    type state_t is (IDLE, SENDING_CHIP, SENDING_DUMMY);
    signal state : state_t := IDLE;

begin 
    process(clk40)
        constant flag_ones : std_logic_vector(NUM_CHIPS - 1 downto 0) := (others => '1'); 
        -- dummy nul vector for reseting output
        constant all_zeros : triggered_data_frame_r := (start => "00", latency_error => '0', buffer_overflow => '0', pipe_address => (others => '0'), l1_counter => (others => '0'), channels => (others => '0'));     
        -- chip counters
        variable is_sending : std_logic :='0';

    begin
        if (rising_edge(clk40)) then   
            -- synchronous reset
            if (reset_i = '1') then   
                trig_data_tmp <= (others => all_zeros);
                cycle_for_sending <= NUM_CHIPS;
                nDummys <= 0;
            else
                case state is
                    when IDLE =>
                        cycle_for_sending <= NUM_CHIPS;
                        trig_data_to_hb_o <= all_zeros;
                        nDummys <= 0;
                        trig_data_tmp <= (others => all_zeros);
                        if (triggered_data_frame_r_array_i(0).start="11") then
                            trig_data_tmp <= triggered_data_frame_r_array_i;
                            state<=SENDING_CHIP;
                        end if;                       
                    when SENDING_CHIP =>
                        trig_data_to_hb_o <= trig_data_tmp(NUM_CHIPS - cycle_for_sending);
                        if (cycle_for_sending=1) then
                            if (NUM_CHIPS=8) then
                                state <= IDLE;
                            else
                                state<=SENDING_DUMMY;
                            end if;
                        else
                            cycle_for_sending <= cycle_for_sending - 1;
                        end if;
                    when SENDING_DUMMY=>
                        trig_data_to_hb_o <= all_zeros;
                        if(nDummys=(8-NUM_CHIPS)) then
                            state<=IDLE;
                        else
                            nDummys<=nDummys+1;
                        end if;
                end case;                  
            end if; --end reset condition
        end if;
    end process;
end Behavioral;
