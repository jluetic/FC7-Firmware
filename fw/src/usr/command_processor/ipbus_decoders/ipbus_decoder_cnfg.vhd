----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 12/20/2016 05:05:17 PM
----------------------------------------------------------------------------------


library IEEE;
use ieee.std_logic_1164.all;
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

entity ipbus_decoder_cnfg is
generic( ADDR_WIDTH     : natural := 8 );
port (
        clk                   : in  std_logic;
        reset                 : in  std_logic;
        ipb_mosi_i            : in  ipb_wbus;
        ipb_miso_o            : out ipb_rbus;
        -- fast command block configuration
        cnfg_fastblock_o      : out cnfg_fastblock;
        -- i2c mask
        i2c_mask              : out std_logic_vector(7 downto 0)
     );
end ipbus_decoder_cnfg;

architecture rtl of ipbus_decoder_cnfg is

    signal regs: array_256x32bit;  
    
    signal sel: integer range 0 to 255;
    signal ipb_ack_int: std_logic;
    
    attribute keep: boolean;
    attribute keep of sel: signal is true;

    -- fast command block commands    
    constant SCG_FSG_NCYCLE_SEL                       : integer := 16#23#;
    constant SCG_FSG_CYCLE_PERIOD_SEL                 : integer := 16#24#;
    constant SCG_FSG_SOURCE_SEL                       : integer := 16#28#;
    constant SCG_FSG_SOURCE_OFFSET                    : integer := 0;
    constant SCG_FSG_SOURCE_WIDTH                     : integer := 4;
    constant SCG_FSG_MASK_SEL                         : integer := 16#29#;
    
    -- i2c mask to write the register
    constant I2C_WRITE_MASK_SEL                       : integer := 16#40#;
    constant I2C_WRITE_MASK_OFFSET                    : integer := 0;
    constant I2C_WRITE_MASK_WIDTH                     : integer := 8;
     
begin

	--=============================--
	sel <= to_integer(unsigned(ipb_mosi_i.ipb_addr(addr_width-1 downto 0))) when addr_width>0 else 0;
	--=============================--
		

	--=============================--
	process(reset, clk)
	--=============================--
	begin
	if reset='1' then
		regs 	 <= (others=> (others=>'0'));
		ipb_ack_int 	 <= '0';
		
		regs(SCG_FSG_NCYCLE_SEL) <= (others => '0');
		regs(SCG_FSG_CYCLE_PERIOD_SEL) <= x"00000001";
		regs(SCG_FSG_SOURCE_SEL)(SCG_FSG_SOURCE_OFFSET + SCG_FSG_SOURCE_WIDTH -1 downto SCG_FSG_SOURCE_OFFSET) <= x"1";
		regs(SCG_FSG_MASK_SEL) <= (others => '0');
		
		regs(I2C_WRITE_MASK_SEL)(I2C_WRITE_MASK_OFFSET + I2C_WRITE_MASK_WIDTH -1 downto I2C_WRITE_MASK_OFFSET) <= x"FF";		
		
	elsif rising_edge(clk) then
		if ipb_mosi_i.ipb_strobe='1' then
	      --=============================--
          -- write section
          --=============================--
		  if ipb_mosi_i.ipb_write='1' then
		      regs(sel) <= ipb_mosi_i.ipb_wdata;
		  end if;		    
		  --=============================--
		end if;
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
	
	-- trigger config
	cnfg_fastblock_o.trigger_source <= regs(SCG_FSG_SOURCE_SEL)(SCG_FSG_SOURCE_OFFSET + SCG_FSG_SOURCE_WIDTH -1 downto SCG_FSG_SOURCE_OFFSET);
	cnfg_fastblock_o.triggers_to_accept <= to_integer(unsigned(regs(SCG_FSG_NCYCLE_SEL)));
	cnfg_fastblock_o.divider <= to_integer(unsigned(regs(SCG_FSG_CYCLE_PERIOD_SEL)));
	cnfg_fastblock_o.stubs_mask <= regs(SCG_FSG_MASK_SEL);
	
	i2c_mask <= regs(I2C_WRITE_MASK_SEL)(I2C_WRITE_MASK_OFFSET + I2C_WRITE_MASK_WIDTH -1 downto I2C_WRITE_MASK_OFFSET);

end rtl;
