----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 03/15/2017 02:34:32 PM
-- Module Name: fmcio_mapping_one_hybrid - rtl
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.user_package.all;
use work.fmcio_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fmcio_mapping_one_hybrid is
Generic(
    FMC_TYPE          : fmc_hardware_type := FMC_NONE
);
Port(
    --=================--
    -- Common Signals
    --=================--
    reset_i           : in std_logic; 
    SCL_i             : in std_logic;   
    SDA_mosi_i        : in std_logic;
    SDA_miso_o        : out std_logic;
    SDA_tri_i         : in std_logic;       
    CBC_lines_o       : out cbc_lines_from_buf_array;
    --=================--
    -- Signals To CBC2
    --=================--
    clk40_i             : in std_logic;
    fast_cmd_cbc2_i     : in cmd_fastbus;   
    --=================--
    -- Signals To CBC3
    --=================--
    clk320_i            : in std_logic;
    fast_cmd_cbc3_i     : in std_logic;
    
    -- fmc ports
    fmc_la_p        : inout std_logic_vector(33 downto 0);
    fmc_la_n        : inout std_logic_vector(33 downto 0)
);
end fmcio_mapping_one_hybrid;

architecture rtl of fmcio_mapping_one_hybrid is

    signal clk320_i_oddr : std_logic;
    signal clk40_i_oddr : std_logic;
    
    -- 8cbc2 signals
    signal signals_from_8cbc2    : std_logic_vector(fmc_8cbc2_in_id.na-1 downto 0);
    signal signals_to_8cbc2      : std_logic_vector(fmc_8cbc2_out_id.na-1 downto 0);
    
    -- 2cbc2 signals
    signal signals_from_2cbc2    : std_logic_vector(fmc_2cbc2_in_id.na-1 downto 0);
    signal signals_to_2cbc2      : std_logic_vector(fmc_2cbc2_out_id.na-1 downto 0);

begin

gen_cbc2: if CBC_VERSION = 2 generate
    
    clk40_oddr : oddr
    generic map(
        ddr_clk_edge    => "opposite_edge",
        init            => '0',
        srtype          => "sync"
    )
    port map (
        q               => clk40_i_oddr,
        c               => clk40_i,
        ce              => '1',
        d1              => '1',
        d2              => '0',
        r               => '0',
        s               => '0'
        );

    gen_8cbc2: if FMC_TYPE = FMC_8CBC2 generate
    
        --===========================================--
        -- Buffers for 8CBC2
        fmcpin_map_gen : for i in 0 to 33 generate
        --===========================================--
            -- input
            fmc_la_ibuf_gen: if io_map_8cbc2(i).fmc_dir = "i" generate
                
                dummy_lvds_ibuf_gen: if io_map_8cbc2(i).sig_id = fmc_8cbc2_in_id.na generate
                    fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => open, i => fmc_la_p(i), ib => fmc_la_n(i) );
                end generate dummy_lvds_ibuf_gen;
            
                sig_lvds_ibuf_gen: if io_map_8cbc2(i).sig_id /= fmc_8cbc2_in_id.na generate
                    gen_good_polarity: if NOT io_map_8cbc2(i).wrong_pol generate
                        fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => signals_from_8cbc2(io_map_8cbc2(i).sig_id), i => fmc_la_p(i), ib => fmc_la_n(i) );                                                                                                                        
                    end generate gen_good_polarity;
                    gen_wrong_polarity: if io_map_8cbc2(i).wrong_pol generate
                        fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => signals_from_8cbc2(io_map_8cbc2(i).sig_id), i => not fmc_la_p(i), ib => not fmc_la_n(i) );                                                                                                                        
                    end generate gen_wrong_polarity;
                end generate sig_lvds_ibuf_gen;
            end generate fmc_la_ibuf_gen;    
        
            -- output
            fmc_la_obuf_gen: if io_map_8cbc2(i).fmc_dir = "o" generate
        
                dummy_lvds_obuf_gen: if io_map_8cbc2(i).sig_id = fmc_8cbc2_out_id.na generate
                    fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => '0' );
                end generate dummy_lvds_obuf_gen;
                
                sig_lvds_obuf_gen: if io_map_8cbc2(i).sig_id /= fmc_8cbc2_out_id.na generate
                    gen_good_polarity: if NOT io_map_8cbc2(i).wrong_pol generate                                                             
                        fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => signals_to_8cbc2(io_map_8cbc2(i).sig_id) );
                    end generate gen_good_polarity; 
                    
                    gen_wrong_polarity: if io_map_8cbc2(i).wrong_pol generate                                                             
                        fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => not signals_to_8cbc2(io_map_8cbc2(i).sig_id) );
                    end generate gen_wrong_polarity;
                end generate sig_lvds_obuf_gen;
        
            end generate fmc_la_obuf_gen;    
        end generate fmcpin_map_gen;
        --===========================================--
        
        SDA_miso_o <= signals_from_8cbc2(fmc_8cbc2_in_id.sda_from_cbc);
        CBC_lines_o(0)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc0_trigdata);
        CBC_lines_o(0)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc0_stubdata);
        CBC_lines_o(1)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc1_trigdata);
        CBC_lines_o(1)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc1_stubdata);
        CBC_lines_o(2)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc2_trigdata);
        CBC_lines_o(2)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc2_stubdata);
        CBC_lines_o(3)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc3_trigdata);
        CBC_lines_o(3)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc3_stubdata);
        CBC_lines_o(4)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc4_trigdata);
        CBC_lines_o(4)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc4_stubdata);
        CBC_lines_o(5)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc5_trigdata);
        CBC_lines_o(5)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc5_stubdata);
        CBC_lines_o(6)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc6_trigdata);
        CBC_lines_o(6)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc6_stubdata);
        CBC_lines_o(7)(0) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc7_trigdata);
        CBC_lines_o(7)(1) <= signals_from_8cbc2(fmc_8cbc2_in_id.cbc7_stubdata);
        
        signals_to_8cbc2(fmc_8cbc2_out_id.clk) <= clk40_i_oddr;
        signals_to_8cbc2(fmc_8cbc2_out_id.scl) <= SCL_i;
        signals_to_8cbc2(fmc_8cbc2_out_id.sda_to_cbc) <= SDA_mosi_i;
        signals_to_8cbc2(fmc_8cbc2_out_id.hard_reset) <= reset_i;
        signals_to_8cbc2(fmc_8cbc2_out_id.fast_reset) <= fast_cmd_cbc2_i.fast_reset;
        signals_to_8cbc2(fmc_8cbc2_out_id.i2c_refresh) <= fast_cmd_cbc2_i.i2c_refresh;
        signals_to_8cbc2(fmc_8cbc2_out_id.test_pulse) <= fast_cmd_cbc2_i.test_pulse_trigger;
        signals_to_8cbc2(fmc_8cbc2_out_id.l1a) <= fast_cmd_cbc2_i.trigger;
        
    end generate gen_8cbc2;
    
    gen_2cbc2: if FMC_TYPE = FMC_2CBC2 generate    
       
        --===========================================--
        -- Buffers for 2CBC2
        fmcpin_map_gen : for i in 0 to 33 generate
        --===========================================--
            -- input
            fmc_la_ibuf_gen: if io_map_2cbc2(i).fmc_dir = "i" generate
            
                dummy_lvds_ibuf_gen: if io_map_2cbc2(i).sig_id = fmc_2cbc2_in_id.na generate
                    fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => open, i => fmc_la_p(i), ib => fmc_la_n(i) );
                end generate dummy_lvds_ibuf_gen;
                
                sig_lvds_ibuf_gen: if io_map_2cbc2(i).sig_id /= fmc_2cbc2_in_id.na generate
                    gen_good_polarity: if NOT io_map_2cbc2(i).wrong_pol generate
                        fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => signals_from_2cbc2(io_map_2cbc2(i).sig_id), i => fmc_la_p(i), ib => fmc_la_n(i) );                                                                                                                        
                    end generate gen_good_polarity;
                    gen_wrong_polarity: if io_map_2cbc2(i).wrong_pol generate
                        fmc_la_ibufds : ibufds generic map(  IOSTANDARD => "LVDS_25", DIFF_TERM => TRUE ) port map( o => signals_from_2cbc2(io_map_2cbc2(i).sig_id), i => not fmc_la_p(i), ib => not fmc_la_n(i) );                                                                                                                        
                    end generate gen_wrong_polarity;
                end generate sig_lvds_ibuf_gen;
            end generate fmc_la_ibuf_gen;    
        
            -- output
            fmc_la_obuf_gen: if io_map_2cbc2(i).fmc_dir = "o" generate
        
                dummy_lvds_obuf_gen: if io_map_2cbc2(i).sig_id = fmc_2cbc2_out_id.na generate
                    fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => '0' );
                end generate dummy_lvds_obuf_gen;
                
                sig_lvds_obuf_gen: if io_map_2cbc2(i).sig_id /= fmc_2cbc2_out_id.na generate
                    gen_good_polarity: if NOT io_map_2cbc2(i).wrong_pol generate                                                             
                        fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => signals_to_2cbc2(io_map_2cbc2(i).sig_id) );
                    end generate gen_good_polarity; 
                    
                    gen_wrong_polarity: if io_map_2cbc2(i).wrong_pol generate                                                             
                        fmc_la_obufds : obufds generic map( IOSTANDARD => "LVDS_25" ) port map( o => fmc_la_p(i), ob => fmc_la_n(i), i => not signals_to_2cbc2(io_map_2cbc2(i).sig_id) );
                    end generate gen_wrong_polarity;
                end generate sig_lvds_obuf_gen;
        
            end generate fmc_la_obuf_gen;    
        end generate fmcpin_map_gen;
        --===========================================--
        
        SDA_miso_o <= signals_from_2cbc2(fmc_2cbc2_in_id.sda_from_cbc);
        CBC_lines_o(0)(0) <= signals_from_2cbc2(fmc_2cbc2_in_id.cbc0_trigdata);
        CBC_lines_o(0)(1) <= signals_from_2cbc2(fmc_2cbc2_in_id.cbc0_stubdata);
        CBC_lines_o(1)(0) <= signals_from_2cbc2(fmc_2cbc2_in_id.cbc1_trigdata);
        CBC_lines_o(1)(1) <= signals_from_2cbc2(fmc_2cbc2_in_id.cbc1_stubdata);
        
        signals_to_2cbc2(fmc_2cbc2_out_id.clk) <= clk40_i_oddr;
        signals_to_2cbc2(fmc_2cbc2_out_id.scl) <= SCL_i;
        signals_to_2cbc2(fmc_2cbc2_out_id.sda_to_cbc) <= SDA_mosi_i;
        signals_to_2cbc2(fmc_2cbc2_out_id.hard_reset) <= reset_i;
        signals_to_2cbc2(fmc_2cbc2_out_id.fast_reset) <= fast_cmd_cbc2_i.fast_reset;
        signals_to_2cbc2(fmc_2cbc2_out_id.i2c_refresh) <= fast_cmd_cbc2_i.i2c_refresh;
        signals_to_2cbc2(fmc_2cbc2_out_id.test_pulse) <= fast_cmd_cbc2_i.test_pulse_trigger;
        signals_to_2cbc2(fmc_2cbc2_out_id.l1a) <= fast_cmd_cbc2_i.trigger;
        
    end generate gen_2cbc2;
end generate gen_cbc2;

gen_cbc3: if CBC_VERSION = 3 generate

        clk320_oddr : oddr
        generic map(
            ddr_clk_edge    => "opposite_edge",
            init            => '0',
            srtype          => "sync"
        )
        port map (
            q               => clk320_i_oddr,
            c               => clk320_i,
            ce              => '1',
            d1              => '1',
            d2              => '0',
            r               => '0',
            s               => '0'
        );
        
end generate gen_cbc3;


end rtl;
