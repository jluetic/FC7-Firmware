---------------------------------------------------------------------------------- 
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic 
-- Create Date: 12/31/2016 04:36:15 PM 
-- Description: CBC3 emulator 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.user_package.all;
use work.cbc3_emulator_package.ALL;

--use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity CBC3_top is
  generic(
    CHIP_ADDR : std_logic_vector(6 downto 0) := "1110000"
  );
  Port ( 
    reset_i : in std_logic;
    -- Input 320MHz clock
    clk320_top : in std_logic;
    -- Input fast command sequence
    fast_cmd_top : in std_logic;
    -- Triggered data output
    data_bit_out_top : out std_logic;
    -- Stub data output
    stub_data_out : out stub_lines_r;
    -- Slow control
    sda_miso_o_top : out std_logic;
    sda_mosi_i_top : in std_logic;
    scl_i : in std_logic;
    -- This will be removed
    mmcm_ready_i : in std_logic
    
  );
end CBC3_top;

architecture Behavioral of CBC3_top is 
    signal sda_tri_o_top : std_logic := '1';   
    signal synch_bit_top : std_logic := '0';  
    signal fast_reset_top:  std_logic := '0';
    signal trigger_top : std_logic := '0';
    signal test_pulse_trigger_top : std_logic := '0';
    signal orbit_reset_top : std_logic := '0';
    signal clk40_top : std_logic := '0'; --from fast
    signal trig_lat_top : std_logic_vector (8 downto 0) := "000011111";  
    --  signal VTH_top : std_logic_vector(9 downto 0) := regs_page1_top(80)(1) & regs_page1_top(80)(0) & regs_page1_top(79);
    signal reset : std_logic := '0';
    signal VTH : std_logic_vector(9 downto 0);
    
    attribute keep : boolean;
    attribute keep of clk320_top : signal is true;
    signal masks : std_logic_vector(253 downto 0) := (others => '1');
begin   
    reset <= reset_i or fast_reset_top;
    --Slow control
    --==============================--
    i2c: entity work.CBC3_i2c_slave
    --==============================--
    generic map(
        CHIP_ADDR => CHIP_ADDR
    )
    port map
    (
        clk_ref_i =>clk40_top,
        reset_i => reset,
        scl_i => scl_i,
        sda_miso_o => sda_miso_o_top,
        sda_mosi_i => sda_mosi_i_top,
        sda_tri_o => sda_tri_o_top,
        masks_o => masks,
        VTH_o => VTH  
        --regs_page1_o => open,
       -- regs_page2_o => open
    
    );
    -- Stub data generator
    --==============================--
    stubs: entity work.stub_data_output
    --==============================--
    port map
    (
        reset_i => reset,
        clk320 => clk320_top,
        clk40 => clk40_top,
        synch_bit_o => synch_bit_top,   
        stub_data_to_fc7_o => stub_data_out,
        VTH_i => VTH  
   
    );
    -- Fast command input
    --==============================--
    fast_cmd: entity work.fast_cmd
    --==============================--
    port map
    (
        fast_cmd_i => fast_cmd_top,
        clk320 => clk320_top,   
        fast_reset_o => fast_reset_top,
        trigger_o => trigger_top,
        test_pulse_trigger_o => test_pulse_trigger_top,
        orbit_reset_o => orbit_reset_top,
        clk40_o => clk40_top
    );
    -- Triggered data generator
    --==============================--
    trig_data: entity work.trig_data
    --==============================--
    port map( 
        clk_40 => clk40_top,
        clk_320 => clk320_top,
        reset_i => reset,
        trigger_i => trigger_top,
        --trig_lat_i => trig_lat_top,
        synch_bit_i => synch_bit_top,
        data_bit_out => data_bit_out_top,
        masks_i => masks
    );

end Behavioral;
