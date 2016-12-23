----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 12/21/2016 05:57:14 PM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.user_package.all;
use work.system_package.all;
use work.ipbus.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_decoder_stat is
generic( ADDR_WIDTH     : natural := 8 );
port (
        clk                   : in  std_logic;
        reset                 : in  std_logic;
        ipb_mosi_i            : in  ipb_wbus;
        ipb_miso_o            : out ipb_rbus;
        -- fast command block statuses
        status_fast_block_fsm : in  std_logic_vector(7 downto 0);
        error_fast_block      : in  std_logic_vector(7 downto 0);
        -- i2c master statuses
        status_i2c_master_fsm : in  std_logic_vector(3 downto 0);
        error_i2c_master      : in  std_logic_vector(7 downto 0);
        fifo_statuses         : in  fifo_stat
     );
end ipbus_decoder_stat;

architecture rtl of ipbus_decoder_stat is
    signal regs: array_256x32bit := (others=> (others=>'0'));  
    
    signal sel: integer range 0 to 255;
    signal ipb_ack_int: std_logic;
    
    attribute keep: boolean;
    attribute keep of sel: signal is true; 
    
    -- statuses out
    signal status_error_block_id  : std_logic_vector(3 downto 0) := x"0";
    signal status_error_code      : std_logic_vector(7 downto 0) := x"00";   
     
begin

	--=============================--
	sel <= to_integer(unsigned(ipb_mosi_i.ipb_addr(addr_width-1 downto 0))) when addr_width>0 else 0;	
	--=============================--	

	--=============================--
	process(reset, clk)
	--=============================--
	begin
	if reset='1' then
		ipb_ack_int 	 <= '0';
	elsif rising_edge(clk) then

      --=============================--
      -- read section
      --=============================--
      ipb_miso_o.ipb_rdata <= regs(sel);
      ipb_ack_int <= ipb_mosi_i.ipb_strobe and not ipb_ack_int;
      --=============================--
      
	end if;
	end process;
	
	ipb_miso_o.ipb_ack <= ipb_ack_int;
	ipb_miso_o.ipb_err <= '0';
	
	regs(0)(31 downto 28) <= status_error_block_id;
	regs(0)(27 downto 20) <= status_error_code;
	regs(0)(15 downto 8)  <= status_fast_block_fsm;
	regs(0)(3 downto 0) <= status_i2c_master_fsm;
	
	regs(50)(0) <= fifo_statuses.i2c_commands_empty;
	regs(50)(1) <= fifo_statuses.i2c_commands_full;
	regs(51)(0) <= fifo_statuses.i2c_replies_empty;
    regs(51)(1) <= fifo_statuses.i2c_replies_full;
	
ERROR_HANDLER: process(reset, clk)
begin
    if reset = '1' then
       status_error_block_id <= x"0";
       status_error_code <= x"00"; 
    elsif rising_edge(clk) then
        if error_fast_block /= x"00" then
            status_error_block_id <= x"2";
            status_error_code <= error_fast_block;
        elsif error_i2c_master /= x"00" then
            status_error_block_id <= x"3";
            status_error_code <= error_i2c_master; 
        else
            status_error_block_id <= x"0";
            status_error_code <= x"00";  
        end if;    
    end if;
end process;

end rtl;