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
    -- controls from ipbus
    cnfg_command_block              : in cnfg_command_block_type;
    ctrl_command_block_from_ipbus   : in ctrl_command_block_from_ipbus_type;                    
    ctrl_command_block_to_ipbus     : out ctrl_command_block_to_ipbus_type;   
    -- output i2c commands
    i2c_request     : out cmd_wbus;
    i2c_reply	    : in cmd_rbus;
    -- fifo statuses out
    stat_command_block              : out stat_command_block_type
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- I2C (incl. FIFO) Signals
    --==========================-- 
    signal command_fifo_read_next: std_logic;
    signal command_fifo_data_out : std_logic_vector(31 downto 0);
    signal command_fifo_empty    : std_logic;
    signal command_fifo_empty_to_i2c : std_logic;
    
    signal reply_fifo_we         : std_logic;
    signal reply_fifo_data_in    : std_logic_vector(31 downto 0);
    
    signal i2c_request_int       : cmd_wbus;  
    
    signal reset_tmp        : std_logic :='0';  
        
begin

    -- used for counter
    i2c_request <= i2c_request_int;      
    
     
      process(clk_40MHz)
           variable cnt : integer := 0;
   
       begin
           if (rising_edge(clk_40MHz)) then
               if (cnt<6) then
                   reset_tmp <= '1';
                   cnt := cnt+1;
               else
                   reset_tmp <= '0';
               end if;
           end if;
        end process;
     
     
     --===================================--
     -- I2C Commands FIFO
     --===================================--
     i2c_commands_fifo: entity work.i2c_commands_fifo
    --===================================--
     port map
     (
        rst            => reset_tmp or reset or ctrl_command_block_from_ipbus.i2c_reset or ctrl_command_block_from_ipbus.i2c_reset_fifos,
        wr_clk         => ipb_clk,
        rd_clk         => clk_40MHz,
        din            => ctrl_command_block_from_ipbus.command_fifo_data,
        wr_en          => ctrl_command_block_from_ipbus.command_fifo_we,
        rd_en          => (not reset_tmp) and command_fifo_read_next,
        dout           => command_fifo_data_out,
        full           => stat_command_block.fifo_statuses.i2c_commands_full,
        empty          => command_fifo_empty
    );
    command_fifo_empty_to_i2c <= command_fifo_empty;
    stat_command_block.fifo_statuses.i2c_commands_empty <= command_fifo_empty;
    --===================================--
    
    --===================================--
    -- I2C Replies FIFO
    --===================================--
    i2c_replies_fifo: entity work.i2c_replies_fifo
   --===================================--
    port map
    (
       reset            => reset or ctrl_command_block_from_ipbus.i2c_reset or ctrl_command_block_from_ipbus.i2c_reset_fifos,
       wr_clk           => clk_40MHz,
       rd_clk           => ipb_clk,
       reply_ready      => reply_fifo_we,
       din_i            => reply_fifo_data_in,
       read_next        => ctrl_command_block_from_ipbus.reply_fifo_read_next,
       dout_o           => ctrl_command_block_to_ipbus.reply_fifo_data,
       empty_o          => stat_command_block.fifo_statuses.i2c_replies_empty,
       full_o           => stat_command_block.fifo_statuses.i2c_replies_full,
       ndata_o          => stat_command_block.fifo_statuses.i2c_nreplies_present
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
       reset            => reset or ctrl_command_block_from_ipbus.i2c_reset,
       i2c_mask         => cnfg_command_block.i2c_mask,              
       command_fifo_empty_i     => command_fifo_empty_to_i2c,
       command_fifo_read_next_o => command_fifo_read_next,
       command_fifo_data_i      => command_fifo_data_out,
       reply_fifo_we_o          => reply_fifo_we,
       reply_fifo_data_o        => reply_fifo_data_in,
       i2c_fsm_status   => stat_command_block.status_i2c_master_fsm,
       error_code       => stat_command_block.error_i2c_master,
       i2c_request      => i2c_request_int,
       i2c_reply        => i2c_reply
    );        
    --===================================--

end rtl;
