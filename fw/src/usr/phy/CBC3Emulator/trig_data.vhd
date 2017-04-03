---------------------------------------------------------------------------------- 
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic 
-- Create Date: 01/10/2017 10:55:17 AM
-- Description: Triggered data output
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;
use work.all;

entity trig_data is
Port ( 
    clk_40 : in std_logic;
    clk_320 : in std_logic;
    reset_i : in std_logic;
    trigger_i : in std_logic;
    data_bit_out : out std_logic;
    synch_bit_i : in std_logic;
    masks_i : in std_logic_vector(253 downto 0)
);
end trig_data;

architecture Structural of trig_data is
    signal data_gen : std_logic_vector(253 downto 0);
    signal data_from_pipe : std_logic_vector(275 downto 0) := (others => '0');
begin
    -- Data generator
    gen_data : entity generate_data port map (
        clk_40 => clk_40,
        data => data_gen,
        masks_i => masks_i        
    );
    -- Writing generated data to pipeline
    pipeline: entity trig_data_pipeline port map (
        clk_40 => clk_40,
        reset_i => reset_i,
        trigger_i => trigger_i,
        data_i => data_gen,
        data_o => data_from_pipe
    );
    -- Writing triggered data to FIFO and output to BE
    fifo : entity buffer_fifo port map (
        clk_40 => clk_40,
        clk_320 => clk_320,
        reset_i => reset_i,
        data_in => data_from_pipe,
        trigger_in => trigger_i,
        data_bit_out => data_bit_out,
        synch_bit_i => synch_bit_i
    );

end Structural;
