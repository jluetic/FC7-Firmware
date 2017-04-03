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
use work.register_map_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_decoder_ctrl is
port (
        clk_ipb               : in  std_logic;
        clk_40MHz             : in std_logic;
        reset                 : in  std_logic;
        ipb_mosi_i            : in  ipb_wbus;
        ipb_miso_o            : out ipb_rbus;
        -- global commands
        ipb_global_reset      : out std_logic;
        -- fast commands
        ctrl_fastblock_o      : out ctrl_fastblock_type;
        -- command processor
        ctrl_command_block_from_ipbus   : out ctrl_command_block_from_ipbus_type;                    
        ctrl_command_block_to_ipbus     : in ctrl_command_block_to_ipbus_type
     );
end ipbus_decoder_ctrl;

architecture rtl of ipbus_decoder_ctrl is

    constant reg_type   : register_type := ctrl;
    signal regs: ctrl_regs_type; 
    
    signal sel: integer range 0 to 2**ADDR_WIDTH-1;
    signal ipb_ack_int: std_logic;
    signal block_id            : integer range 0 to 2**BLOCK_ID_WIDTH-1;
    signal register_address    : integer range 0 to 2**ADDR_WIDTH-1;
    attribute keep: boolean;
    attribute keep of sel: signal is true;
    
    constant ctrl_fastblock_init0   : ctrl_fastblock_type := (cmd_strobe => '0',
                                                             reset => '0',
                                                             load_config => '0',
                                                             start_trigger => '0',
                                                             stop_trigger => '0',
                                                             ipb_fast_reset => '0',
                                                             ipb_test_pulse => '0',
                                                             ipb_trigger => '0',
                                                             ipb_orbit_reset => '0',
                                                             ipb_i2c_refresh => '0');
                                                         
    signal ctrl_fastblock_int       : ctrl_fastblock_type;
    
    signal command_fifo_we_int      : std_logic := '0';
    signal command_fifo_data_int    : std_logic_vector(31 downto 0) := (others => '0');
    
    signal reset_needed             : std_logic := '0';
    
    -- signals are redirected here in case of overflow
    constant OVERFLOW_SEL                                : integer := convert_address(x"0_000",reg_type);
        
    --====================================--
    -- Command Processor Block Registers  
    --====================================--
    constant COMMAND_BLOCK_SEL                   : integer := convert_address(x"1_000",reg_type);
    --====================================--
    -- global control
    constant COMMAND_BLOCK_GLOBAL_SEL                          : integer := convert_address(x"1_000",reg_type);
    constant COMMAND_BLOCK_GLOBAL_RESET_BIT                    : integer := 0;
    constant COMMAND_BLOCK_GLOBAL_DAQ_RESET_BIT                : integer := 1;
    constant COMMAND_BLOCK_GLOBAL_CBC_HARD_RESET_BIT           : integer := 16;
    
    -- i2c chip control
    constant COMMAND_BLOCK_I2C_CONTROL_SEL                     : integer := convert_address(x"1_001",reg_type);
    constant COMMAND_BLOCK_I2C_CONTROL_RESET_BIT               : integer := 0;
    constant COMMAND_BLOCK_I2C_CONTROL_RESET_FIFOS_BIT         : integer := 2;
    
    -- i2c chip control fifo
    constant COMMAND_BLOCK_I2C_COMMAND_FIFO_SEL                : integer := convert_address(x"1_002",reg_type);
    constant COMMAND_BLOCK_I2C_REPLY_FIFO_SEL                  : integer := convert_address(x"1_003",reg_type);
    --====================================--
 
    --====================================--
    -- Fast Command Block Registers  
    --====================================--
    constant FAST_BLOCK_SEL                                 : integer := convert_address(x"2_000",reg_type);
    --====================================--
    constant FAST_BLOCK_SCG_SEL                             : integer := convert_address(x"2_000",reg_type);
    constant FAST_BLOCK_SCG_RESET_BIT                       : integer := 0;
    constant FAST_BLOCK_SCG_START_TRIGGER_BIT               : integer := 1;
    constant FAST_BLOCK_SCG_STOP_TRIGGER_BIT                : integer := 2;
    constant FAST_BLOCK_SCG_LOAD_CONFIG_BIT                 : integer := 3;
    constant FAST_BLOCK_SCG_CFS_FAST_RESET_BIT              : integer := 16;
    constant FAST_BLOCK_SCG_CFS_TEST_PULSE_REQ_BIT          : integer := 17;
    constant FAST_BLOCK_SCG_CFS_TRIGGER_BIT                 : integer := 18;
    constant FAST_BLOCK_SCG_CFS_ORBIT_RESET_BIT             : integer := 19;
    constant FAST_BLOCK_SCG_CFS_I2C_REFRESH_BIT             : integer := 20;
    --====================================--   
    
    --====================================--
    -- Physical Interface Block Registers  
    --====================================--
    constant PHY_BLOCK_SEL                                 : integer := convert_address(x"3_000",reg_type);
    --====================================--
    -- define addresses here
    --====================================--
    
    --====================================--
    -- Hybrid Block Registers  
    --====================================--
    constant HYB_BLOCK_SEL                                 : integer := convert_address(x"4_000",reg_type);
    --====================================--
    -- define addresses here
    --====================================--
    
    --====================================--
    -- Data Block Registers  
    --====================================--
    constant BE_DATA_BLOCK_SEL                             : integer := convert_address(x"5_000",reg_type);
    --====================================--
    -- define addresses here
    --====================================--
    
    --====================================--
    -- DIO5 Block Registers  
    --====================================--
    constant DIO5_BLOCK_SEL                                 : integer := convert_address(x"6_000",reg_type);
    --====================================--
    -- define addresses here
    --====================================--
     
begin

    block_id <= to_integer(unsigned(ipb_mosi_i.ipb_addr(ADDR_WIDTH-1 downto (ADDR_WIDTH-BLOCK_ID_WIDTH))));
    register_address <= to_integer(unsigned(ipb_mosi_i.ipb_addr(ADDR_WIDTH-BLOCK_ID_WIDTH-1 downto 0))); 
    --=============================--
    sel <= register_address + offset_ctrl(block_id) when register_address+1 <= fc7_register_map(block_id).register_width_ctrl else 0;
    --=============================--
    
	--=============================--
	process(reset, clk_ipb)
	--=============================--
	begin
	if rising_edge(clk_ipb) then
    if reset='1' then
        regs 	 <= (others=> (others=>'0'));
        ipb_ack_int 	 <= '0';
        
        reset_needed <= '0';		
        
        ctrl_fastblock_int <= ctrl_fastblock_init0;
        
        command_fifo_we_int <= '0';
        command_fifo_data_int <= (others => '0');
        
        ipb_global_reset <= '0';
    else 		
	
        --   regs <= (others=> (others=>'0'));
        regs(FAST_BLOCK_SCG_SEL) <= (others => '0');
        regs(COMMAND_BLOCK_GLOBAL_SEL) <= (others => '0');
        regs(COMMAND_BLOCK_I2C_CONTROL_SEL) <= (others => '0');
        regs(COMMAND_BLOCK_I2C_COMMAND_FIFO_SEL) <= (others => '0');
	    ipb_global_reset <= '0';
	    ctrl_fastblock_int <= ctrl_fastblock_init0;
        ctrl_command_block_from_ipbus.i2c_reset <= '0';
        ctrl_command_block_from_ipbus.i2c_reset_fifos <= '0';
        command_fifo_we_int <= '0';

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
            if sel = COMMAND_BLOCK_GLOBAL_SEL then
                reset_needed <= ipb_mosi_i.ipb_wdata(COMMAND_BLOCK_GLOBAL_RESET_BIT); 
            elsif sel = FAST_BLOCK_SCG_SEL then
                ctrl_fastblock_int.cmd_strobe <= '1';
                ctrl_fastblock_int.reset <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_RESET_BIT);
                ctrl_fastblock_int.start_trigger <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_START_TRIGGER_BIT); 
                ctrl_fastblock_int.stop_trigger <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_STOP_TRIGGER_BIT);  
                ctrl_fastblock_int.load_config <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_LOAD_CONFIG_BIT);
                ctrl_fastblock_int.ipb_fast_reset <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_CFS_FAST_RESET_BIT); 
                ctrl_fastblock_int.ipb_test_pulse <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_CFS_TEST_PULSE_REQ_BIT); 
                ctrl_fastblock_int.ipb_trigger <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_CFS_TRIGGER_BIT); 
                ctrl_fastblock_int.ipb_orbit_reset <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_CFS_ORBIT_RESET_BIT);
                ctrl_fastblock_int.ipb_i2c_refresh <= ipb_mosi_i.ipb_wdata(FAST_BLOCK_SCG_CFS_I2C_REFRESH_BIT);
            elsif sel = COMMAND_BLOCK_I2C_CONTROL_SEL then
                ctrl_command_block_from_ipbus.i2c_reset <= ipb_mosi_i.ipb_wdata(COMMAND_BLOCK_I2C_CONTROL_RESET_BIT);
                ctrl_command_block_from_ipbus.i2c_reset_fifos <= ipb_mosi_i.ipb_wdata(COMMAND_BLOCK_I2C_CONTROL_RESET_FIFOS_BIT);  
            elsif sel = COMMAND_BLOCK_I2C_COMMAND_FIFO_SEL then
                command_fifo_we_int <= '1';
                command_fifo_data_int <= ipb_mosi_i.ipb_wdata;    
            end if;
        end if;
        --=============================--
        -- read section
        --=============================--
        
--        if sel = I2C_REPLY_FIFO_SEL and ipb_mosi_i.ipb_strobe = '1' then            
--            ipb_miso_o.ipb_rdata <= reply_fifo_data_i;
--        else
--            ipb_miso_o.ipb_rdata <= regs(sel);            
--        end if;
        ipb_ack_int <= ipb_mosi_i.ipb_strobe and not ipb_ack_int;        
        --=============================--
	end if;
	end if;
	end process;
	
	ipb_miso_o.ipb_rdata <= ctrl_command_block_to_ipbus.reply_fifo_data when (sel = COMMAND_BLOCK_I2C_REPLY_FIFO_SEL and ipb_mosi_i.ipb_strobe = '1') else regs(sel);
	ctrl_command_block_from_ipbus.reply_fifo_read_next <= ipb_ack_int when (ipb_mosi_i.ipb_write='0' and sel = COMMAND_BLOCK_I2C_REPLY_FIFO_SEL) else '0';	
	ipb_miso_o.ipb_ack <= ipb_ack_int;
	ipb_miso_o.ipb_err <= '0';
	ctrl_command_block_from_ipbus.command_fifo_we <= command_fifo_we_int;
	ctrl_command_block_from_ipbus.command_fifo_data <= command_fifo_data_int;
	
	--=============================--
	-- Clock synchronization
	--=============================--
    process(reset, clk_40MHz)
    --=============================--
    begin
    if reset='1' then
        ctrl_fastblock_o <= ctrl_fastblock_init0;
    elsif rising_edge(clk_40MHz) then
        ctrl_fastblock_o <= ctrl_fastblock_int; 
    end if;
    end process;

end rtl;
