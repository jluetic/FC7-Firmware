----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 09:39:46 AM
-- Design Name: 
-- Module Name: cbc2_connect - rtl
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

entity cbc2_connect is
Port (
    clk_40_i        : in std_logic;
    reset_i         : in std_logic;
    cbc_lines_from_buf  : in cbc_lines_from_buf_array_array(0 to NUM_HYBRIDS-1);
    cmd_fast_to_cbc     : in std_logic;
    
    trig_data_to_hb_o   : out triggered_data_frame_r_array(0 to NUM_HYBRIDS-1);
    stub_data_to_hb_o   : out stub_data_to_hb_t_array(0 to NUM_HYBRIDS-1)
);
end cbc2_connect;

architecture rtl of cbc2_connect is
    
    -- triggered data lines from CBC
    signal trig_data                : trig_data_from_fe_t_array(0 to NUM_HYBRIDS-1);
    -- stubs from cbc2
    signal stub_data_cbc2           : stub_lines_r_cbc2_array_array(0 to NUM_HYBRIDS-1);  

begin

--== readout real lines ==--
gen_lines: if IMPLEMENTATION /= EMULATION_CBC3 generate
  
    ITER_HYBRID: for I in 0 to NUM_HYBRIDS-1 generate
        ITER_CHIP : for J in 0 to NUM_CHIPS-1 generate
            trig_data(I)(J) <= cbc_lines_from_buf(I)(J)(0);
            stub_data_cbc2(I)(J) <= cbc_lines_from_buf(I)(J)(1);       
        end generate ITER_CHIP;
    end generate ITER_HYBRID;
    
end generate gen_lines;

--== triggered data readout block ==--
gen_trig_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
    trigger_data_readout_wrapper_inst : entity work.trigger_data_cbc2_readout_wrapper
    port map (
        clk40 => clk_40_i,
        reset_i => reset_i,
        triggered_data_from_fe_i => trig_data(index),
        stub_from_CBC_i => stub_data_cbc2(index),
        trig_data_to_hb_o => trig_data_to_hb_o(index)
    );
end generate gen_trig_data_readout; 

--== stub lines block ==--
gen_stub_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
   stub_data_readout_inst : entity work.stub_data_all_CBC2
    port map (
        clk40 => clk_40_i,
        stub_lines_i =>  stub_data_cbc2(index),
        cbc_data_to_hb_o => stub_data_to_hb_o(index)
    );
end generate gen_stub_data_readout;

end rtl;
