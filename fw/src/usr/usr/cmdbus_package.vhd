library ieee;
use ieee.std_logic_1164.all;

package cmdbus is

-- The signals going from master to slaves
  type cmd_wbus is
    record
      cmd_strobe            : std_logic;
      -- hybrid_id
      cmd_hybrid_id 	    : std_logic_vector(4 downto 0);
      -- cbc on hybrid id
      cmd_chip_id           : std_logic_vector(3 downto 0);
      -- page in CBC
      cmd_page              : std_logic;
      -- read or write setting
      cmd_read              : std_logic;
      -- register_address
      cmd_register          : std_logic_vector(7 downto 0);
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

end cmdbus;
