----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2016 01:39:32 PM
-- Design Name: 
-- Module Name: sim_command_processor_core - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
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

entity sim_command_processor_core is
--  Port ( );
end sim_command_processor_core;

architecture Behavioral of sim_command_processor_core is

component command_processor_core
  Generic (
  NUM_HYBRIDS     : integer range 1 to 32 := 1;
  NUM_CHIPS       : integer range 1 to 16 := 1
);
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
    i2c_reply        : in cmd_rbus;
    --===================================--
    -- statuses from other blocks
    --===================================--
    status_fast_block_fsm   : in std_logic_vector(7 downto 0);
    --===================================--
    -- errors from other blocks
    --===================================--
    error_fast_block        : in std_logic_vector(7 downto 0)
);
end component;

component answer_block
    Port ( clk : in STD_LOGIC;
           request_strobe : in STD_LOGIC;
           i2c_reply : out cmd_rbus);
end component;

constant clk40_period : time := 25 ns;
constant clk_ipb_period : time := 32 ns;

signal clk_40MHz : std_logic;
signal clk_ipb : std_logic;

signal command_i2c : std_logic_vector(31 downto 0);
signal addr_i2c : std_logic_vector(31 downto 0);
signal command_fast : std_logic_vector(31 downto 0);
signal addr_fast : std_logic_vector(31 downto 0);
signal command_fast_reset : std_logic_vector(31 downto 0);
signal command_fast_start : std_logic_vector(31 downto 0);
signal command_fast_stop : std_logic_vector(31 downto 0);
signal command_fast_load_config : std_logic_vector(31 downto 0);


signal ipb_reset    : std_logic;
signal i2c_request              : cmd_wbus;
signal i2c_reply                : cmd_rbus;

signal reset                  : std_logic := '0';

signal command_type           : std_logic_vector(3 downto 0) := (others => '0');
-- hybrid_id
signal hybrid_id              : std_logic_vector(3 downto 0) := x"0";
-- cbc on hybrid id
signal chip_id                : std_logic_vector(3 downto 0) := x"1";
-- use mask
signal use_mask               : std_logic := '0';
-- page in the CBC
signal page                   : std_logic := '0';
-- read or write setting
signal read                   : std_logic := '1';
-- register_address
signal register_address       : std_logic_vector(7 downto 0) := x"23";
signal data                   : std_logic_vector(7 downto 0) := x"AB";

signal ipb_mosi_i      : ipb_wbus_array(0 to nbr_usr_slaves-1);
signal ipb_miso_o      : ipb_rbus_array(0 to nbr_usr_slaves-1);
signal strobe      : std_logic := '0';

    -- Control bus from Command Processor Block to Fast Command Block
    signal fast_block_ctrl       : ctrl_fastblock;
    signal fast_block_cnfg       : cnfg_fastblock;
    
    -- Stubs From Hybrids
    signal hybrid_stubs             : std_logic_vector(2 downto 1);
    signal fast_block_status_fsm    : std_logic_vector(7 downto 0);
    signal fast_block_error         : std_logic_vector(7 downto 0);

begin

    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_addr <= addr_fast;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_wdata <= command_fast;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_write <= '1';
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_strobe <= strobe;       

    addr_i2c <= x"4000011F";
    command_i2c <= command_type & hybrid_id & chip_id & '0' & use_mask & page & read & register_address & data;
    
    addr_fast <= x"40000101";
    command_fast_reset <= x"00000001";
    command_fast_start <= x"00000002";
    command_fast_stop <= x"00000004";
    command_fast_load_config <= x"00000008";    

    UUT: command_processor_core generic map (2,2)
    port map(clk_40MHz, clk_ipb, reset or ipb_reset, ipb_mosi_i, ipb_miso_o, ipb_reset, fast_block_ctrl, fast_block_cnfg, i2c_request, i2c_reply, fast_block_status_fsm, fast_block_error);
    
    fast_command_block: entity work.fast_command_core
        --===================================--
        generic map
        (
            NUM_HYBRIDS => 2
        )
        port map
        (
            clk_40Mhz               => clk_40MHz,
            l1_trigger_in           => '0',
            reset                   => reset or ipb_reset,
            -- control buses from Command Processor Block
            ctrl_fastblock_i        => fast_block_ctrl,
            cnfg_fastblock_i        => fast_block_cnfg,
            -- stubs from hybrids
            in_stubs                => hybrid_stubs,
            -- trigger status register output (3-2 - source, 1-0 - state)
            trigger_status_out      => fast_block_status_fsm,
            -- fast command block error
            error_code              => fast_block_error,
            -- output trigger to Hybrids
            trigger_out             => open
        );        
    
    
    PHY_REPONSE_GENERATOR: answer_block port map(clk_40MHz, i2c_request.cmd_strobe, i2c_reply);
        
    clk40_process: process
    begin
        clk_40MHz <= '1';
        wait for clk40_period/2;
        clk_40MHz <= '0';
        wait for clk40_period/2;
    end process;
    
    clk_ipb_process: process
    begin
        clk_ipb <= '1';
        wait for clk_ipb_period/2;
        clk_ipb <= '0';
        wait for clk_ipb_period/2;
    end process;
    
--    i2c_commands_process: process
--    begin
--        ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_addr <= addr_i2c;
--        ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_wdata <= command_i2c;
--        reset <= '1';
--        wait for 200 ns;
--        reset <= '0';
--        wait for 200 ns;
--        command_type <= x"0";
--        wait for 32 ns;
--        strobe <= '1';
--        wait for 32 ns;
--        strobe <= '0';
--        wait for 200 ns;
--        command_type <= x"1";
--        wait for 32 ns;
--        strobe <= '1';
--        wait for 32 ns;
--        strobe <= '0';
--        wait for 200 ns;
--        command_type <= x"2";
--        wait for 32 ns;
--        strobe <= '1';
--        wait for 32 ns;
--        strobe <= '0';
--        wait for 10000 ns;
--    end process;
    
    triggers_commands_process: process
    begin
        reset <= '1';
                wait for 200 ns;
                reset <= '0';
                wait for 200 ns;
        command_fast <= command_fast_reset;
                wait for 32 ns;
                strobe <= '1';
                wait for 32 ns;
                strobe <= '0';
                wait for 200 ns;
        command_fast <= command_fast_load_config;
                wait for 32 ns;
                strobe <= '1';
                wait for 32 ns;
                strobe <= '0';
                wait for 200 ns;
        command_fast <= command_fast_start;
                wait for 32 ns;
                strobe <= '1';
                wait for 32 ns;
                strobe <= '0';        
        wait for 10000 ns;
    end process;

end Behavioral;
