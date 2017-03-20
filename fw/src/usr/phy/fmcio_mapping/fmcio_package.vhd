----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2017 09:37:45 AM
-- Design Name: 
-- Module Name: fmcio_package - rtl
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

package fmcio_package is

type fmcpin_sig_map_type is
record
    fmc_dir         : string(1 to 1);
    fmcpin_id       : natural;
    sig_id          : natural;
    wrong_pol       : boolean;
end record;

type fmcpin_sig_mapset_type is array ( 0 to 33 ) of fmcpin_sig_map_type;

--====================================--
-- 2CBC2 Hybrid Electrical
--====================================--
type fmc_2cbc2_in_id_type is
record
    sda_from_cbc  : natural;
    cbc0_trigdata : natural;
    cbc0_stubdata : natural;
    cbc1_trigdata : natural;
    cbc1_stubdata : natural;
    na            : natural;
end record;

type fmc_2cbc2_out_id_type is
record		
    clk                  : natural;
    scl                  : natural;
    sda_to_cbc           : natural;
    hard_reset    : natural;
    fast_reset    : natural;
    i2c_refresh   : natural;
    test_pulse    : natural;
    l1a           : natural;
    na		             : natural;
end record;

constant fmc_2cbc2_in_id : fmc_2cbc2_in_id_type :=
( 	sda_from_cbc  =>  0,
    cbc0_trigdata =>  1,
    cbc0_stubdata =>  2,
    cbc1_trigdata =>  3,
    cbc1_stubdata =>  4,
    na            =>  5 
);

constant fmc_2cbc2_out_id : fmc_2cbc2_out_id_type :=		
(	clk                => 0,
    scl                => 1,
    sda_to_cbc         => 2,
    hard_reset  => 3,
    fast_reset  => 4,
    i2c_refresh => 5,
    test_pulse  => 6,
    l1a         => 7,
    na                 => 8 
);

constant io_map_2cbc2    : fmcpin_sig_mapset_type :=
(
    ( fmc_dir => "i",   fmcpin_id   =>  0,   sig_id  =>  fmc_2cbc2_in_id.cbc1_trigdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  1,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  2,   sig_id  =>  fmc_2cbc2_in_id.cbc1_stubdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  3,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  4,   sig_id  =>  fmc_2cbc2_in_id.na,    wrong_pol => false ), -- should be trigger from cbc 1 (in)
    ( fmc_dir => "o",   fmcpin_id   =>  5,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  6,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  7,   sig_id  =>  fmc_2cbc2_in_id.cbc0_trigdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  8,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  9,   sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  10,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  11,  sig_id  =>  fmc_2cbc2_in_id.cbc0_stubdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  12,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  13,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  14,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  15,  sig_id  =>  fmc_2cbc2_out_id.l1a,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  16,  sig_id  =>  fmc_2cbc2_in_id.na,    wrong_pol => false ), -- should be trigger from cbc 0 (in)
    ( fmc_dir => "o",   fmcpin_id   =>  17,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  18,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  19,  sig_id  =>  fmc_2cbc2_out_id.test_pulse,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  20,  sig_id  =>  fmc_2cbc2_out_id.fast_reset,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  21,  sig_id  =>  fmc_2cbc2_out_id.i2c_refresh,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  22,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  23,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  24,  sig_id  =>  fmc_2cbc2_out_id.clk,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  25,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ), -- should be clock to dc-dc converter 1mhz (out)   
    ( fmc_dir => "o",   fmcpin_id   =>  26,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  27,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  28,  sig_id  =>  fmc_2cbc2_out_id.sda_to_cbc,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  29,  sig_id  =>  fmc_2cbc2_in_id.sda_from_cbc,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  30,  sig_id  =>  fmc_2cbc2_out_id.hard_reset,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  31,  sig_id  =>  fmc_2cbc2_out_id.scl,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  32,  sig_id  =>  fmc_2cbc2_out_id.na,    wrong_pol => false ), -- lvds data out (test)
    ( fmc_dir => "i",   fmcpin_id   =>  33,  sig_id  =>  fmc_2cbc2_in_id.na,    wrong_pol => false )  -- lvds data in (test)
);

constant i2c_address_map_2cbc2: i2c_address_map_type(0 to 1) := 
(
    0 =>  "1000001",
    1 =>  "1000010"
);
--====================================--

--====================================--
-- 8CBC2 Hybrid Electrical
--====================================--
type fmc_8cbc2_in_id_type is
record
    sda_from_cbc  : natural;
    cbc0_trigdata : natural;
    cbc0_stubdata : natural;
    cbc1_trigdata : natural;
    cbc1_stubdata : natural;
    cbc2_trigdata : natural;
    cbc2_stubdata : natural;
    cbc3_trigdata : natural;
    cbc3_stubdata : natural;
    cbc4_trigdata : natural;
    cbc4_stubdata : natural;
    cbc5_trigdata : natural;
    cbc5_stubdata : natural;
    cbc6_trigdata : natural;
    cbc6_stubdata : natural;
    cbc7_trigdata : natural;
    cbc7_stubdata : natural;
    na            : natural;
end record;

type fmc_8cbc2_out_id_type is
record		
    clk                  : natural;
    scl                  : natural;
    sda_to_cbc           : natural;
    hard_reset    : natural;
    fast_reset    : natural;
    i2c_refresh   : natural;
    test_pulse    : natural;
    l1a           : natural;
    na		             : natural;
end record;

constant fmc_8cbc2_in_id : fmc_8cbc2_in_id_type :=
( 	sda_from_cbc  =>  0,
    cbc0_trigdata =>  1,
    cbc0_stubdata =>  2,
    cbc1_trigdata =>  3,
    cbc1_stubdata =>  4,
    cbc2_trigdata =>  5,
    cbc2_stubdata =>  6,
    cbc3_trigdata =>  7,
    cbc3_stubdata =>  8,
    cbc4_trigdata =>  9,
    cbc4_stubdata => 10,
    cbc5_trigdata => 11,
    cbc5_stubdata => 12,
    cbc6_trigdata => 13,
    cbc6_stubdata => 14,
    cbc7_trigdata => 15,
    cbc7_stubdata => 16,
    na            => 17 
);

constant fmc_8cbc2_out_id : fmc_8cbc2_out_id_type :=		
(	clk                => 0,
    scl                => 1,
    sda_to_cbc         => 2,
    hard_reset  => 3,
    fast_reset  => 4,
    i2c_refresh => 5,
    test_pulse  => 6,
    l1a         => 7,
    na                 => 8 
);

constant io_map_8cbc2    : fmcpin_sig_mapset_type :=
(
    ( fmc_dir => "o",   fmcpin_id   =>  0,   sig_id  =>  fmc_8cbc2_out_id.scl,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  1,   sig_id  =>  fmc_8cbc2_out_id.hard_reset,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  2,   sig_id  =>  fmc_8cbc2_out_id.clk,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  3,   sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  4,   sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  5,   sig_id  =>  fmc_8cbc2_out_id.i2c_refresh,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  6,   sig_id  =>  fmc_8cbc2_out_id.test_pulse,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  7,   sig_id  =>  fmc_8cbc2_out_id.fast_reset,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  8,   sig_id  =>  fmc_8cbc2_out_id.l1a,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  9,   sig_id  =>  fmc_8cbc2_in_id.cbc0_stubdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  10,  sig_id  =>  fmc_8cbc2_out_id.sda_to_cbc,    wrong_pol => true ),    
    ( fmc_dir => "i",   fmcpin_id   =>  11,  sig_id  =>  fmc_8cbc2_in_id.cbc1_stubdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  12,  sig_id  =>  fmc_8cbc2_in_id.cbc0_trigdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  13,  sig_id  =>  fmc_8cbc2_in_id.cbc1_trigdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  14,  sig_id  =>  fmc_8cbc2_in_id.sda_from_cbc,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  15,  sig_id  =>  fmc_8cbc2_in_id.cbc2_stubdata,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  16,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  17,  sig_id  =>  fmc_8cbc2_in_id.cbc2_trigdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  18,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  19,  sig_id  =>  fmc_8cbc2_in_id.cbc3_trigdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  20,  sig_id  =>  fmc_8cbc2_in_id.cbc3_stubdata,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  21,  sig_id  =>  fmc_8cbc2_in_id.cbc5_stubdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  22,  sig_id  =>  fmc_8cbc2_in_id.cbc4_stubdata,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  23,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  24,  sig_id  =>  fmc_8cbc2_in_id.cbc4_trigdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  25,  sig_id  =>  fmc_8cbc2_in_id.cbc6_stubdata,    wrong_pol => false ),    
    ( fmc_dir => "o",   fmcpin_id   =>  26,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  27,  sig_id  =>  fmc_8cbc2_in_id.cbc5_trigdata,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  28,  sig_id  =>  fmc_8cbc2_in_id.cbc6_trigdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  29,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),    
    ( fmc_dir => "i",   fmcpin_id   =>  30,  sig_id  =>  fmc_8cbc2_in_id.cbc7_stubdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  31,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false ),
    ( fmc_dir => "i",   fmcpin_id   =>  32,  sig_id  =>  fmc_8cbc2_in_id.cbc7_trigdata,    wrong_pol => false ),
    ( fmc_dir => "o",   fmcpin_id   =>  33,  sig_id  =>  fmc_8cbc2_out_id.na,    wrong_pol => false )
);

constant i2c_address_map_8cbc2: i2c_address_map_type(0 to 7) := 
(
    0 =>  "1000001",
    1 =>  "1000010",
    2 =>  "1000011",
    3 =>  "1000100",
    4 =>  "1000101",
    5 =>  "1000110",
    6 =>  "1000111",
    7 =>  "1001000"
);
--====================================--

--====================================--
-- 2CBC3 Hybrid Electrical (constants are not defines, just template)
--====================================--
type fmc_2cbc3_in_id_type is
record
    sda_from_cbc  : natural;
    cbc0_trigdata : natural;
    cbc0_stubdata1: natural;
    cbc0_stubdata2: natural;
    cbc0_stubdata3: natural;
    cbc0_stubdata4: natural;
    cbc0_stubdata5: natural;
    cbc1_trigdata : natural;
    cbc1_stubdata1: natural;
    cbc1_stubdata2: natural;
    cbc1_stubdata3: natural;
    cbc1_stubdata4: natural;
    cbc1_stubdata5: natural;    
    na            : natural;
end record;

type fmc_2cbc3_out_id_type is
record		
    clk                  : natural;
    scl                  : natural;
    sda_to_cbc           : natural;    
    fast                 : natural;
    reset                : natural;
    na		             : natural;
end record;
--====================================--

constant i2c_address_map_2cbc3: i2c_address_map_type(0 to 1) := 
(
    0 =>  "1110000",
    1 =>  "1110001"
);

constant i2c_address_map_8cbc3: i2c_address_map_type(0 to 7) := 
(
    0 =>  "1000001",
    1 =>  "1000010",
    2 =>  "1000011",
    3 =>  "1000100",
    4 =>  "1000101",
    5 =>  "1000110",
    6 =>  "1000111",
    7 =>  "1001000"
);

end fmcio_package;

package body fmcio_package is

end fmcio_package;