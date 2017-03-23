----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 09:39:46 AM
-- Design Name: 
-- Module Name: cbc3_connect - rtl
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

entity cbc3_connect is
Port (
    clk_320_i       : in std_logic;
    clk_40_i        : in std_logic;
    reset_i         : in std_logic;
    cbc_lines_from_buf  : in cbc_lines_from_buf_array_array(0 to NUM_HYBRIDS-1);
    cmd_fast_to_cbc     : in std_logic;
    
    trig_data_to_hb_o   : out triggered_data_frame_r_array(0 to NUM_HYBRIDS-1);
    stub_data_to_hb_o   : out stub_data_to_hb_t_array(0 to NUM_HYBRIDS-1);     
    
    emul_sda_miso_o : out std_logic_vector(0 to NUM_HYBRIDS-1);
    emul_sda_mosi_i : in std_logic_vector(0 to NUM_HYBRIDS-1);
    emul_scl_i      : in std_logic_vector(0 to NUM_HYBRIDS-1);
    emul_mmcm_ready : in std_logic
);
end cbc3_connect;

architecture rtl of cbc3_connect is

    -- triggered data lines from CBC
    signal trig_data                : trig_data_from_fe_t_array(0 to NUM_HYBRIDS-1);
    -- stubs lines from CBC
    signal stub_data_cbc3           : stub_lines_r_array_array(0 to NUM_HYBRIDS-1);        

begin

--== readout real lines ==--
gen_lines: if IMPLEMENTATION /= EMULATION_CBC3 generate
  
    ITER_HYBRID: for I in 0 to NUM_HYBRIDS-1 generate
        ITER_CHIP : for J in 0 to NUM_CHIPS-1 generate
            trig_data(I)(J) <= cbc_lines_from_buf(I)(J)(0);
            stub_data_cbc3(I)(J).dp1 <= cbc_lines_from_buf(I)(J)(1);
            stub_data_cbc3(I)(J).dp2 <= cbc_lines_from_buf(I)(J)(2);
            stub_data_cbc3(I)(J).dp3 <= cbc_lines_from_buf(I)(J)(3);
            stub_data_cbc3(I)(J).dp4 <= cbc_lines_from_buf(I)(J)(4);
            stub_data_cbc3(I)(J).dp5 <= cbc_lines_from_buf(I)(J)(5);                
        end generate ITER_CHIP;
    end generate ITER_HYBRID;
    
end generate gen_lines;

--== readout emulator lines ==--
gen_emulator: if IMPLEMENTATION = EMULATION_CBC3 generate
        
        -- cbc3 emulator, enabled with EMULATE_CBC3 variable in user_package 
        CBC3_emulator : entity work.CBC3_generator
        port map(
            
            reset_i => reset_i,
            
            clk320_i =>  clk_320_i,
            cmd_fast_i => cmd_fast_to_cbc,
            trig_data_o => trig_data,
            stub_data_o => stub_data_cbc3,
            sda_miso_o_top => emul_sda_miso_o,
            sda_mosi_i_top => emul_sda_mosi_i,
            scl_i => emul_scl_i,
            mmcm_ready_i => emul_mmcm_ready
        );
        
end generate gen_emulator;

--== triggered data readout block ==--
gen_trig_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
    trigger_data_readout_wrapper_inst : entity work.trigger_data_readout_wrapper
    port map (
        clk320 => clk_320_i,
        clk40 => clk_40_i,
        reset_i => reset_i,
        triggered_data_from_fe_i => trig_data(index),
        sync_from_CBC_i => stub_data_cbc3(index),
        trig_data_to_hb_o => trig_data_to_hb_o(index)
    );
end generate gen_trig_data_readout; 

--== stub lines block ==--
gen_stub_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
   stub_data_readout_inst : entity work.stub_data_all_CBCs
    port map (
        clk320 => clk_320_i,
        reset_i => reset_i,       
        stub_lines_i =>  stub_data_cbc3(index),
        cbc_data_to_hb_o => stub_data_to_hb_o(index)
    );
end generate gen_stub_data_readout;


end rtl;
