library ieee;
use ieee.std_logic_1164.all;
 
package user_package is

	constant sys_phase_mon_freq      : string   := "160MHz"; -- valid options only "160MHz" or "240MHz"    

   --=== ipb slaves =============--
	constant nbr_usr_slaves				: positive := 3 ;
   
    constant ipb_daq_system_cnfg_sel: integer  := 0;
    constant ipb_daq_system_ctrl_sel: integer  := 1;
    constant ipb_daq_system_stat_sel: integer  := 2;
    
    constant NUM_HYBRIDS            : integer := 2;
    constant NUM_CHIPS              : integer := 8;    
	
	constant MAX_NTRIGGERS_TO_ACCEPT    : integer := 1_000_000;
    constant CLK_FREQUENCY_HZ           : integer := 40_000_000;
    -- maximal trigger frequency in khz
	constant MAX_USER_TRIGGER_FREQUENCY    : integer := 1000;
	-- when checking trigger, maximal amount of time without trigger, seconds
	constant MAX_TIME_WITHOUT_TRIGGER      : integer := 1;
	

	type array_8x8bit  is array  (0 to  7) of std_logic_vector(7 downto 0);

	-- The signals going from master to slaves
  	type cmd_wbus is
    record
      cmd_strobe            : std_logic;
      -- hybrid_id
      cmd_hybrid_id 	    : std_logic_vector(3 downto 0);
      -- cbc on hybrid id
      cmd_chip_id           : std_logic_vector(3 downto 0);
      -- page in CBC
      cmd_page              : std_logic;
      -- read or write setting
      cmd_read              : std_logic;
      -- register_address
      cmd_register          : std_logic_vector(7 downto 0);
      -- register write mask ( to avoid overriding of the current settings )
      cmd_write_mask        : std_logic_vector(7 downto 0);
      -- data to cbc
      cmd_data              : std_logic_vector(7 downto 0); 
    end record;

  	type cmd_wbus_array is array(natural range <>) of cmd_wbus;
	 
	-- The signals going from slaves to master	 
  	type cmd_rbus is
    record
      cmd_strobe            : std_logic;
      cmd_data              : std_logic_vector(7 downto 0);
      cmd_err 	            : std_logic;
    end record;

  	type cmd_rbus_array is array(natural range <>) of cmd_rbus;

	-- Fast Command Bus, operates at 40MHz
  	type cmd_fastbus is
    record
      -- fast reset bit
      fast_reset            : std_logic;
      -- trigger bit
      trigger               : std_logic;
      -- trigger pulse bit
      test_pulse_trigger    : std_logic;
      -- orbit reset bit
      orbit_reset           : std_logic;
    end record;
   
    -- Config Bus From Command Processor to Fast Command Block
    type cnfg_fastblock_type is
    record
      -- source of the trigger signal
      trigger_source        : std_logic_vector(3 downto 0);
      -- number of triggers to accept
      triggers_to_accept    : integer range 0 to MAX_NTRIGGERS_TO_ACCEPT;
      -- trigger frequency divider, minimal frequency is 0.1Hz
      user_trigger_frequency: integer range 1 to MAX_USER_TRIGGER_FREQUENCY;
      -- stubs mask to get coincidence
      stubs_mask            : std_logic_vector(31 downto 0);
    end record;    
    -- Control Bus From Command Processor to Fast Command Block
    type ctrl_fastblock_type is
    record
      cmd_strobe            : std_logic;
      -- reset bit
      reset                 : std_logic;
      -- load config
      load_config           : std_logic;
      -- start/stop
      start_trigger         : std_logic;
      stop_trigger          : std_logic;
      -- fast signals
      ipb_fast_reset        : std_logic;
      ipb_test_pulse        : std_logic;
      ipb_trigger           : std_logic;
      ipb_orbit_reset       : std_logic;
    end record;
    
    type stat_fastblock_type is
    record
        -- trigger status register output (3-0 - source, 4 - state, 5 - configured)
        trigger_status        : std_logic_vector(7 downto 0);
        -- fast command block error
        error_code            : std_logic_vector(7 downto 0);
    end record;
    
    type cnfg_command_block_type is
    record
      -- mask for i2c data writing
      i2c_mask              : std_logic_vector(7 downto 0);
    end record;
    
    -- bus which goes from ipbus to command processor block
    type ctrl_command_block_from_ipbus_type is
    record
        -- i2c resets from ipbus
        i2c_reset             : std_logic;
        i2c_reset_fifos       : std_logic;
        -- command fifo writing from ipbus
        command_fifo_we       : std_logic;
        command_fifo_data     : std_logic_vector(31 downto 0);
        -- read next reply fifo data from command processor block
        reply_fifo_read_next  : std_logic;
    end record;
    
    -- bus which goes back from command processor block to ipbus (needed for fifo's)
    type ctrl_command_block_to_ipbus_type is
    record
        -- reply fifo data from command processor block
        reply_fifo_data       : std_logic_vector(31 downto 0);
    end record;
    
    type fifo_stat is
    record
        i2c_commands_empty   : std_logic;
        i2c_commands_full    : std_logic; 
        i2c_replies_empty    : std_logic;       
        i2c_replies_full     : std_logic;
        i2c_nreplies_present : std_logic_vector(15 downto 0);  
    end record;
    
    type stat_command_block_type is
    record
        status_i2c_master_fsm  : std_logic_vector(3 downto 0);
        error_i2c_master       : std_logic_vector(7 downto 0);
        fifo_statuses          : fifo_stat;
    end record;
    
end user_package;
   
package body user_package is
end user_package;
