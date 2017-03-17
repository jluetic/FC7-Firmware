----------------------------------------------------------------------------------
-- Engineer: Jarne De Clercq, Alexandre Leonard, Jelena Luetic
-- Create Date: 11/08/2016 01:00:19 PM
-- Description: core block of the phy layer instantiating (and connecting) the fast commmand, i2c, triggered data and stub data
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;
use work.fmcio_package.all;

entity phy_core is
    port (    
        -- input clocks
        clk_40              : in std_logic;
        clk_320_i           : in std_logic;      
         
        -- reset to phy_core
        reset_i             : in std_logic;   
       
        -- fast command input bus
        cmd_fast_i          : in cmd_fastbus;     
         
        -- hybrid block interface for triggered data
        -- trig_data_o         : out trig_data_to_hb_t_array(0 to NUM_HYBRID-1);
        trig_data_o         : out triggered_data_frame_r_array(0 to NUM_HYBRIDS-1);

        -- hybrid block interface for stub data
        stub_data_o         : out stub_data_to_hb_t_array(0 to NUM_HYBRIDS-1);       
                
        -- slow control command from command generator
        cmd_request_i       : in cmd_wbus;
        
        -- slow control response to command generator
        cmd_reply_o         : out cmd_rbus;       
        
        -- lock to mmcm clock
        mmcm_ready_i : in std_logic;
        
        -- fmc ports
        fmc_i2c_scl         : inout std_logic;
        fmc_i2c_sda         : inout std_logic;
        fmc_l12_la_p        : inout std_logic_vector(33 downto 0);
        fmc_l12_la_n        : inout std_logic_vector(33 downto 0);
        fmc_l8_la_p         : inout std_logic_vector(33 downto 0);
        fmc_l8_la_n         : inout std_logic_vector(33 downto 0)        
    );
end phy_core;

architecture rtl of phy_core is

    -- slow control signals
    signal cmd_request              : cmd_wbus_array(0 to NUM_HYBRIDS-1);
    signal cmd_reply                : cmd_rbus_array(0 to NUM_HYBRIDS-1);
    signal scl_mosi                 : std_logic_vector(0 to NUM_HYBRIDS-1) := (others => '1');

    signal sda_mosi : std_logic_vector(0 to NUM_HYBRIDS-1) := (others => '1');
    signal sda_miso : std_logic_vector(0 to NUM_HYBRIDS-1) := (others => '1');
    signal sda_tri : std_logic_vector(0 to NUM_HYBRIDS-1) := (others => '1');    
    
    -- triggered data lines from CBC
    signal trig_data                : trig_data_from_fe_t_array(0 to NUM_HYBRIDS-1);            
    -- stubs lines from CBC
    signal stub_data_cbc3           : stub_lines_r_array_array(0 to NUM_HYBRIDS-1);        
    -- to cbc3 fast line
    signal cmd_fast_to_cbc          : std_logic;
    
    -- stubs from cbc2
    signal stub_data_cbc2           : stub_lines_r_cbc2_array_array(0 to NUM_HYBRIDS-1);  
    
    --=====================================================================================--
    -- Buffered lines here
    --=====================================================================================--
    -- cbc buffered input
    signal cbc_lines_from_buf   : cbc_lines_from_buf_array_array(0 to NUM_HYBRIDS-1);
    
    --=====================================================================================--
    
    --==========================================================--
    -- Signals to buffer here
    --==========================================================--
    -- lines from cbc (stubs + data)
    signal cbc_dp_to_buf : cbc_dp_to_buf_array_array(0 to NUM_HYBRIDS-1);
    --==========================================================--
    
    -- temporary for implementation
    attribute keep: boolean;
    attribute keep of clk_320_i: signal is true;  
    attribute keep of cmd_fast_to_cbc: signal is true;
    attribute keep of trig_data_o: signal is true;
    
    -- i2c address map needs to be different for different fmcs
    signal i2c_address_map:     i2c_address_map_type_array(0 to NUM_HYBRIDS-1);
    
begin

    --== fast command block ==--
    fast_cmd_inst: entity work.fast_cmd_block
    port map (
        clk40 => clk_40,
        clk320 => clk_320_i,
        reset_i => reset_i,
        fast_cmd_i => cmd_fast_i,
        fast_cmd_o => cmd_fast_to_cbc,
        mmcm_ready_i => mmcm_ready_i
    );

    --== slow control block ==--
    -- muxdemux to select which hybrid is concerned for slow control
    slow_control_muxdemux_inst : entity work.slow_control_muxdemux
    port map (
        clk => clk_40,
        reset_i => reset_i,
        cmd_request_i => cmd_request_i,
        cmd_request_o => cmd_request,
        cmd_reply_i => cmd_reply,
        cmd_reply_o => cmd_reply_o
    );
    
    -- i2c master cores for the NUM_HYBRIDS
    gen_i2c: for index in 0 to NUM_HYBRIDS-1 generate
        phy_i2c_wrapper_inst : entity work.phy_i2c_wrapper
        port map (
            clk => clk_40,
            reset => reset_i,
            i2c_address_map => i2c_address_map(index),
            cmd_request => cmd_request(index),
            cmd_reply => cmd_reply(index),
            scl_mosi => scl_mosi(index),        
            sda_miso_to_master => sda_miso(index),
            sda_mosi_to_slave => sda_mosi(index),
            master_sda_tri => sda_tri(index)
        );
    end generate gen_i2c;
 
    
    gen_readout_cbc3: if CBC_VERSION = 3 generate
    
        --== readout real lines ==--
        gen_lines: if (NOT EMULATE_CBC3) generate
          
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
        gen_emulator: if (EMULATE_CBC3) generate
                
                -- cbc3 emulator, enabled with EMULATE_CBC3 variable in user_package 
                CBC3_emulator : entity work.CBC3_generator
                port map(
                    
                    reset_i => reset_i,
                    
                    clk320_i =>  clk_320_i,
                    cmd_fast_i => cmd_fast_to_cbc,
                    trig_data_o => trig_data,
                    stub_data_o => stub_data_cbc3,
                    sda_miso_o_top => sda_miso,
                    sda_mosi_i_top => sda_mosi,
                    scl_i => scl_mosi,
                    mmcm_ready_i => mmcm_ready_i
                );
                
        end generate gen_emulator;
    
        --== triggered data readout block ==--
        gen_trig_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
            trigger_data_readout_wrapper_inst : entity work.trigger_data_readout_wrapper
            port map (
                clk320 => clk_320_i,
                clk40 => clk_40,
                reset_i => reset_i,
                triggered_data_from_fe_i => trig_data(index),
                sync_from_CBC_i => stub_data_cbc3(index),
                trig_data_to_hb_o => trig_data_o(index)
            );
        end generate gen_trig_data_readout; 
   
        --== stub lines block ==--
        gen_stub_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
           stub_data_readout_inst : entity work.stub_data_all_CBCs
            port map (
                clk320 => clk_320_i,
                reset_i => reset_i,       
                stub_lines_i =>  stub_data_cbc3(index),
                cbc_data_to_hb_o => stub_data_o(index)
            );
        end generate gen_stub_data_readout;
        
    end generate gen_readout_cbc3;
    
    gen_readout_cbc2: if CBC_VERSION = 2 generate  
    
        --== readout real lines ==--
        gen_lines: if (NOT EMULATE_CBC3) generate
          
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
                clk320 => clk_320_i,
                clk40 => clk_40,
                reset_i => reset_i,
                triggered_data_from_fe_i => trig_data(index),
                stub_from_CBC_i => stub_data_cbc2(index),
                trig_data_to_hb_o => trig_data_o(index)
            );
        end generate gen_trig_data_readout; 
    
        --== stub lines block ==--
        gen_stub_data_readout : for index in 0 to NUM_HYBRIDS-1 generate
           stub_data_readout_inst : entity work.stub_data_all_CBC2
            port map (
                clk40 => clk_40,
                stub_lines_i =>  stub_data_cbc2(index),
                cbc_data_to_hb_o => stub_data_o(index)
            );
        end generate gen_stub_data_readout;
        
    end generate gen_readout_cbc2;
    
    --=========================================================--
    -- I2C Address map generation
    --=========================================================--
    -- temporary address map for cbc3;
    gen_i2c_address_map_cbc3: if CBC_VERSION = 3 generate
        gen_i2c_address_map_2cbc3: if NUM_CHIPS = 2 generate
            iteration: for index in 0 to NUM_HYBRIDS-1 generate
                i2c_address_map(index) <= i2c_address_map_2cbc3;
            end generate iteration;    
        end generate gen_i2c_address_map_2cbc3;
        
        gen_i2c_address_map_8cbc3: if NUM_CHIPS = 8 generate
            iteration: for index in 0 to NUM_HYBRIDS-1 generate
                i2c_address_map(index) <= i2c_address_map_8cbc3;
            end generate iteration;    
        end generate gen_i2c_address_map_8cbc3;
    end generate gen_i2c_address_map_cbc3;
    
    -- electrical address map for cbc2;
    gen_i2c_address_map_cbc2: if CBC_VERSION = 2 generate
        gen_i2c_address_map_2cbc2: if NUM_CHIPS = 2 generate
            iteration: for index in 0 to NUM_HYBRIDS-1 generate
                i2c_address_map(index) <= i2c_address_map_2cbc2;
            end generate iteration;    
        end generate gen_i2c_address_map_2cbc2;
        
        gen_i2c_address_map_8cbc2: if NUM_CHIPS = 8 generate
            iteration: for index in 0 to NUM_HYBRIDS-1 generate
                i2c_address_map(index) <= i2c_address_map_8cbc2;
            end generate iteration;    
        end generate gen_i2c_address_map_8cbc2;
    end generate gen_i2c_address_map_cbc2;
    --=========================================================--
    
    
    --===========================================================================--
    -- HERE WE CONNECT TO THE CORRESPONDING FMC's    
    gen_io: if (NOT EMULATE_CBC3) generate
    --===========================================================================--
    
    -- !!! NOTICE: for electrical implementation we will always have only one Hybrid per FMC,
    -- that's why iteration through hybrids is senseless. Here we assume, that maximum possible 
    -- number of hybrids is 2 (in case that both FMC's are connected). If only one FMC contains Hybrid -> then 
    -- it's assumed to be hybrid(0) (not important, which FMC), if there are two, then :
    -- (!!!!!!!) fmc1 - hybrid(0), fmc2 - hybrid(1).
    
    --== case of one hybrid ==---
    one_hybrid: if NUM_HYBRIDS = 1 generate    
        -- connected to FMC1
        gen_fmc1: if (FMC1 = FMC_8CBC2) or (FMC1 = FMC_2CBC2) or (FMC1 = FMC_2CBC3) or (FMC1 = FMC_8CBC3) generate
            fmcio_mapping_core_inst : entity work.fmcio_mapping_core
            Generic map (
                FMC_TYPE        => FMC1
            )
            Port map (                       
                reset_i          => reset_i,
                SCL_i  => scl_mosi(0),
                SDA_mosi_i => sda_mosi(0),
                SDA_miso_o => sda_miso(0),
                SDA_tri_i => sda_tri(0),
                CBC_lines_o => cbc_lines_from_buf(0),
                
                clk40_i    => clk_40,
                fast_cmd_cbc2_i => cmd_fast_i,
                
                clk320_i    => clk_320_i,
                fast_cmd_cbc3_i       => cmd_fast_to_cbc,
                
                fmc_la_p        => fmc_l12_la_p,
                fmc_la_n        => fmc_l12_la_n            
            ); 
        end generate gen_fmc1;
        
        -- connected to FMC2
        gen_fmc2: if (FMC2 = FMC_8CBC2) or (FMC2 = FMC_2CBC2) or (FMC2 = FMC_2CBC3) or (FMC2 = FMC_8CBC3) generate
            fmcio_mapping_core_inst : entity work.fmcio_mapping_core
            Generic map (
                FMC_TYPE        => FMC2
            )
            Port map (                       
                reset_i          => reset_i,
                SCL_i  => scl_mosi(0),
                SDA_mosi_i => sda_mosi(0),
                SDA_miso_o => sda_miso(0),
                SDA_tri_i => sda_tri(0),
                CBC_lines_o => cbc_lines_from_buf(0),
                
                clk40_i    => clk_40,
                fast_cmd_cbc2_i => cmd_fast_i,
                
                clk320_i    => clk_320_i,
                fast_cmd_cbc3_i       => cmd_fast_to_cbc,
                
                fmc_la_p        => fmc_l8_la_p,
                fmc_la_n        => fmc_l8_la_n            
            ); 
        end generate gen_fmc2;    
    end generate one_hybrid;
    
    --== case of two hybrids ==---
    two_hybrids: if NUM_HYBRIDS = 2 generate    
        -- connected to FMC1
        gen_fmc1: if (FMC1 = FMC_8CBC2) or (FMC1 = FMC_2CBC2) or (FMC1 = FMC_2CBC3) or (FMC1 = FMC_8CBC3) generate
            fmcio_mapping_core_inst : entity work.fmcio_mapping_core
            Generic map (
                FMC_TYPE        => FMC1
            )
            Port map (                       
                reset_i          => reset_i,
                SCL_i  => scl_mosi(0),
                SDA_mosi_i => sda_mosi(0),
                SDA_miso_o => sda_miso(0),
                SDA_tri_i => sda_tri(0),
                CBC_lines_o => cbc_lines_from_buf(0),
                
                clk40_i    => clk_40,
                fast_cmd_cbc2_i => cmd_fast_i,
                
                clk320_i    => clk_320_i,
                fast_cmd_cbc3_i       => cmd_fast_to_cbc,
                
                fmc_la_p        => fmc_l12_la_p,
                fmc_la_n        => fmc_l12_la_n            
            ); 
        end generate gen_fmc1;
        
        -- connected to FMC2
        gen_fmc2: if (FMC2 = FMC_8CBC2) or (FMC2 = FMC_2CBC2) or (FMC2 = FMC_2CBC3) or (FMC2 = FMC_8CBC3) generate
            fmcio_mapping_core_inst : entity work.fmcio_mapping_core
            Generic map (
                FMC_TYPE        => FMC2
            )
            Port map (                       
                reset_i          => reset_i,
                SCL_i  => scl_mosi(1),
                SDA_mosi_i => sda_mosi(1),
                SDA_miso_o => sda_miso(1),
                SDA_tri_i => sda_tri(1),
                CBC_lines_o => cbc_lines_from_buf(1),
                
                clk40_i    => clk_40,
                fast_cmd_cbc2_i => cmd_fast_i,
                
                clk320_i    => clk_320_i,
                fast_cmd_cbc3_i       => cmd_fast_to_cbc,
                
                fmc_la_p        => fmc_l8_la_p,
                fmc_la_n        => fmc_l8_la_n            
            ); 
        end generate gen_fmc2;    
    end generate two_hybrids;
        
    --===========================================================================--    
    end generate gen_io;   
    --===========================================================================--
end rtl;
