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
use work.register_map_package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_decoder_stat is
port (
        clk                   : in  std_logic;
        reset                 : in  std_logic;
        ipb_mosi_i            : in  ipb_wbus;
        ipb_miso_o            : out ipb_rbus;
        -- fast command block statuses
        stat_fast_block_i     : in stat_fastblock_type;
        -- stat command block
        stat_command_block_i  : in stat_command_block_type;
        test_clock_frequency  : in array_4x32bit
     );
end ipbus_decoder_stat;

architecture rtl of ipbus_decoder_stat is

    constant reg_type   : register_type := stat;
    signal regs: stat_regs_type;
    signal sel: integer range 0 to 2**ADDR_WIDTH-1;
    signal ipb_ack_int: std_logic;
    signal block_id            : integer range 0 to 2**BLOCK_ID_WIDTH-1;
    signal register_address    : integer range 0 to 2**ADDR_WIDTH-1;
    
    attribute keep: boolean;
    attribute keep of sel: signal is true;
    
    -- signals are redirected here in case of overflow
    constant OVERFLOW_SEL                                : integer := convert_address(x"0_000",reg_type);
    
    --====================================--
    -- Commond Error from All Blocks  
    --====================================--
    constant GENERAL_STATUS_SEL                          : integer := convert_address(x"0_001",reg_type);
    --====================================--
    constant GENERAL_STATUS_ERROR_SEL                    : integer := convert_address(x"0_001",reg_type);
    constant GENERAL_STATUS_ERROR_BLOCKID_OFFSET         : integer := 0;
    constant GENERAL_STATUS_ERROR_BLOCKID_WIDTH          : integer := 4;
    constant GENERAL_STATUS_ERROR_CODE_OFFSET            : integer := 4;
    constant GENERAL_STATUS_ERROR_CODE_WIDTH             : integer := 8;
    --====================================-- 
    
    --====================================--
    -- Command Processor Block Registers  
    --====================================--
    constant COMMAND_BLOCK_SEL                                 : integer := convert_address(x"1_000",reg_type);
    --====================================--
    constant COMMAND_BLOCK_I2C_MASTER_SEL                      : integer := convert_address(x"1_001",reg_type);
    constant COMMAND_BLOCK_I2C_MASTER_FSM_STATUS_OFFSET        : integer := 0;
    constant COMMAND_BLOCK_I2C_MASTER_FSM_STATUS_WIDTH         : integer := 4;
    constant COMMAND_BLOCK_I2C_COMMANDS_FIFO_STAT_SEL          : integer := convert_address(x"1_002",reg_type);
    constant COMMAND_BLOCK_I2C_COMMANDS_FIFO_EMPTY_BIT         : integer := 0;
    constant COMMAND_BLOCK_I2C_COMMANDS_FIFO_FULL_BIT          : integer := 1;
    constant COMMAND_BLOCK_I2C_REPLIES_FIFO_STAT_SEL           : integer := convert_address(x"1_003",reg_type);
    constant COMMAND_BLOCK_I2C_REPLIES_FIFO_EMPTY_BIT          : integer := 0;
    constant COMMAND_BLOCK_I2C_REPLIES_FIFO_FULL_BIT           : integer := 1;
    constant COMMAND_BLOCK_I2C_NREPLIES_SEL                    : integer := convert_address(x"1_004",reg_type);
    --====================================--
 
    --====================================--
    -- Fast Command Block Registers  
    --====================================--
    constant FAST_BLOCK_SEL                                 : integer := convert_address(x"2_000",reg_type);
    --====================================--
    constant FAST_BLOCK_FSG_STATUS_SEL                      : integer := convert_address(x"2_000",reg_type);    
    constant FAST_BLOCK_FSG_STATUS_SOURCE_OFFSET            : integer := 0;
    constant FAST_BLOCK_FSG_STATUS_SOURCE_WIDTH             : integer := 4;
    constant FAST_BLOCK_FSG_STATUS_STATE_BIT                : integer := 4;
    constant FAST_BLOCK_FSG_STATUS_CONFIGURED_BIT           : integer := 5;
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
    
    --====================================--
    -- Output of measured clock frequencies  
    --====================================--
    constant TEST_CLOCK_SEL                           : integer := convert_address(x"f_000",stat);
    --====================================--
    constant TEST_CLOCK_IPB_SEL                       : integer := convert_address(x"f_000",stat);
    constant TEST_CLOCK_40MHZ_SEL                     : integer := convert_address(x"f_001",stat);
    constant TEST_CLOCK_TRIGGER_SEL                   : integer := convert_address(x"f_002",stat);
    --====================================--
    
    -- errors out (from error handler)    
    signal status_error_block_id  : std_logic_vector(3 downto 0) := x"0";
    signal status_error_code      : std_logic_vector(7 downto 0) := x"00";   
         
begin

    block_id <= to_integer(unsigned(ipb_mosi_i.ipb_addr(ADDR_WIDTH-1 downto (ADDR_WIDTH-BLOCK_ID_WIDTH))));
    register_address <= to_integer(unsigned(ipb_mosi_i.ipb_addr(ADDR_WIDTH-BLOCK_ID_WIDTH-1 downto 0))); 
    --=============================--
    sel <= register_address + offset_stat(block_id) when register_address+1 <= fc7_register_map(block_id).register_width_stat else 0;
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
		
    -- general status
	regs(GENERAL_STATUS_ERROR_SEL)((GENERAL_STATUS_ERROR_BLOCKID_OFFSET + GENERAL_STATUS_ERROR_BLOCKID_WIDTH-1) downto GENERAL_STATUS_ERROR_BLOCKID_OFFSET) <= status_error_block_id;
	regs(GENERAL_STATUS_ERROR_SEL)((GENERAL_STATUS_ERROR_CODE_OFFSET + GENERAL_STATUS_ERROR_CODE_WIDTH-1) downto GENERAL_STATUS_ERROR_CODE_OFFSET) <= status_error_code;
	
	-- command block status
	regs(COMMAND_BLOCK_I2C_MASTER_SEL)((COMMAND_BLOCK_I2C_MASTER_FSM_STATUS_OFFSET + COMMAND_BLOCK_I2C_MASTER_FSM_STATUS_WIDTH-1) downto COMMAND_BLOCK_I2C_MASTER_FSM_STATUS_OFFSET) <= stat_command_block_i.status_i2c_master_fsm;
    regs(COMMAND_BLOCK_I2C_COMMANDS_FIFO_STAT_SEL)(COMMAND_BLOCK_I2C_COMMANDS_FIFO_EMPTY_BIT) <= stat_command_block_i.fifo_statuses.i2c_commands_empty;
	regs(COMMAND_BLOCK_I2C_COMMANDS_FIFO_STAT_SEL)(COMMAND_BLOCK_I2C_COMMANDS_FIFO_FULL_BIT) <= stat_command_block_i.fifo_statuses.i2c_commands_full;
	regs(COMMAND_BLOCK_I2C_REPLIES_FIFO_STAT_SEL)(COMMAND_BLOCK_I2C_REPLIES_FIFO_EMPTY_BIT) <= stat_command_block_i.fifo_statuses.i2c_replies_empty;
    regs(COMMAND_BLOCK_I2C_REPLIES_FIFO_STAT_SEL)(COMMAND_BLOCK_I2C_REPLIES_FIFO_FULL_BIT) <= stat_command_block_i.fifo_statuses.i2c_replies_full;
    regs(COMMAND_BLOCK_I2C_NREPLIES_SEL)(15 downto 0) <= stat_command_block_i.fifo_statuses.i2c_nreplies_present;
    regs(COMMAND_BLOCK_I2C_NREPLIES_SEL)(31 downto 16) <= (others => '0');
    
    -- fast block status
    regs(FAST_BLOCK_FSG_STATUS_SEL)((FAST_BLOCK_FSG_STATUS_SOURCE_OFFSET + FAST_BLOCK_FSG_STATUS_SOURCE_WIDTH-1) downto FAST_BLOCK_FSG_STATUS_SOURCE_OFFSET) <= stat_fast_block_i.trigger_source;
    regs(FAST_BLOCK_FSG_STATUS_SEL)(FAST_BLOCK_FSG_STATUS_STATE_BIT) <= stat_fast_block_i.trigger_state;
    regs(FAST_BLOCK_FSG_STATUS_SEL)(FAST_BLOCK_FSG_STATUS_CONFIGURED_BIT) <= stat_fast_block_i.if_configured;

    -- test clcok frequencies output
    regs(TEST_CLOCK_IPB_SEL) <= test_clock_frequency(0);
    regs(TEST_CLOCK_40MHZ_SEL) <= test_clock_frequency(1);
    regs(TEST_CLOCK_TRIGGER_SEL) <= test_clock_frequency(2);
    	
ERROR_HANDLER: process(reset, clk)
begin
    if reset = '1' then
       status_error_block_id <= x"0";
       status_error_code <= x"00"; 
    elsif rising_edge(clk) then
        if stat_fast_block_i.error_code /= x"00" then
            status_error_block_id <= x"1";
            status_error_code <= stat_fast_block_i.error_code;
        elsif stat_command_block_i.error_i2c_master /= x"00" then
            status_error_block_id <= x"2";
            status_error_code <= stat_command_block_i.error_i2c_master; 
        else
            status_error_block_id <= x"0";
            status_error_code <= x"00";  
        end if;    
    end if;
end process;

end rtl;
