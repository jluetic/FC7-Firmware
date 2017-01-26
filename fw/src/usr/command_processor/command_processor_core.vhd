----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 11/08/2016 12:52:31 PM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.system_package.all;
use work.user_package.all;
use work.ipbus.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity command_processor_core is
  Port ( 
    clk_40MHz       : in std_logic;
    ipb_clk         : in std_logic;
    reset           : in std_logic;   
    -- command from IpBus
    ipb_mosi_i      : in  ipb_wbus_array(0 to nbr_usr_slaves-1);
    ipb_miso_o      : out ipb_rbus_array(0 to nbr_usr_slaves-1);
    -- global control
    ipb_global_reset_o  : out std_logic; 
    -- fast command block control line
    ctrl_fastblock_o  : out ctrl_fastblock;
    cnfg_fastblock_o  : out cnfg_fastblock;
    -- output i2c command
    i2c_request     : out cmd_wbus;
    i2c_reply	    : in cmd_rbus;
    --===================================--
    -- statuses from other blocks
    --===================================--
    status_fast_block_fsm   : in std_logic_vector(7 downto 0);
    test_clock_frequency    : in array_4x32bit;
    --===================================--
    -- errors from other blocks
    --===================================--
    error_fast_block        : in std_logic_vector(7 downto 0)
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- I2C (incl. FIFO) Signals
    --==========================-- 
    signal i2c_reset             : std_logic;
    signal i2c_reset_fifos       : std_logic;   
    signal command_fifo_we       : std_logic;
    signal command_fifo_read_next: std_logic;
    signal command_fifo_data_in  : std_logic_vector(31 downto 0);
    signal command_fifo_data_out : std_logic_vector(31 downto 0);
    signal command_fifo_empty    : std_logic;
    signal command_fifo_empty_to_i2c : std_logic;
    
    signal reply_fifo_we         : std_logic;
    signal reply_fifo_read_next  : std_logic;
    signal reply_fifo_data_in    : std_logic_vector(31 downto 0);
    signal reply_fifo_data_out   : std_logic_vector(31 downto 0); 
    
    signal i2c_mask              : std_logic_vector(7 downto 0);   
    
    --==========================--    
    -- statuses
    --==========================--
    signal status_i2c_master_fsm  : std_logic_vector(3 downto 0);
    signal error_i2c_master       : std_logic_vector(7 downto 0);
    signal fifo_statuses          : fifo_stat;
    --==========================--   
        
begin
        
     --===================================--
     -- IPBus Control Decoder
     --===================================--
     ipbus_decoder_ctrl: entity work.ipbus_decoder_ctrl
     --===================================--
     port map
     (   
        clk                   => ipb_clk,
        reset                 => reset,
        ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_ctrl_sel),
        ipb_miso_o            => ipb_miso_o(ipb_daq_system_ctrl_sel),
        -- global commands
        ipb_global_reset      => ipb_global_reset_o,
        -- fast commands
        ctrl_fastblock_o      => ctrl_fastblock_o,
        -- i2c commands                       
        i2c_reset             => i2c_reset,
        i2c_reset_fifos       => i2c_reset_fifos,
        command_fifo_we_o     => command_fifo_we,
        command_fifo_data_o   => command_fifo_data_in,
        reply_fifo_read_next_o=> reply_fifo_read_next,
        reply_fifo_data_i     => reply_fifo_data_out
     );
     --===================================--
     
     --===================================--
     -- IPBus Config Decoder
     --===================================--
     ipbus_decoder_cnfg: entity work.ipbus_decoder_cnfg
     --===================================--
     port map
     (   
        clk                   => ipb_clk,
        reset                 => reset,
        ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_cnfg_sel),
        ipb_miso_o            => ipb_miso_o(ipb_daq_system_cnfg_sel),
        -- fast block
        cnfg_fastblock_o      => cnfg_fastblock_o,
        -- i2c mask
        i2c_mask              => i2c_mask
     );
    --===================================--
    
    --===================================--
    -- IPBus Status Decoder
    --===================================--
    ipbus_decoder_stat: entity work.ipbus_decoder_stat
    --===================================--
    port map
    (   
     clk                   => ipb_clk,
     reset                 => reset,
     ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_stat_sel),
     ipb_miso_o            => ipb_miso_o(ipb_daq_system_stat_sel),
     -- fast command block statuses
     status_fast_block_fsm => status_fast_block_fsm,
     error_fast_block      => error_fast_block,
     -- i2c master statuses
     status_i2c_master_fsm   => status_i2c_master_fsm,
     error_i2c_master       => error_i2c_master,
     fifo_statuses          => fifo_statuses,
     -- clock frequencies tester
     test_clock_frequency   => test_clock_frequency
    );
    --===================================--    
     
     --===================================--
     -- I2C Commands FIFO
     --===================================--
     i2c_commands_fifo: entity work.i2c_commands_fifo
    --===================================--
     port map
     (
        rst            => reset or i2c_reset or i2c_reset_fifos,
        wr_clk         => ipb_clk,
        rd_clk         => clk_40MHz,
        din            => command_fifo_data_in,
        wr_en          => command_fifo_we,
        rd_en          => command_fifo_read_next,
        dout           => command_fifo_data_out,
        full           => fifo_statuses.i2c_commands_full,
        empty          => command_fifo_empty
    );
    command_fifo_empty_to_i2c <= command_fifo_empty;
    fifo_statuses.i2c_commands_empty <= command_fifo_empty;
    --===================================--
    
    --===================================--
    -- I2C Replies FIFO
    --===================================--
    i2c_replies_fifo: entity work.i2c_replies_fifo
   --===================================--
    port map
    (
       rst            => reset or i2c_reset or i2c_reset_fifos,
       wr_clk         => clk_40MHz,
       rd_clk         => ipb_clk,
       din            => reply_fifo_data_in,
       wr_en          => reply_fifo_we,
       rd_en          => reply_fifo_read_next,
       dout           => reply_fifo_data_out,
       full           => fifo_statuses.i2c_replies_full,
       empty          => fifo_statuses.i2c_replies_empty
   );
   --===================================--
   
    --===================================--
    -- Block responsible for I2C Command Sending
    --===================================--
    i2c_master: entity work.cmd_i2c_master
    --===================================--
    generic map
    (
       NUM_HYBRIDS => NUM_HYBRIDS,
       NUM_CHIPS   => NUM_CHIPS
    )
    port map
    (
       clk              => clk_40MHz,
       reset            => reset or i2c_reset,
       i2c_mask         => i2c_mask,              
       command_fifo_empty_i     => command_fifo_empty_to_i2c,
       command_fifo_read_next_o => command_fifo_read_next,
       command_fifo_data_i      => command_fifo_data_out,
       reply_fifo_we_o          => reply_fifo_we,
       reply_fifo_data_o        => reply_fifo_data_in,
       i2c_fsm_status   => status_i2c_master_fsm,
       error_code       => error_i2c_master,
       i2c_request      => i2c_request,
       i2c_reply        => i2c_reply
    );        
    --===================================--

end rtl;
