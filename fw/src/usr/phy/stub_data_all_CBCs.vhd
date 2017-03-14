----------------------------------------------------------------------------------
-- Engineer: Jarne De Clercq, Alexandre Leonard, Jelena Luetic
-- 
-- Create Date: 11/29/2016 12:01:22 PM
-- Description: Wrapper for the stub readout block nedded to handle multiple chips 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;
use work.user_package.ALL;

entity stub_data_all_CBCs is
    port (
        clk320: in std_logic;
        reset_i: in std_logic; 
        -- stub lines from FE      
        stub_lines_i : in stub_lines_r_array;
        -- stub data to hybrid block
        cbc_data_to_hb_o: out one_cbc_stubs_r_array
    );
end stub_data_all_CBCs;

architecture Structural of stub_data_all_CBCs is   
    signal cbc_data_to_hb: one_cbc_stubs_r_array;

begin
    --== instantiate the NCBC (or NMPA) front-end chips per hybrid blocks ==--
    CBCs:
    for I in 0 to NUM_CHIPS - 1 generate
        Stub_readout : entity work.stub_data_readout
        port map (
            clk320 => clk320,
            reset_i => reset_i,
            -- input stub data from FE
            stub_data_from_fe_i => stub_lines_i(I),        
            -- output stub data frame to hybrid block
            stub_data_from_fe_o => cbc_data_to_hb(I)
        );

    end generate CBCs;
    -- connect stub data frame to the hybrid block
    cbc_data_to_hb_o <= cbc_data_to_hb;
end Structural;
