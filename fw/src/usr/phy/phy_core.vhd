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
     
    -- to cbc3 fast line
    signal cmd_fast_to_cbc          : std_logic;   
        
    --=====================================================================================--
    -- Buffered lines here
    --=====================================================================================--
    -- cbc buffered input
    signal cbc_lines_from_buf   : cbc_lines_from_buf_array_array(0 to NUM_HYBRIDS-1);    
    --=====================================================================================--
    
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
    
        cbc3_connect_inst: entity work.cbc3_connect
        port map(
            clk_320_i       => clk_320_i,
            clk_40_i        => clk_40,
            reset_i         => reset_i,
            cbc_lines_from_buf  => cbc_lines_from_buf,
            cmd_fast_to_cbc     => cmd_fast_to_cbc,
            
            trig_data_to_hb_o   => trig_data_o,
            stub_data_to_hb_o   => stub_data_o,
            
            emul_sda_miso_o     => sda_miso,
            emul_sda_mosi_i     => sda_mosi,
            emul_scl_i          => scl_mosi,
            emul_mmcm_ready     => mmcm_ready_i
        );
         
    end generate gen_readout_cbc3;
    
    gen_readout_cbc2: if CBC_VERSION = 2 generate  
    
        cbc2_connect_inst: entity work.cbc2_connect
        port map(
            clk_40_i        => clk_40,
            reset_i         => reset_i,
            cbc_lines_from_buf  => cbc_lines_from_buf,
            cmd_fast_to_cbc     => cmd_fast_to_cbc,
            
            trig_data_to_hb_o   => trig_data_o,
            stub_data_to_hb_o   => stub_data_o
        );
        
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
    
    
    --==================================================--
    -- Generates mapping for different implementations
    --==================================================--
    fmcio_mapping_core_inst: entity work.fmcio_mapping_core
    port map(
        --=================--
        -- Common Signals
        --=================--
        reset_i           => reset_i,
        scl_mosi          => scl_mosi,
        SDA_mosi_i        => sda_mosi,
        SDA_miso_o        => sda_miso,
        SDA_tri_i         => sda_tri,
        CBC_lines_o       => cbc_lines_from_buf,
        --=================--
        -- Signals To CBC2
        --=================--
        clk_40_i          => clk_40,
        fast_cmd_cbc2_i   => cmd_fast_i,
        --=================--
        -- Signals To CBC3
        --=================--
        clk_320_i         => clk_320_i,
        fast_cmd_cbc3_i   => cmd_fast_to_cbc,
        
        -- fmc ports
        fmc_l12_la_p        => fmc_l12_la_p,
        fmc_l12_la_n        => fmc_l12_la_n,
        fmc_l8_la_p         => fmc_l8_la_p,
        fmc_l8_la_n         => fmc_l8_la_n 
    ); 
    --==================================================--

end rtl;
