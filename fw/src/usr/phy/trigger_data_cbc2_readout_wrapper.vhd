----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko (template from Jarne, Jarne De Clercq, Alexandre Leonard, Jelena Luetic)
-- Create Date: 03/15/2017 07:26:46 PM
-- Module Name: trigger_data_cbc2_readout_wrapper - rtl
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

entity trigger_data_cbc2_readout_wrapper is
Port( 
    clk40 : in std_logic;
    reset_i : in std_logic;
    triggered_data_from_fe_i : in trig_data_from_fe_t;
    stub_from_CBC_i: in stub_lines_r_cbc2_array;
    trig_data_to_hb_o : out triggered_data_frame_r
);
end trigger_data_cbc2_readout_wrapper;

architecture rtl of trigger_data_cbc2_readout_wrapper is
    signal triggered_data_frame: triggered_data_frame_r_array(0 to NUM_CHIPS-1);

begin

    --== Instantiate the NCBC front-end chips per hybrid blocks ==--
    CBCs:
    for I in 0 to NUM_CHIPS - 1 generate
        CBC_readout : entity work.triggered_data_CBC2_readout
        port map(
             clk40 => clk40,
             reset_i => reset_i,
             triggered_data_from_fe_i => triggered_data_from_fe_i(I),
             stub_from_CBC_i => stub_from_CBC_i(I),
             triggered_data_frame_o => triggered_data_frame(I)   
        );  
    end generate CBCs;
    
    trig_data_to_hb_o <= triggered_data_frame(0);

    -- == Sending triggered data to the hybrid block ==--
--    allCBC_readout : entity work.triggered_data_all_CBCs
--    port map(
--        clk40 => clk40,
--        reset_i => reset_i,
--        triggered_data_frame_r_array_i => triggered_data_frame,
--        trig_data_to_hb_o => trig_data_to_hb_o
--    );

end rtl;
