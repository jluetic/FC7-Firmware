library ieee;
use ieee.std_logic_1164.all;
 
package user_package is

	constant sys_phase_mon_freq      : string   := "160MHz"; -- valid options only "160MHz" or "240MHz"    

   --=== ipb slaves =============--
	constant nbr_usr_slaves				: positive := 3 ;
   
    constant ipb_daq_system_cnfg_sel: integer  := 0;
    constant ipb_daq_system_ctrl_sel: integer  := 1;
    constant ipb_daq_system_stat_sel: integer  := 2;
    
	
	constant MAX_NTRIGGERS_TO_ACCEPT : integer := 1_000_000;
	constant MAX_TRIGGER_DIVIDER     : integer := 400_000_000;


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
      -- external pulse request (for electrical implementation)
      external_pulse_request : std_logic; 
    end record;
   
    -- Config Bus From Command Processor to Fast Command Block
    type cnfg_fastblock is
    record
      -- source of the trigger signal
      trigger_source        : std_logic_vector(3 downto 0);
      -- number of triggers to accept
      triggers_to_accept    : integer range 0 to MAX_NTRIGGERS_TO_ACCEPT;
      -- trigger frequency divider, minimal frequency is 0.1Hz
      divider               : integer range 1 to MAX_TRIGGER_DIVIDER;
      -- stubs mask to get coincidence
      stubs_mask            : std_logic_vector(31 downto 0);
    end record;    
    -- Control Bus From Command Processor to Fast Command Block
    type ctrl_fastblock is
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
      fast_signal_reset             : std_logic;
      fast_signal_test_pulse        : std_logic;
      fast_signal_trigger           : std_logic;
      fast_signal_orbit_reset       : std_logic;
    end record;
    
    type fifo_stat is
    record
        i2c_commands_empty   : std_logic;
        i2c_commands_full    : std_logic; 
        i2c_replies_empty    : std_logic;       
        i2c_replies_full     : std_logic;        
    end record;
    
end user_package;
   
package body user_package is
end user_package;
