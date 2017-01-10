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

entity ipbus_decoder_ctrl is
generic( ADDR_WIDTH     : natural := 8 );
port (
        clk                   : in  std_logic;
        reset                 : in  std_logic;
        ipb_mosi_i            : in  ipb_wbus;
        ipb_miso_o            : out ipb_rbus;
        -- global commands
        ipb_global_reset      : out std_logic;
        -- fast commands
        ctrl_fastblock_o      : out ctrl_fastblock;
        -- i2c commands
        i2c_reset             : out std_logic;
        i2c_reset_fifos       : out std_logic;
        command_fifo_we_o     : out std_logic;
        command_fifo_data_o   : out std_logic_vector(31 downto 0);
        reply_fifo_read_next_o: out std_logic;
        reply_fifo_data_i     : in std_logic_vector(31 downto 0)
     );
end ipbus_decoder_ctrl;

architecture rtl of ipbus_decoder_ctrl is

    signal regs: array_256x32bit;  
    
    signal sel: integer range 0 to 255;
    signal ipb_ack_int: std_logic;
    
    attribute keep: boolean;
    attribute keep of sel: signal is true;
    
    constant ctrl_fastblock_init0   : ctrl_fastblock := (cmd_strobe => '0',
                                                         reset => '0',
                                                         load_config => '0',
                                                         start_trigger => '0',
                                                         stop_trigger => '0',
                                                         fast_signal_reset => '0',
                                                         fast_signal_test_pulse => '0',
                                                         fast_signal_trigger => '0',
                                                         fast_signal_orbit_reset => '0');
    
    signal command_fifo_we_int      : std_logic := '0';
    signal command_fifo_data_int    : std_logic_vector(31 downto 0) := (others => '0');
    
    signal reset_needed             : std_logic := '0';
        
    -- global control
    constant GLOBAL_SEL                          : integer := 16#00#;
    constant GLOBAL_RESET_BIT                    : integer := 0;
    constant GLOBAL_DAQ_RESET_BIT                : integer := 1;
    constant GLOBAL_CBC_HARD_RESET_BIT           : integer := 16;
    
    -- fast command generator control
    constant SCG_SEL                             : integer := 16#01#;
    constant SCG_RESET_BIT                       : integer := 0;
    constant SCG_START_TRIGGER_BIT               : integer := 1;
    constant SCG_STOP_TRIGGER_BIT                : integer := 2;
    constant SCG_LOAD_CONFIG_BIT                 : integer := 3;
    constant SCG_CFS_FAST_RESET_BIT              : integer := 16;
    constant SCG_CFS_TEST_PULSE_REQ_BIT          : integer := 17;
    constant SCG_CFS_TRIGGER_BIT                 : integer := 18;
    constant SCG_CFS_ORBIT_RESET_BIT             : integer := 19;
    
    -- i2c chip control
    constant I2C_CONTROL_SEL                     : integer := 16#30#;
    constant I2C_CONTROL_RESET_BIT               : integer := 0;
    constant I2C_CONTROL_RESET_FIFOS_BIT         : integer := 2;
    
    -- i2c chip control fifo
    constant I2C_COMMAND_FIFO_SEL                : integer := 16#40#;
    constant I2C_REPLY_FIFO_SEL                  : integer := 16#50#;
     
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
		
		reset_needed <= '0';
		ipb_global_reset <= '0';
		
		ctrl_fastblock_o <= ctrl_fastblock_init0;
		
		command_fifo_we_int <= '0';
		command_fifo_data_int <= (others => '0');
		reply_fifo_read_next_o <= '0';
		
	elsif rising_edge(clk) then
	    ipb_global_reset <= '0';
	    ctrl_fastblock_o <= ctrl_fastblock_init0;
        i2c_reset <= '0';
        i2c_reset_fifos <= '0';
        command_fifo_we_int <= '0';
        reply_fifo_read_next_o <= '0';

        -- one clock cycle delay before reset, otherwise computer will not receive the confirmation
        if reset_needed = '1' then
            ipb_global_reset <= '1';
            reset_needed <= '0';
        end if;
	    --=============================--
        -- write section
        --=============================--
		if ipb_mosi_i.ipb_strobe='1' and ipb_mosi_i.ipb_write='1'then		  

            regs(sel) <= ipb_mosi_i.ipb_wdata;
            -- here put the command into i2c fifo
            if sel = GLOBAL_SEL then
                reset_needed <= ipb_mosi_i.ipb_wdata(GLOBAL_RESET_BIT); 
            elsif sel = SCG_SEL then
                ctrl_fastblock_o.cmd_strobe <= '1';
                ctrl_fastblock_o.reset <= ipb_mosi_i.ipb_wdata(SCG_RESET_BIT);
                ctrl_fastblock_o.start_trigger <= ipb_mosi_i.ipb_wdata(SCG_START_TRIGGER_BIT); 
                ctrl_fastblock_o.stop_trigger <= ipb_mosi_i.ipb_wdata(SCG_STOP_TRIGGER_BIT);  
                ctrl_fastblock_o.load_config <= ipb_mosi_i.ipb_wdata(SCG_LOAD_CONFIG_BIT);
                ctrl_fastblock_o.fast_signal_reset <= ipb_mosi_i.ipb_wdata(SCG_CFS_FAST_RESET_BIT); 
                ctrl_fastblock_o.fast_signal_test_pulse <= ipb_mosi_i.ipb_wdata(SCG_CFS_TEST_PULSE_REQ_BIT); 
                ctrl_fastblock_o.fast_signal_trigger <= ipb_mosi_i.ipb_wdata(SCG_CFS_TRIGGER_BIT); 
                ctrl_fastblock_o.fast_signal_orbit_reset <= ipb_mosi_i.ipb_wdata(SCG_CFS_ORBIT_RESET_BIT);
            elsif sel = I2C_CONTROL_SEL then
                i2c_reset <= ipb_mosi_i.ipb_wdata(I2C_CONTROL_RESET_BIT);
                i2c_reset_fifos <= ipb_mosi_i.ipb_wdata(I2C_CONTROL_RESET_FIFOS_BIT);  
            elsif sel = I2C_COMMAND_FIFO_SEL then
                command_fifo_we_int <= '1';
                command_fifo_data_int <= ipb_mosi_i.ipb_wdata;    
            end if;
        end if;
        --=============================--
        -- read section
        --=============================--
        
        if sel = I2C_REPLY_FIFO_SEL and ipb_mosi_i.ipb_strobe = '1' then
            reply_fifo_read_next_o <= '1'; 
            ipb_miso_o.ipb_rdata <= reply_fifo_data_i;
        else
            ipb_miso_o.ipb_rdata <= regs(sel);            
        end if;
        ipb_ack_int <= ipb_mosi_i.ipb_strobe and not ipb_ack_int;
        --=============================--
	end if;
	end process;
	
	ipb_miso_o.ipb_ack <= ipb_ack_int;
	ipb_miso_o.ipb_err <= '0';
	command_fifo_we_o <= command_fifo_we_int;
	command_fifo_data_o <= command_fifo_data_int;

end rtl;
