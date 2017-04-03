----------------------------------------------------------------------------------
-- Engineer: Jarne De Clercq, Alexandre Leonard, Jelena Luetic
--
-- Create Date: 11/24/2016 05:04:35 PM
-- Description: Triggered data wrapper - multiple chips
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;

entity trigger_data_readout_wrapper is
  Port ( 
     clk320 : in std_logic;
     clk40 : in std_logic;
     reset_i : in std_logic;
     triggered_data_from_fe_i : in trig_data_from_fe_t;
     sync_from_CBC_i: in stub_lines_r_array;
     trig_data_to_hb_o : out triggered_data_frame_r
  );
end trigger_data_readout_wrapper;

architecture Structural of trigger_data_readout_wrapper is
    signal triggered_data_frame: triggered_data_frame_r_array(0 to NUM_CHIPS-1);

begin

    --== Instantiate the NCBC (or NMPA) front-end chips per hybrid blocks ==--
    CBCs:
    for I in 0 to NUM_CHIPS - 1 generate
        CBC_readout : entity work.triggered_data_readout(FSM)
        port map(
             clk320 => clk320,
             reset_i => reset_i,
             triggered_data_from_fe_i => triggered_data_from_fe_i(I),
             sync_from_CBC_i => sync_from_CBC_i(I).dp5,
             triggered_data_frame_o => triggered_data_frame(I)   
        );  
    end generate CBCs;

    -- == Sending triggered data to the hybrid block ==--
    allCBC_readout : entity work.triggered_data_all_CBCs
    port map(
        clk40 => clk40,
        reset_i => reset_i,
        triggered_data_frame_r_array_i => triggered_data_frame,
        trig_data_to_hb_o => trig_data_to_hb_o
    );

    
end Structural;
