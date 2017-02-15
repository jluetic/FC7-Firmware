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

entity sim_usr_general is
--  Port ( );
end sim_usr_general;

architecture Behavioral of sim_usr_general is

    -- clock definition
    constant clk40_period : time := 25 ns;
    constant clk_ipb_period : time := 32 ns;
    constant clk125_period  : time := 8 ns;    
    signal clk_40MHz_p : std_logic;
    signal clk_40MHz_n : std_logic;
    signal clk_ipb : std_logic;
    signal clk_125MHz : std_logic;
            
    -- command_type
    type ipb_command_type is (global_sel,i2c_write, i2c_read, fast);
    type fast_command_type is (fast_reset, start, stop, load_config);
    type sim_signal_type is (new_iteration, end_of_i2c_write, end_of_i2c_read, trigger_started, trigger_stopped);
    
    -- sim signals
    signal new_iteration_sig        : std_logic := '0';
    signal end_of_i2c_write_sig        : std_logic := '0';
    signal end_of_i2c_read_sig        : std_logic := '0';
    signal trigger_started_sig        : std_logic := '0';
    signal trigger_stopped_sig        : std_logic := '0';
    signal i2c_read_fifo : std_logic := '0';
    
    -- ipbus signals
    signal ipb_ctrl_strobe             : std_logic := '0';
    signal ipb_ctrl_write              : std_logic := '1';
    signal ipb_ctrl_addr : std_logic_vector(31 downto 0) := (others => '0');
    signal ipb_ctrl_wdata : std_logic_vector(31 downto 0) := (others => '0');
    
    signal ipb_cnfg_strobe              : std_logic := '0';
    signal ipb_cnfg_addr                : std_logic_vector(31 downto 0) := (others => '0');
    signal ipb_cnfg_wdata               : std_logic_vector(31 downto 0) := (others => '0');   
    
    signal ipb_stat_strobe              : std_logic := '0';
    signal ipb_stat_addr                : std_logic_vector(31 downto 0) := (others => '0');
    
    signal ipb_mosi_i      : ipb_wbus_array(0 to nbr_usr_slaves-1);
    signal ipb_miso_o      : ipb_rbus_array(0 to nbr_usr_slaves-1);
    
    --===================================--
    -- i2c
    --===================================--      
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
    --===================================--    

    --===================================--
    -- needed procedures
    --===================================--        
   
    function ctrl_address(ipb_command_type_i      : in ipb_command_type)
    return std_logic_vector is
        variable address    : std_logic_vector(31 downto 0);
    begin  
        if(ipb_command_type_i = global_sel) then
            address := x"40000200";      
        elsif ipb_command_type_i = i2c_write then
            address := x"40000240";
        elsif ipb_command_type_i = i2c_read then
            address := x"40000250";
        elsif ipb_command_type_i = fast then
            address := x"40000201";
        end if;
    return address;
    end ctrl_address;   
    
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
        clk_40MHz_p <= '1';
        clk_40MHz_n <= '0';
        wait for clk40_period/2;
        clk_40MHz_p <= '0';
        clk_40MHz_n <= '1';
        wait for clk40_period/2;
    end process;
    
    clk_ipb_process: process
    begin
        clk_ipb <= '1';
        wait for clk_ipb_period/2;
        clk_ipb <= '0';
        wait for clk_ipb_period/2;
    end process;    

    clk125_process: process
    begin
        clk_125MHz <= '1';
        wait for clk125_period/2;
        clk_125MHz <= '0';
        wait for clk125_period/2;
    end process;
   
   --==============================--
    usr: entity work.user_core
    --==============================--
    port map
    (
        --# led 
        usrled1_r                     => open,
        usrled1_g                     => open,
        usrled1_b                     => open,
        usrled2_r                     => open,
        usrled2_g                     => open,
        usrled2_b                     => open,
    
        --# on-board fabric clk
        fabric_clk_p                  => clk_40MHz_p,                 
        fabric_clk_n                  => clk_40MHz_n,   
        fabric_coax_or_osc_p          => '0',     
        fabric_coax_or_osc_n          => '0',     
    
        --# on-board mgt clk
        pcie_clk_p                    => '0',            
        pcie_clk_n                    => '0',
        osc_xpoint_a_p                => '0',                
        osc_xpoint_a_n                => '0',                
        osc_xpoint_b_p                => '0',                
        osc_xpoint_b_n                => '0',                
        osc_xpoint_c_p                => '0',                
        osc_xpoint_c_n                => '0',                
        osc_xpoint_d_p                => '0',                
        osc_xpoint_d_n                => '0',                
        ttc_mgt_xpoint_a_p            => '0',        
        ttc_mgt_xpoint_a_n            => '0',        
        ttc_mgt_xpoint_b_p            => '0',        
        ttc_mgt_xpoint_b_n            => '0',        
        ttc_mgt_xpoint_c_p            => '0',        
        ttc_mgt_xpoint_c_n            => '0',        
                                      
        --# fmc mgt clk               
        fmc_l12_gbtclk0_a_p           => '0',        
        fmc_l12_gbtclk0_a_n           => '0',    
        fmc_l12_gbtclk1_a_p           => '0',        
        fmc_l12_gbtclk1_a_n           => '0',        
        fmc_l12_gbtclk0_b_p           => '0',        
        fmc_l12_gbtclk0_b_n           => '0',        
        fmc_l12_gbtclk1_b_p           => '0',        
        fmc_l12_gbtclk1_b_n           => '0',        
        fmc_l8_gbtclk0_p              => '0',            
        fmc_l8_gbtclk0_n              => '0',            
        fmc_l8_gbtclk1_p              => '0',            
        fmc_l8_gbtclk1_n              => '0',            
                                      
        --# fmc mgt
        fmc_l12_dp_c2m_p              => open,
        fmc_l12_dp_c2m_n              => open,
        fmc_l12_dp_m2c_p              => (others => '0'),
        fmc_l12_dp_m2c_n              => (others => '0'),
        fmc_l8_dp_c2m_p               => open,
        fmc_l8_dp_c2m_n               => open,
        fmc_l8_dp_m2c_p               => (others => '0'),
        fmc_l8_dp_m2c_n               => (others => '0'),
    
        -- fmc fabric clk
        fmc_l8_clk0                   => '0',    
        fmc_l8_clk1                   => '0',  
        fmc_l12_clk0                  => '0', 
        fmc_l12_clk1                  => '0', 
        
        -- fmc gpio
        fmc_l12_la_p                  => open,     
        fmc_l12_la_n                  => open,
        fmc_l8_la_p                   => open,
        fmc_l8_la_n                   => open,   
        
        --# amc mgt                                
        k7_amc_rx_p                   => open,
        k7_amc_rx_n                   => open,    
        amc_tx_p                      => open,
        amc_tx_n                      => open,
               
        --# amc fabric                         
        k7_fabric_amc_rx_p03          => open,
        k7_fabric_amc_rx_n03          => open,
        k7_fabric_amc_tx_p03          => open,
        k7_fabric_amc_tx_n03          => open,
        
        --# ddr3
        ddr3_sys_clk_p                => '0' ,
        ddr3_sys_clk_n                => '0' ,
        ddr3_dq                       => open,
        ddr3_dqs_p                    => open,
        ddr3_dqs_n                    => open,
        ddr3_addr                     => open,
        ddr3_ba                       => open,
        ddr3_ras_n                    => open,
        ddr3_cas_n                    => open,
        ddr3_we_n                     => open,
        ddr3_reset_n                  => open,
        ddr3_ck_p                     => open,
        ddr3_ck_n                     => open,
        ddr3_cke                      => open,
        ddr3_cs_n                     => open,
        ddr3_dm                       => open,
        ddr3_odt                      => open,
        
        --# cdce
        cdce_pll_lock_i               => '0',
        cdce_ref_sel_o                => open, 
        cdce_pwrdown_o                => open,
        cdce_pri_clk_bufg_o           => open,
        cdce_sync_o                   => open,
        cdce_sync_clk_o               => open,
        
        --# system clk        
        osc125_a_bufg_i               => '0',                    
        osc125_a_mgtrefclk_i          => clk_125MHz,
        osc125_b_bufg_i               => '0',                    
        osc125_b_mgtrefclk_i          => '0',
        clk_31_250_bufg_i             => clk_ipb,                    
                                                            
        --# ipbus comm    
        ipb_clk_o                     => open,
        ipb_rst_i                     => '0', 
        ipb_mosi_i                    => ipb_mosi_i,
        ipb_miso_o                    => ipb_miso_o,
    
        --# ipbus conf
        ip_addr_o                     => open,                            
        mac_addr_o                    => open,                            
        use_i2c_eeprom_o              => open,
        rarp_en_o                     => open    
        
    );    
    --==============================--
   
    --===================================--
    -- execution
    --===================================--               

    -- ipbus control
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_addr  <= ipb_ctrl_addr;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_wdata <= ipb_ctrl_wdata;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_write <= ipb_ctrl_write;
    ipb_mosi_i(ipb_daq_system_ctrl_sel).ipb_strobe <= ipb_ctrl_strobe;
    
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_addr  <= ipb_cnfg_addr;
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_wdata <= ipb_cnfg_wdata;
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_write <= '1';
    ipb_mosi_i(ipb_daq_system_cnfg_sel).ipb_strobe <= ipb_cnfg_strobe;
    
    ipb_mosi_i(ipb_daq_system_stat_sel).ipb_addr  <= ipb_stat_addr;
    ipb_mosi_i(ipb_daq_system_stat_sel).ipb_wdata <= x"00000000";
    ipb_mosi_i(ipb_daq_system_stat_sel).ipb_write <= '0';
    ipb_mosi_i(ipb_daq_system_stat_sel).ipb_strobe <= ipb_stat_strobe;

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
        
        procedure send_ipb_stat_strobe is
        begin
            ipb_stat_strobe <= '1';
            wait for 32 ns;
            ipb_stat_strobe <= '0';
        end send_ipb_stat_strobe;
        
        procedure reset_board is
        begin
            ipb_ctrl_addr <= ctrl_address(global_sel);
            ipb_ctrl_wdata <= x"00000001";
            ipb_ctrl_write <= '1';
            send_ipb_ctrl_strobe;
            wait for 500 ns;
        end reset_board;
        
        procedure read_i2c_reply is
        begin
            ipb_ctrl_addr <= ctrl_address(i2c_read);
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
            ipb_ctrl_addr <= ctrl_address(i2c_write);            
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
        reset_board;
        
        --=======================--
        -- send i2c command
        --=======================--
        write_i2c_command(x"1");       
        wait for 1500 ns;
        send(end_of_i2c_write);
        wait for 100 ns;     
        
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
        ipb_ctrl_addr <= ctrl_address(fast);  
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
    end process;
    
    i2c_read_fifo <= '1' when ipb_miso_o(ipb_daq_system_ctrl_sel).ipb_rdata /= x"00000000" else '0';
    
    SELF_CHECKER: process (new_iteration_sig, end_of_i2c_write_sig, end_of_i2c_read_sig, trigger_started_sig, trigger_stopped_sig, i2c_read_fifo)
        variable i2c_command_counter : integer := 0;
        variable i2c_replies_counter : integer := 0;
        variable trigger_counter : integer := 0;        
    begin              
        if new_iteration_sig = '1' then
            i2c_command_counter := 0;
            i2c_replies_counter := 0;
        end if;
        if end_of_i2c_write_sig = '1' then
            -- not implemented yet, needs to be routed from usr block outside
            --ASSERT i2c_command_counter = NUM_CHIPS REPORT ("Wrong number of I2C Commands Sent.. Has to be " & integer'image(NUM_CHIPS) & ", but " & integer'image(i2c_command_counter) & " were sent!") SEVERITY failure;
            i2c_replies_counter := 0;
        end if;
        if end_of_i2c_read_sig = '1' then
            ASSERT i2c_replies_counter = 3 REPORT ("Wrong number of I2C Commands have been read.. Has to be " & integer'image(3) & ", but " & integer'image(i2c_replies_counter) & " have been read!") SEVERITY failure;
        end if;
        if trigger_stopped_sig = '1' then
            -- not implemented yet, needs to be routed from usr block outside
            --ASSERT trigger_counter = 10 REPORT ("Wrong number of triggers received.. Has to be " & integer'image(10) & ", but " & integer'image(trigger_counter) & " were received!") SEVERITY failure;
        end if;
        -- here i2c_request.cmd_strobe has to be used
        if rising_edge(i2c_read_fifo) then
            i2c_command_counter := i2c_command_counter + 1;
        end if;
        if rising_edge(i2c_read_fifo) then
            i2c_replies_counter := i2c_replies_counter + 1;
        end if;            
        if trigger_started_sig = '1' then
            trigger_counter := 0;
        -- here trigger has to be used
        elsif rising_edge(i2c_read_fifo) then
            trigger_counter := trigger_counter + 1;
        end if;
    end process;

end Behavioral;
