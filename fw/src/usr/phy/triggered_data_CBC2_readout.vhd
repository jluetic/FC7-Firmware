----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2017 07:37:06 PM
-- Design Name: 
-- Module Name: triggered_data_CBC2_readout - rtl
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity triggered_data_CBC2_readout is
Port (
    clk40: in std_logic; 
    reset_i: in std_logic;
    triggered_data_from_fe_i: in std_logic;
    stub_from_CBC_i: in std_logic;
    -- output triggered data frame
    triggered_data_frame_o: out triggered_data_frame_r    
 );
end triggered_data_CBC2_readout;

architecture rtl of triggered_data_CBC2_readout is

    constant CBC2_TRIGDATA_WIDTH: integer := 270;
    constant STUBDATA_BUF_DEPTH     : integer := 256;
    constant CBC2_TRIGDATA_HEADER   : std_logic_vector(1 downto 0) := "11";
    constant CBC2_TRIGDATA_PADDING  : std_logic_vector(3 downto 0) := "0000";
    
    signal cbc_trigdata_buf 	: std_logic_vector( CBC2_TRIGDATA_WIDTH - 1 downto 0 );
    alias trigdata_buf_header       : std_logic_vector( CBC2_TRIGDATA_HEADER'RANGE ) is cbc_trigdata_buf( CBC2_TRIGDATA_WIDTH - 1 downto  CBC2_TRIGDATA_WIDTH - CBC2_TRIGDATA_HEADER'LENGTH );
    alias trigdata_buf_padding      : std_logic_vector( CBC2_TRIGDATA_PADDING'RANGE ) is cbc_trigdata_buf( CBC2_TRIGDATA_PADDING'RANGE );
    
    signal cbc_stubdata_buf		: std_logic_vector( STUBDATA_BUF_DEPTH - 1 downto 0 );
    
    signal latency_counter      : std_logic_vector(8 downto 0) := (others => '0');
    signal latency_counter_started : std_logic := '0';    
    signal trigger_counter      : std_logic_vector(8 downto 0) := (others => '0');
    signal stub_counter      : std_logic_vector(8 downto 0) := (others => '0'); 
    
begin
    
process(clk40)
begin
    if rising_edge(clk40) then
        if reset_i = '1' then
            triggered_data_frame_o.start <= (others => '0');
            triggered_data_frame_o.latency_error <= '0';
            triggered_data_frame_o.buffer_overflow <= '0';
            triggered_data_frame_o.pipe_address <= (others => '0');
            triggered_data_frame_o.l1_counter <= (others => '0');
            triggered_data_frame_o.channels <= (others => '0');            
            
            latency_counter <= (others => '0');
            latency_counter_started <= '0';
            trigger_counter <= (others => '0');
            stub_counter <= (others => '0');
        else
        
            if latency_counter_started = '1' then
                latency_counter <= latency_counter + 1;
            end if;
            if stub_from_CBC_i = '1' and latency_counter_started = '0' then
                latency_counter_started <= '1';
                latency_counter <= latency_counter + 1;
            end if;
            
            if stub_from_CBC_i = '1' then
                stub_counter <= stub_counter + 1;
            end if;                        
        
            cbc_trigdata_buf	<= cbc_trigdata_buf( CBC2_TRIGDATA_WIDTH - 2 downto 0 ) & triggered_data_from_fe_i;
            cbc_stubdata_buf    <= cbc_stubdata_buf( STUBDATA_BUF_DEPTH - 2 downto 0 ) & stub_from_CBC_i;    
        
            if trigdata_buf_header = CBC2_TRIGDATA_HEADER and trigdata_buf_padding = CBC2_TRIGDATA_PADDING then               
                
                triggered_data_frame_o.start <= CBC2_TRIGDATA_HEADER;
                triggered_data_frame_o.latency_error <= cbc_trigdata_buf(CBC2_TRIGDATA_WIDTH-CBC2_TRIGDATA_HEADER'LENGTH-1); 
                triggered_data_frame_o.buffer_overflow <= cbc_trigdata_buf(CBC2_TRIGDATA_WIDTH-CBC2_TRIGDATA_HEADER'LENGTH-2);
                triggered_data_frame_o.pipe_address <= '0' & cbc_trigdata_buf(CBC2_TRIGDATA_WIDTH-CBC2_TRIGDATA_HEADER'LENGTH-3 downto CBC2_TRIGDATA_WIDTH-CBC2_TRIGDATA_HEADER'LENGTH-10);
                --triggered_data_frame_o.l1_counter <= (others => '0');
                triggered_data_frame_o.channels <= cbc_trigdata_buf(CBC2_TRIGDATA_WIDTH-CBC2_TRIGDATA_HEADER'LENGTH-11 downto CBC2_TRIGDATA_PADDING'LENGTH);
                
                --triggered_data_frame_o.l1_counter <= latency_counter;
                triggered_data_frame_o.l1_counter <= trigger_counter + 1; 
                --triggered_data_frame_o.l1_counter <= stub_counter;               
                
                latency_counter <= (others => '0');
                latency_counter_started <= '0';
                trigger_counter <= trigger_counter + 1;                
                
                cbc_trigdata_buf         <= (others => '0');
                cbc_trigdata_buf(0)      <= triggered_data_from_fe_i;
            else
                triggered_data_frame_o.start <= (others => '0');
                triggered_data_frame_o.latency_error <= '0';
                triggered_data_frame_o.buffer_overflow <= '0';
                triggered_data_frame_o.pipe_address <= (others => '0');
                triggered_data_frame_o.l1_counter <= (others => '0');
                triggered_data_frame_o.channels <= (others => '0');
                
            end if;
            
        end if;     
    end if;
end process;

end rtl;
