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

    -- clock definition
    constant clk40_period : time := 25 ns;
    constant clk_ipb_period : time := 32 ns;    
    signal clk_40MHz : std_logic;
    signal clk_ipb : std_logic;
    
    -- command_type
    type ipb_command_type is (i2c_write, i2c_read, fast);
    type fast_command_type is (fast_reset, start, stop, load_config);
        
    signal ipb_reset    : std_logic;
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    
    signal reset                  : std_logic := '0';
    
    signal i2c_command_type           : std_logic_vector(3 downto 0) := (others => '0');
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
    
    signal ipb_strobe             : std_logic := '0';
    signal ipb_write              : std_logic := '1';
    signal ipb_addr : std_logic_vector(31 downto 0);
    signal ipb_wdata : std_logic_vector(31 downto 0);
    
    signal command_i2c : std_logic_vector(31 downto 0);
    
    signal test_clock_frequency   : array_4x32bit;
    
    signal ipb_mosi_i      : ipb_wbus_array(0 to nbr_usr_slaves-1);
    signal ipb_miso_o      : ipb_rbus_array(0 to nbr_usr_slaves-1);

    -- Control bus from Command Processor Block to Fast Command Block
    signal fast_block_ctrl       : ctrl_fastblock;
    signal fast_block_cnfg       : cnfg_fastblock;
    
    -- Stubs From Hybrids
    signal hybrid_stubs             : std_logic_vector(2 downto 1);
    signal fast_block_status_fsm    : std_logic_vector(7 downto 0);
    signal fast_block_error         : std_logic_vector(7 downto 0);
    
        --===================================--
    -- needed procedures
    --===================================--        
   
    function address(ipb_command_type_i      : in ipb_command_type)
    return std_logic_vector is
        variable address    : std_logic_vector(31 downto 0);
    begin        
        if ipb_command_type_i = i2c_write then
            address := x"40000240";
        elsif ipb_command_type_i = i2c_read then
            address := x"40000250";
        elsif ipb_command_type_i = fast then
            address := x"40000201";
        end if;
    return address;
    end address;
    
    function fast_command(fast_command_type_i      : in fast_command_type)
    return std_logic_vector is
        variable command    : std_logic_vector(31 downto 0);
    begin
    
        if fast_command_type_i = fast_reset then
            command := x"00000001";
        elsif fast_command_type_i = start then
           command := x"00000002";
        elsif fast_command_type_i = stop then
           command := x"00000004";
        elsif fast_command_type_i = load_config then
           command := x"00000008"; 
        end if;
    return command;        
    end fast_command;

begin 

    --===================================--
    -- clocks
    --===================================--    
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

    --===================================--
    -- port maps
    --===================================--  

    command_processor_block: entity work.command_processor_core
    port map( 
        clk_40MHz           => clk_40MHz,
        ipb_clk             => clk_ipb,
        reset               => reset or ipb_reset,   
        -- command from IpBus
        ipb_mosi_i          => ipb_mosi_i,
        ipb_miso_o          => ipb_miso_o,
        -- global control
        ipb_global_reset_o  => ipb_reset,
        -- fast command block control line
        ctrl_fastblock_o    => fast_block_ctrl,
        cnfg_fastblock_o    => fast_block_cnfg,
        -- output i2c command
        i2c_request         => i2c_request,
        i2c_reply           => i2c_reply,
        --===================================--
        -- statuses from other blocks
        --===================================--
        status_fast_block_fsm   => fast_block_status_fsm,
        test_clock_frequency    => test_clock_frequency,
        --===================================--
        -- errors from other blocks
        --===================================--
        error_fast_block        => fast_block_error
    );
    
    fast_command_block: entity work.fast_command_core
        --===================================--
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
            -- output fast signals to phy_block
            fast_signal             => open
        );        
    
    PHY_RESPONSE_GENERATOR: entity work.answer_block
    port map ( clk          => clk_40MHz,
               i2c_request  => i2c_request,
               i2c_reply    => i2c_reply);
 
    command_i2c <= i2c_command_type & hybrid_id & chip_id & '0' & use_mask & page & read & register_address & data;
               
    --===================================--
    -- execution
    --===================================--               

    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_addr  <= ipb_addr;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_wdata <= ipb_wdata;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_strobe <= ipb_strobe;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_write <= ipb_write;

    commands_process: process
    begin
        -- initialization
        reset <= '1';
        wait for 200 ns;
        reset <= '0';
        wait for 200 ns;
        
        --=======================--
        -- send i2c command
        --=======================--
        ipb_addr <= address(i2c_write);
        -- 0 - certain hybrid/chip, 1 - all chips on hybrid, 2 - all hybrids all chups
        i2c_command_type <= x"1";
        -- combined from hybrid id, chip id, read, page, etc.. see in signal definition
        ipb_wdata   <= command_i2c;
        ipb_write <= '1';
            wait for 32 ns;
            ipb_strobe <= '1';
            wait for 32 ns;
            ipb_strobe <= '0';        
        wait for 500 ns;        
        
        --=======================--
        -- read i2c reply
        --=======================--
        ipb_addr <= address(i2c_read);
        ipb_wdata   <= x"00000000";
        ipb_write <= '0';
            wait for 32 ns;
            ipb_strobe <= '1';
            wait for 32 ns;
            ipb_strobe <= '0';
        wait for 100 ns;
        
        --=======================--
        -- config trigger source to User-Defined Frequency (will be 40 MHz now)
        -- see fc7Addr.dat in python scripts to understand the values
        --=======================--
        
        ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_addr  <= x"40000128";
        -- 1 - l1, 2 - stubs, 3 - user-defined
        ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_wdata <= x"00000003";
        ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_write <= '1';
            wait for 32 ns;
            ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_strobe <= '1';
            wait for 32 ns;
            ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_strobe <= '0';
        wait for 100 ns;
        
        --=======================--
        -- play with triggers
        --=======================--
        ipb_addr <= address(fast);  
        ipb_write <= '1';      
        ipb_wdata <= fast_command(load_config);
            wait for 32 ns;
            ipb_strobe <= '1';
            wait for 32 ns;
            ipb_strobe <= '0';
        wait for 100 ns;
        
        ipb_wdata <= fast_command(start);
            wait for 32 ns;
            ipb_strobe <= '1';
            wait for 32 ns;
            ipb_strobe <= '0';
        wait for 1000 ns;
        
        ipb_wdata <= fast_command(stop);
            wait for 32 ns;
            ipb_strobe <= '1';
            wait for 32 ns;
            ipb_strobe <= '0';
        
        -- wait at the end    
        wait for 10000 ns;
    end process;

end Behavioral;
