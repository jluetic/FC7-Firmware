----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2017 10:26:26 AM
-- Design Name: 
-- Module Name: fmcio_mapping_core - rtl
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

entity fmcio_mapping_core is
Port (
   --=================--
   -- Common Signals
   --=================--
   reset_i           : in std_logic; 
   scl_mosi          : in std_logic_vector(0 to NUM_HYBRIDS-1);   
   SDA_mosi_i        : in std_logic_vector(0 to NUM_HYBRIDS-1);
   SDA_miso_o        : out std_logic_vector(0 to NUM_HYBRIDS-1);
   SDA_tri_i         : in std_logic_vector(0 to NUM_HYBRIDS-1);       
   CBC_lines_o       : out cbc_lines_from_buf_array_array;
   --=================--
   -- Signals To CBC2
   --=================--
   clk_40_i             : in std_logic;
   fast_cmd_cbc2_i     : in cmd_fastbus;   
   --=================--
   -- Signals To CBC3
   --=================--
   clk_320_i            : in std_logic;
   fast_cmd_cbc3_i     : in std_logic;
   
   -- fmc ports
   fmc_l12_la_p        : inout std_logic_vector(33 downto 0);
   fmc_l12_la_n        : inout std_logic_vector(33 downto 0);
   fmc_l8_la_p         : inout std_logic_vector(33 downto 0);
   fmc_l8_la_n         : inout std_logic_vector(33 downto 0) 
);
end fmcio_mapping_core;

architecture rtl of fmcio_mapping_core is

begin

--===========================================================================--
-- ELECTRICAL IMPLEMENTATION
gen_electrical: if IMPLEMENTATION = ELECTRICAL generate
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
        fmcio_mapping_one_hybrid_inst : entity work.fmcio_mapping_one_hybrid
        Generic map (
            FMC_TYPE        => FMC1
        )
        Port map (                       
            reset_i          => reset_i,
            SCL_i  => scl_mosi(0),
            SDA_mosi_i => SDA_mosi_i(0),
            SDA_miso_o => SDA_miso_o(0),
            SDA_tri_i => SDA_tri_i(0),
            CBC_lines_o => CBC_lines_o(0),
            
            clk40_i    => clk_40_i,
            fast_cmd_cbc2_i => fast_cmd_cbc2_i,
            
            clk320_i    => clk_320_i,
            fast_cmd_cbc3_i       => fast_cmd_cbc3_i,
            
            fmc_la_p        => fmc_l12_la_p,
            fmc_la_n        => fmc_l12_la_n            
        ); 
    end generate gen_fmc1;
    
    -- connected to FMC2
    gen_fmc2: if (FMC2 = FMC_8CBC2) or (FMC2 = FMC_2CBC2) or (FMC2 = FMC_2CBC3) or (FMC2 = FMC_8CBC3) generate
        fmcio_mapping_one_hybrid_inst : entity work.fmcio_mapping_one_hybrid
        Generic map (
            FMC_TYPE        => FMC2
        )
        Port map (                       
            reset_i          => reset_i,
            SCL_i  => scl_mosi(0),
            SDA_mosi_i => SDA_mosi_i(0),
            SDA_miso_o => SDA_miso_o(0),
            SDA_tri_i => SDA_tri_i(0),
            CBC_lines_o => CBC_lines_o(0),
            
            clk40_i    => clk_40_i,
            fast_cmd_cbc2_i => fast_cmd_cbc2_i,
            
            clk320_i    => clk_320_i,
            fast_cmd_cbc3_i       => fast_cmd_cbc3_i,
            
            fmc_la_p        => fmc_l8_la_p,
            fmc_la_n        => fmc_l8_la_n            
        ); 
    end generate gen_fmc2;    
end generate one_hybrid;

--== case of two hybrids ==---
two_hybrids: if NUM_HYBRIDS = 2 generate    
    -- connected to FMC1
    gen_fmc1: if (FMC1 = FMC_8CBC2) or (FMC1 = FMC_2CBC2) or (FMC1 = FMC_2CBC3) or (FMC1 = FMC_8CBC3) generate
        fmcio_mapping_one_hybrid_inst : entity work.fmcio_mapping_one_hybrid
        Generic map (
            FMC_TYPE        => FMC1
        )
        Port map (                       
            reset_i          => reset_i,
            SCL_i  => scl_mosi(0),
            SDA_mosi_i => SDA_mosi_i(0),
            SDA_miso_o => SDA_miso_o(0),
            SDA_tri_i => SDA_tri_i(0),
            CBC_lines_o => CBC_lines_o(0),
            
            clk40_i    => clk_40_i,
            fast_cmd_cbc2_i => fast_cmd_cbc2_i,
            
            clk320_i    => clk_320_i,
            fast_cmd_cbc3_i       => fast_cmd_cbc3_i,
            
            fmc_la_p        => fmc_l12_la_p,
            fmc_la_n        => fmc_l12_la_n            
        ); 
    end generate gen_fmc1;
    
    -- connected to FMC2
    gen_fmc2: if (FMC2 = FMC_8CBC2) or (FMC2 = FMC_2CBC2) or (FMC2 = FMC_2CBC3) or (FMC2 = FMC_8CBC3) generate
        fmcio_mapping_one_hybrid_inst : entity work.fmcio_mapping_one_hybrid
        Generic map (
            FMC_TYPE        => FMC2
        )
        Port map (                       
            reset_i          => reset_i,
            SCL_i  => scl_mosi(1),
            SDA_mosi_i => SDA_mosi_i(1),
            SDA_miso_o => SDA_miso_o(1),
            SDA_tri_i => SDA_tri_i(1),
            CBC_lines_o => CBC_lines_o(1),
            
            clk40_i    => clk_40_i,
            fast_cmd_cbc2_i => fast_cmd_cbc2_i,
            
            clk320_i    => clk_320_i,
            fast_cmd_cbc3_i       => fast_cmd_cbc3_i,
            
            fmc_la_p        => fmc_l8_la_p,
            fmc_la_n        => fmc_l8_la_n            
        ); 
    end generate gen_fmc2;    
end generate two_hybrids;
    
--===========================================================================--    
end generate gen_electrical;   
--===========================================================================--

--===========================================================================--
-- OPTICAL IMPLEMENTATION
gen_optical: if IMPLEMENTATION = OPTICAL generate
--===========================================================================--

gen_fmcs: for index in 0 to NUM_HYBRIDS-1 generate

end generate gen_fmcs;

--===========================================================================--    
end generate gen_optical;   
--===========================================================================--

end rtl;
