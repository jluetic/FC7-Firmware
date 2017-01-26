library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


use work.ipbus.all;
use work.system_package.all;
--! user packages
use work.user_package.all;
use work.user_version_package.all;

library unisim;
use unisim.vcomponents.all;

entity user_core is 
port
(

	--# led
	usrled1_r						: out	std_logic; -- fmc_l12_spare[8]
	usrled1_g						: out	std_logic; -- fmc_l12_spare[9]
	usrled1_b						: out	std_logic; -- fmc_l12_spare[10]
	usrled2_r						: out	std_logic; -- fmc_l12_spare[11]
	usrled2_g						: out	std_logic; -- fmc_l12_spare[12]
	usrled2_b						: out	std_logic; -- fmc_l12_spare[13]

	--# on-board fabric clk
    fabric_clk_p                    : in    std_logic; -- new port [PV 2015.08.19]
    fabric_clk_n                    : in    std_logic; -- new port [PV 2015.08.19]
    fabric_coax_or_osc_p 			: in 	std_logic;
	fabric_coax_or_osc_n 			: in 	std_logic;

	--# on-board mgt clk
	pcie_clk_p						: in	std_logic;
    pcie_clk_n                      : in    std_logic;
	osc_xpoint_a_p					: in	std_logic;
	osc_xpoint_a_n					: in	std_logic;
	osc_xpoint_b_p					: in	std_logic;
	osc_xpoint_b_n					: in	std_logic;
	osc_xpoint_c_p					: in	std_logic;
	osc_xpoint_c_n					: in	std_logic;
	osc_xpoint_d_p					: in	std_logic;
	osc_xpoint_d_n					: in	std_logic;
	ttc_mgt_xpoint_a_p				: in	std_logic;
	ttc_mgt_xpoint_a_n				: in	std_logic;
	ttc_mgt_xpoint_b_p				: in	std_logic;
	ttc_mgt_xpoint_b_n				: in	std_logic;
	ttc_mgt_xpoint_c_p				: in	std_logic;
	ttc_mgt_xpoint_c_n				: in	std_logic;
			
	--# fmc mgt clk		
	fmc_l12_gbtclk0_a_p				: in	std_logic; 
	fmc_l12_gbtclk0_a_n				: in	std_logic; 
	fmc_l12_gbtclk1_a_p				: in	std_logic; 
	fmc_l12_gbtclk1_a_n				: in	std_logic; 
	fmc_l12_gbtclk0_b_p				: in	std_logic; 
	fmc_l12_gbtclk0_b_n				: in	std_logic; 
	fmc_l12_gbtclk1_b_p				: in	std_logic; 
	fmc_l12_gbtclk1_b_n				: in	std_logic; 
	fmc_l8_gbtclk0_p				: in	std_logic; 
	fmc_l8_gbtclk0_n				: in	std_logic; 
	fmc_l8_gbtclk1_p				: in	std_logic; 
	fmc_l8_gbtclk1_n				: in	std_logic; 

	--# fmc mgt
	fmc_l12_dp_c2m_p				: out	std_logic_vector(11 downto 0);
	fmc_l12_dp_c2m_n				: out	std_logic_vector(11 downto 0);
	fmc_l12_dp_m2c_p				: in	std_logic_vector(11 downto 0);
	fmc_l12_dp_m2c_n				: in	std_logic_vector(11 downto 0);
	fmc_l8_dp_c2m_p					: out	std_logic_vector( 7 downto 0);
	fmc_l8_dp_c2m_n					: out	std_logic_vector( 7 downto 0);
	fmc_l8_dp_m2c_p					: in	std_logic_vector( 7 downto 0);
	fmc_l8_dp_m2c_n					: in	std_logic_vector( 7 downto 0);
	
	--# fmc fabric clk	
    fmc_l8_clk0                     : in    std_logic; 
    fmc_l8_clk1                     : in    std_logic;
    fmc_l12_clk0                    : in    std_logic;
    fmc_l12_clk1                    : in    std_logic;    

	--# fmc gpio		
	fmc_l8_la_p						: inout	std_logic_vector(33 downto 0);
	fmc_l8_la_n						: inout	std_logic_vector(33 downto 0);
	fmc_l12_la_p					: inout	std_logic_vector(33 downto 0);
	fmc_l12_la_n					: inout	std_logic_vector(33 downto 0);
	
	--# amc mgt		
	k7_amc_rx_p						: inout	std_logic_vector(15 downto 1);
	k7_amc_rx_n						: inout	std_logic_vector(15 downto 1);
	amc_tx_p						: inout	std_logic_vector(15 downto 1);
	amc_tx_n						: inout	std_logic_vector(15 downto 1);
	
	--# amc fabric
	k7_fabric_amc_rx_p03			: inout	std_logic;
	k7_fabric_amc_rx_n03    		: inout	std_logic;
	k7_fabric_amc_tx_p03    		: inout	std_logic;
	k7_fabric_amc_tx_n03    		: inout	std_logic;

	--# ddr3
	ddr3_sys_clk_p 					: in	std_logic;
	ddr3_sys_clk_n 					: in	std_logic;
	ddr3_dq                 		: inout std_logic_vector( 31 downto 0);
	ddr3_dqs_p              		: inout std_logic_vector(  3 downto 0);
	ddr3_dqs_n              		: inout std_logic_vector(  3 downto 0);
	ddr3_addr               		: out   std_logic_vector( 13 downto 0);
	ddr3_ba                 		: out   std_logic_vector(  2 downto 0);
	ddr3_ras_n              		: out   std_logic;
	ddr3_cas_n              		: out   std_logic;
	ddr3_we_n               		: out   std_logic;
	ddr3_reset_n            		: out   std_logic;
	ddr3_ck_p               		: out   std_logic_vector(  0 downto 0);
	ddr3_ck_n               		: out   std_logic_vector(  0 downto 0);
	ddr3_cke                		: out   std_logic_vector(  0 downto 0);
	ddr3_cs_n               		: out   std_logic_vector(  0 downto 0);
	ddr3_dm                 		: out   std_logic_vector(  3 downto 0);
	ddr3_odt                		: out   std_logic_vector(  0 downto 0);

    --# cdce
	cdce_pll_lock_i                 : in    std_logic; -- new port [PV 2015.08.19]  
    cdce_pri_clk_bufg_o 		    : out 	std_logic; -- new port [PV 2015.08.19] 
    cdce_ref_sel_o                  : out   std_logic; -- new port [PV 2015.08.19]   
    cdce_pwrdown_o                  : out   std_logic; -- new port [PV 2015.08.19]  
    cdce_sync_o                     : out   std_logic; -- new port [PV 2015.08.19]  
    cdce_sync_clk_o                 : out   std_logic; -- new port [PV 2015.08.19]  

	--# system clk		
	osc125_a_bufg_i					: in	std_logic;
	osc125_a_mgtrefclk_i			: in	std_logic;
	osc125_b_bufg_i					: in 	std_logic;
	osc125_b_mgtrefclk_i			: in	std_logic;
    clk_31_250_bufg_i		        : in	std_logic; -- new port [PV 2015.08.19]
    
    --# ipbus comm    
	ipb_clk_o				        : out	std_logic;
	ipb_rst_i				        : in	std_logic;
	ipb_miso_o			            : out	ipb_rbus_array(0 to nbr_usr_slaves-1);
	ipb_mosi_i			            : in	ipb_wbus_array(0 to nbr_usr_slaves-1);

    --# ipbus conf
	ip_addr_o						: out	std_logic_vector(31 downto 0);
    mac_addr_o                      : out   std_logic_vector(47 downto 0);
    rarp_en_o                       : out   std_logic;
    use_i2c_eeprom_o                : out   std_logic
);
end user_core;

architecture usr of user_core is
    
    --===================================--
    -- Signal definition
    --===================================--
    -- Clocks definition
    signal fabric_clk_pre_buf       : std_logic;                
    signal fabric_clk               : std_logic;
    signal clk_160Mhz               : std_logic;
    signal clk_40Mhz                : std_logic;
    signal clk_40Mhz_nobuf          : std_logic;
    signal clk_320Mhz               : std_logic;    
    -- IPBus Clock
    signal ipb_clk					: std_logic;
    
    --===================================--
    -- Command Processor Block Signals
    --===================================--
    -- I2C command lines from Command Processor Block to PHY and back
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    -- Control bus from Command Processor Block to Fast Command Block
    signal fast_block_ctrl       : ctrl_fastblock;
    signal fast_block_cnfg       : cnfg_fastblock;
    -- Global reset signal from IPBus
    signal ipb_global_reset      : std_logic;
    --===================================--
   
    --===================================--
    -- Fast Command Block Signals
    --===================================--
    -- Trigger Fast Signals from Fast Command Block
    signal fast_signal_to_phy       : cmd_fastbus;    
    -- Stubs From Hybrids
    signal hybrid_stubs             : std_logic_vector(NUM_HYBRIDS downto 1);
    signal fast_block_status_fsm    : std_logic_vector(7 downto 0);
    signal fast_block_error         : std_logic_vector(7 downto 0);
    --===================================--
    
    signal test_clock_frequency     : array_4x32bit;
    COMPONENT clkRateTool32 IS
    GENERIC (
      CLKREF_RATE_IN_MHZ : INTEGER
    );
    PORT (
      clkref   : IN  STD_LOGIC;
      clktest  : IN  STD_LOGIC;
      clkvalue : IN  STD_LOGIC;
      value    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
    END COMPONENT clkRateTool32;

begin

    --===========================================--
	-- ipbus management
	--===========================================--
	ipb_clk 		      <= clk_31_250_bufg_i; 	-- select the frequency of the ipbus clock 
	ipb_clk_o 	          <= ipb_clk;				-- always forward the selected ipb_clk to system core
    --
	ip_addr_o 	          <= x"c0_a8_01_50";
	mac_addr_o	          <= x"aa_bb_cc_dd_ee_50";
	rarp_en_o 		      <= '1';
	use_i2c_eeprom_o      <= '1';
	--===========================================--

    --===========================================--
    -- LHC Strobe (L1-Trigger)
    --===========================================--
    fclk_ibuf:      ibufgds     port map (i => fabric_clk_p, ib => fabric_clk_n, o => fabric_clk_pre_buf);
    fclk_bufg:      bufg        port map (i => fabric_clk_pre_buf,               o => fabric_clk);
    
    clk_40MHz <= fabric_clk;
    --===========================================--
    -- CLK 40MHz
    --===========================================--
--    cdceOut0Ibufds2Gtxe2: ibufds_gte2
--          port map (
--             O                                           => clk_40Mhz_nobuf,--cdce out U1 LHC CLK freq
--             ODIV2                                       => open,
--             CEB                                         => '0',
--             I                                           => ttc_mgt_xpoint_b_p,
--             IB                                          => ttc_mgt_xpoint_b_n
--             );
--    cdceOut1Bufg: bufg
--          port map (
--             O                                           => clk_40Mhz, 
--             I                                           => clk_40Mhz_nobuf
--             );
    --===========================================--

    --===================================--
    -- Block responsible for clock generation
    --===================================--
    clock_generator_block: entity work.clock_generator_core;
    --===================================--
    --generic map
    --(
    --)
    --port map
    --(
    --);       
    --===================================--	
    
    --===================================--
    -- Block responsible for I2C command processing. Is connected to: fast command block, hybrids.
    --===================================--
    command_processor_block: entity work.command_processor_core
    --===================================--
    port map
    (
        clk_40MHz       => clk_40MHz,
        ipb_clk         => ipb_clk,
        reset           => ipb_global_reset,
        -- command from IpBus
        ipb_mosi_i      => ipb_mosi_i,
        ipb_miso_o      => ipb_miso_o,
        -- global control
        ipb_global_reset_o  => ipb_global_reset,
        -- fast command block control lines
        ctrl_fastblock_o    => fast_block_ctrl,
        cnfg_fastblock_o    => fast_block_cnfg,
        -- should be output command register
        i2c_request     => i2c_request,
        i2c_reply       => i2c_reply,
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
    --===================================--    
    phy_answer_generator: entity work.answer_block
        port map ( clk              => clk_40MHz,
                   i2c_request      => i2c_request,
                   i2c_reply        => i2c_reply);
    
    --===================================--
    -- Fast commands. Connected to: physical interface, hybrids.
    --===================================--
    fast_command_block: entity work.fast_command_core
    --===================================--
    port map
    (
        clk_40Mhz               => clk_40MHz,
        l1_trigger_in           => '0',
        reset                   => ipb_global_reset,
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
        fast_signal             => fast_signal_to_phy
    );        
    --===================================-- 
    
    --===================================--
    -- Hybrids generation
    --===================================--   
    HYB_GEN : FOR hybrid_i IN 1 TO NUM_HYBRIDS GENERATE
    --===================================--
    hybrid_block: entity work.hybrid_core;
    --===================================--
    --generic map
    --(
    --)
    --port map
    --(
    --);        
    --===================================--
    END GENERATE HYB_GEN;
    --===================================--    
    
    --===================================--
    -- Physical interface layer. Connected to: hybrids (40mhz lines + I2C lines), fast commands, FMC 1&2
    --===================================--
    phy_block: entity work.phy_core;
    --===================================--
    --generic map
    --(
    --)
    --port map
    --(
    --);        
    --===================================--
    
    --===================================--
    -- BE Data Buffer - Contains Global Event Builder. Connected to: hybrids
    --===================================--
    be_data_buffer_block: entity work.be_data_buffer_core;
    --===================================--
    --generic map
    --(
    --)
    --port map
    --(
    --);        
    --===================================-- 
    
    clkRate0 : clkRateTool32
    GENERIC MAP (
       -- clock rate of clkref in MHz
        CLKREF_RATE_IN_MHZ => 125
    )  
    PORT MAP (
        clkref   => osc125_a_mgtrefclk_i,
        clktest  => ipb_clk,
        clkvalue => ipb_clk,
        value    => test_clock_frequency(0)
    );
    
    clkRate1 : clkRateTool32
    GENERIC MAP (
       -- clock rate of clkref in MHz
        CLKREF_RATE_IN_MHZ => 125
    )  
    PORT MAP (
        clkref   => osc125_a_mgtrefclk_i,
        clktest  => clk_40MHz,
        clkvalue => ipb_clk,
        value    => test_clock_frequency(1)
    );

end usr;
