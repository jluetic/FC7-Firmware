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
    type sim_signal_type is (new_iteration, end_of_i2c_write, end_of_i2c_read, trigger_started, trigger_stopped);
    
    -- sim signals
    signal new_iteration_sig        : std_logic := '0';
    signal end_of_i2c_write_sig        : std_logic := '0';
    signal end_of_i2c_read_sig        : std_logic := '0';
    signal trigger_started_sig        : std_logic := '0';
    signal trigger_stopped_sig        : std_logic := '0';
    signal i2c_read_fifo : std_logic := '0';
        
    signal ipb_reset    : std_logic;
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    
    signal reset                  : std_logic := '0';
    
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
    
    signal ipb_ctrl_strobe             : std_logic := '0';
    signal ipb_ctrl_write              : std_logic := '1';
    signal ipb_ctrl_addr : std_logic_vector(31 downto 0);
    signal ipb_ctrl_wdata : std_logic_vector(31 downto 0);
    
    signal ipb_cnfg_strobe             : std_logic := '0';
    signal ipb_cnfg_addr : std_logic_vector(31 downto 0);
    signal ipb_cnfg_wdata : std_logic_vector(31 downto 0);   
    
    
    signal test_clock_frequency   : array_4x32bit;
    
    signal ipb_mosi_i      : ipb_wbus_array(0 to nbr_usr_slaves-1);
    signal ipb_miso_o      : ipb_rbus_array(0 to nbr_usr_slaves-1);

    -- Control bus from Command Processor Block to Fast Command Block
    signal fast_block_ctrl       : ctrl_fastblock;
    signal fast_block_cnfg       : cnfg_fastblock;
    signal fast_signal           : cmd_fastbus;
    
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
            user_trigger_out        => open,
            -- output fast signals to phy_block
            fast_signal             => fast_signal
        );        
    
    PHY_RESPONSE_GENERATOR: entity work.answer_block
    port map ( clk          => clk_40MHz,
               i2c_request  => i2c_request,
               i2c_reply    => i2c_reply);
 
               
    --===================================--
    -- execution
    --===================================--               

    -- ipbus control
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_addr  <= ipb_ctrl_addr;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_wdata <= ipb_ctrl_wdata;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_strobe <= ipb_ctrl_strobe;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_write <= ipb_ctrl_write;
    
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_addr  <= ipb_cnfg_addr;
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_wdata <= ipb_cnfg_wdata;
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_write <= '1';
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_strobe <= ipb_cnfg_strobe;

    STIMULUS: process
        procedure send_ipb_ctrl_strobe is
        begin
            ipb_ctrl_strobe <= '1';
            wait for 32 ns;
            ipb_ctrl_strobe <= '0';
        end send_ipb_ctrl_strobe;
        
        procedure send_ipb_cnfg_strobe is
        begin
            ipb_cnfg_strobe <= '1';
            wait for 32 ns;
            ipb_cnfg_strobe <= '0';
        end send_ipb_cnfg_strobe;
        
        procedure read_i2c_reply is
        begin
            ipb_ctrl_addr <= address(i2c_read);
            ipb_ctrl_wdata   <= x"00000000";
            ipb_ctrl_write <= '0';
            send_ipb_ctrl_strobe;
            wait for 64 ns;
        end read_i2c_reply;
        
        -- 0 - certain hybrid/chip, 1 - all chips on hybrid, 2 - all hybrids all chups
        procedure write_i2c_command( i2c_command : in std_logic_vector(3 downto 0) ) is
            variable command_i2c : std_logic_vector(31 downto 0);
        begin            
            command_i2c := i2c_command & hybrid_id & chip_id & '0' & use_mask & page & read & register_address & data;
            ipb_ctrl_addr <= address(i2c_write);            
            -- combined from hybrid id, chip id, read, page, etc.. see in signal definition
            ipb_ctrl_wdata <= command_i2c;
            ipb_ctrl_write <= '1';
            send_ipb_ctrl_strobe;      
        end write_i2c_command;
        
        procedure send( sim_signal : in sim_signal_type ) is
        begin
            if sim_signal = new_iteration then
                new_iteration_sig <= '1';
                wait for 5 ns;
                new_iteration_sig <= '0';
            elsif sim_signal = end_of_i2c_write then
                end_of_i2c_write_sig <= '1';
                wait for 5 ns;
                end_of_i2c_write_sig <= '0';
            elsif sim_signal = end_of_i2c_read then
                end_of_i2c_read_sig <= '1';
                wait for 5 ns;
                end_of_i2c_read_sig <= '0';
            elsif sim_signal = trigger_started then
                trigger_started_sig <= '1';
                wait for 5 ns;
                trigger_started_sig <= '0';
            elsif sim_signal = trigger_stopped then
                trigger_stopped_sig <= '1';
                wait for 5 ns;
                trigger_stopped_sig <= '0';
            end if;
        end send;
        
        variable i2c_command : std_logic_vector(3 downto 0);
    begin
        send(new_iteration);
        -- initialization
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 200 ns;
        
        --=======================--
        -- send i2c command
        --=======================--
        write_i2c_command(x"1");       
        wait for 1500 ns;
        send(end_of_i2c_write);
                
        
        --=======================--
        -- read i2c reply
        --=======================--
        read_i2c_reply;
        read_i2c_reply;
        read_i2c_reply;               
        wait for 100 ns; 
        send(end_of_i2c_read);  
        
        --=======================--
        -- config trigger source to User-Defined Frequency (will be 1 kHz now)
        -- see fc7Addr.dat in python scripts to understand the values
        --=======================--
        
        -- trigger source line
        ipb_cnfg_addr  <= x"40000128";
        -- 1 - l1, 2 - stubs, 3 - user-defined
        ipb_cnfg_wdata <= x"00000003";
        send_ipb_cnfg_strobe;
        
        -- trigger frequency line
        ipb_cnfg_addr  <= x"40000124";
        -- 1MHz
        ipb_cnfg_wdata <= x"000003E8";
        send_ipb_cnfg_strobe;
        
        --=======================--
        -- play with triggers
        --=======================--
        ipb_ctrl_addr <= address(fast);  
        ipb_ctrl_write <= '1';      
        ipb_ctrl_wdata <= fast_command(load_config);
        send_ipb_ctrl_strobe;
        wait for 100 ns;
        
        send(trigger_started);
        ipb_ctrl_wdata <= fast_command(start);
        send_ipb_ctrl_strobe;
        wait for 10 us;
        
        ipb_ctrl_wdata <= fast_command(stop);
        send_ipb_ctrl_strobe;
        send(trigger_stopped);
        
        -- wait at the end    
        wait for 300 ns;
    end process;
    
    INFO_PRINTER: process
    begin
        wait until new_iteration_sig = '1';
        report "Time " & time'image(now) & ": New Iteration Started" severity note;
        wait until reset = '1';
        report "Time " & time'image(now) & ": Entering Reset state" severity note;
        wait until reset = '0';
        report "Time " & time'image(now) & ": Leaving Reset state" severity note;
    end process;
    
    i2c_read_fifo <= '1' when ipb_miso_o(ipb_daq_system_ctrl_sel).ipb_rdata /= x"00000000" else '0';
    
    SELF_CHECKER: process (new_iteration_sig, end_of_i2c_write_sig, end_of_i2c_read_sig, trigger_started_sig, trigger_stopped_sig, i2c_request.cmd_strobe, fast_signal.trigger, i2c_read_fifo)
        variable i2c_command_counter : integer := 0;
        variable i2c_replies_counter : integer := 0;
        variable trigger_counter : integer := 0;        
    begin              
        if new_iteration_sig = '1' then
            i2c_command_counter := 0;
            i2c_replies_counter := 0;
        end if;
        if end_of_i2c_write_sig = '1' then
            ASSERT i2c_command_counter = NUM_CHIPS REPORT ("Wrong number of I2C Commands Sent.. Has to be " & integer'image(NUM_CHIPS) & ", but " & integer'image(i2c_command_counter) & " were sent!") SEVERITY failure;
            i2c_replies_counter := 0;
        end if;
        if end_of_i2c_read_sig = '1' then
            ASSERT i2c_replies_counter = 3 REPORT ("Wrong number of I2C Commands have been read.. Has to be " & integer'image(3) & ", but " & integer'image(i2c_replies_counter) & " have been read!") SEVERITY failure;
        end if;
        if trigger_stopped_sig = '1' then
            ASSERT trigger_counter = 10 REPORT ("Wrong number of triggers received.. Has to be " & integer'image(10) & ", but " & integer'image(trigger_counter) & " were received!") SEVERITY failure;
        end if;
        if rising_edge(i2c_request.cmd_strobe) then
            i2c_command_counter := i2c_command_counter + 1;
        end if;
        if rising_edge(i2c_read_fifo) then
            i2c_replies_counter := i2c_replies_counter + 1;
        end if;            
        if trigger_started_sig = '1' then
            trigger_counter := 0;
        elsif rising_edge(fast_signal.trigger) then
            trigger_counter := trigger_counter + 1;
        end if;
    end process;

end Behavioral;
