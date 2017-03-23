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

use work.cbc3_emulator_package.all;

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
    use_i2c_eeprom_o                : out   std_logic;
    fmc_i2c_scl                     : inout std_logic;
    fmc_i2c_sda                     : inout std_logic
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
    signal clk_40MHz_fromBUFG                : std_logic;
    signal clk_40Mhz_nobuf          : std_logic;
    signal clk_320Mhz               : std_logic;
    signal clk_user                 : std_logic;    
    -- IPBus Clock
    signal ipb_clk					: std_logic;
    
    -- Global reset signal from IPBus
    signal ipb_global_reset      : std_logic;
    
    --===================================--
    -- Command Processor Block Signals
    --===================================--
    signal cmd_reply : cmd_rbus;
    signal stub_to_hb : stub_data_to_hb_t_array(0 to NUM_HYBRIDS-1);
    signal trig_data_to_hb : triggered_data_frame_r_array(0 to NUM_HYBRIDS-1);
    -- control of command processor block
    signal cnfg_command_block               : cnfg_command_block_type;
    signal ctrl_command_block_from_ipbus    : ctrl_command_block_from_ipbus_type;
    signal ctrl_command_block_to_ipbus      : ctrl_command_block_to_ipbus_type;
    signal stat_command_block               : stat_command_block_type;
    
    -- I2C command lines from Command Processor Block to PHY and back
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    signal i2c_fifo_statuses        : fifo_stat;    
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
    -- Control bus to Fast Command Block
    signal ctrl_fast_block          : ctrl_fastblock_type;
    signal cnfg_fast_block          : cnfg_fastblock_type;
    signal stat_fast_block          : stat_fastblock_type;
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

    --===================================--
    -- Physical Interface Block Signals
    --===================================--
    signal scl_io  : std_logic_vector(0 to NUM_HYBRIDS-1);
    signal sda_io  : std_logic_vector(0 to NUM_HYBRIDS-1);
    
    signal cmd_fast : std_logic;
    signal trigger_data_fromCBC : trig_data_from_fe_t_array(0 to NUM_HYBRIDS-1);
    signal stub_data_fromCBC : stub_lines_r_array_array(0 to NUM_HYBRIDS-1);
    
    signal sda_miso : std_logic_vector(0 to NUM_HYBRIDS-1);
    signal sda_mosi : std_logic_vector(0 to NUM_HYBRIDS-1);
    signal scl_mosi : std_logic_vector(0 to NUM_HYBRIDS-1);
    signal phase_shift_en : std_logic;
    signal phase_shift_incdec : std_logic;
    signal phase_shift_done : std_logic;
    signal mmcm_ready :std_logic;
    --===================================--
    
    attribute keep: boolean;
    attribute keep of clk_320MHz: signal is true;
begin

    --===========================================--
	-- ipbus management
	--===========================================--
	ipb_clk 		      <= clk_31_250_bufg_i; 	-- select the frequency of the ipbus clock 
	ipb_clk_o 	          <= ipb_clk;				-- always forward the selected ipb_clk to system core
    --
	ip_addr_o 	          <= x"c0_a8_01_50";
	mac_addr_o	          <= x"aa_bb_cc_dd_ee_50";
	rarp_en_o 		      <= '0';
	use_i2c_eeprom_o      <= '1';
	--===========================================--

    --===========================================--
    -- LHC Strobe (L1-Trigger)
    --===========================================--
    fclk_ibuf:      ibufgds     port map (i => fabric_clk_p, ib => fabric_clk_n, o => fabric_clk_pre_buf);
    fclk_bufg:      bufg        port map (i => fabric_clk_pre_buf,               o => fabric_clk);
    
    clk_40MHz_fromBUFG <= fabric_clk;
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
    -- Block responsible for I2C command processing. Is connected to: hybrids.
    --===================================--
    command_processor_block: entity work.command_processor_core
    --===================================--
    port map
    (
        clk_40MHz       => clk_40MHz_fromBUFG,
        ipb_clk         => ipb_clk,
        reset           => ipb_global_reset,     
        -- controls from ipbus
        cnfg_command_block              => cnfg_command_block,
        ctrl_command_block_from_ipbus   => ctrl_command_block_from_ipbus,    
        ctrl_command_block_to_ipbus     => ctrl_command_block_to_ipbus,
        -- fifo statuses out
        stat_command_block              => stat_command_block,
        -- i2c commands
        i2c_request     => i2c_request,
        i2c_reply       => i2c_reply        
    );        
    --===================================--    
    --phy_answer_generator: entity work.answer_block
    --    port map ( clk              => clk_40MHz,
    --               i2c_request      => i2c_request,
    --               i2c_reply        => i2c_reply);
    --
    --===================================--
    -- Fast commands. Connected to: physical interface, hybrids.
    --===================================--
    fast_command_block: entity work.fast_command_core
    --===================================--
    port map
    (
        clk_40Mhz               => clk_40MHz_fromBUFG,
        l1_trigger_in           => '0',
        reset                   => ipb_global_reset,
        -- control buses from Command Processor Block
        ctrl_fastblock_i        => ctrl_fast_block,
        cnfg_fastblock_i        => cnfg_fast_block,
        -- stubs from hybrids
        in_stubs                => hybrid_stubs,
        -- trigger status
        stat_fastblock_o        => stat_fast_block,
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
    -- temporary mmcm for 320 and 40 MHz clocks, now the 40MHz fabric clock is still used in all the block. It is more stable like this
    mmcm_inst : entity work.mmcm
    port map ( 
  
       -- Clock in ports
       clk_in1 => fabric_clk_pre_buf,
      -- Clock out ports  
       clk_out40 => clk_40MHz,
       clk_out320 => clk_320MHz,
       clk_out3 => open,
--       clk_out3 => clk_320MHz_Phase_Shifted,
--       psClk => clk_320MHz,
--       psEn => '0',
--       psIncDec => '1',
--       psDone => phase_shift_done,
      -- Status and control signals                
       reset => '0',
       locked => mmcm_ready            
    );
   
    phy_block: entity work.phy_core
    port map
    (
        clk_40              => clk_40MHz_fromBUFG, 
        clk_320_i           => clk_320MHz,
       
        reset_i             => ipb_global_reset,

        -- fast command input bus
        cmd_fast_i          => fast_signal_to_phy,  
       
        -- hybrid block interface for triggered data
        trig_data_o         => trig_data_to_hb,

        -- hybrid block interface for stub data
        stub_data_o         => stub_to_hb,   
    
        -- slow control command from command generator
        cmd_request_i       => i2c_request,
    
        -- slow control response to command generator
        cmd_reply_o         => i2c_reply,
        
        mmcm_ready_i => mmcm_ready,        
      
        -- fmc ports
        fmc_l12_la_p        => fmc_l12_la_p,
        fmc_l12_la_n        => fmc_l12_la_n,
        fmc_l8_la_p         => fmc_l8_la_p,
        fmc_l8_la_n         => fmc_l8_la_n 
    );
    
--    usrled2_g <=  trig_data_to_hb(0).channels(0);       
--    usrled1_g <=  trig_data_to_hb(0).channels(253);       
--    usrled1_r <=  stub_to_hb(0)(0).sync_bit;       
--    --===================================--
    
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
    
    
    --===================================--
    -- IPBus Control Decoder
    --===================================--
    ipbus_decoder_ctrl: entity work.ipbus_decoder_ctrl
    --===================================--
    port map
    (   
        clk_ipb               => ipb_clk,
        clk_40MHz             => clk_40MHz_fromBUFG,
        reset                 => ipb_global_reset,
        ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_ctrl_sel),
        ipb_miso_o            => ipb_miso_o(ipb_daq_system_ctrl_sel),
        -- global commands
        ipb_global_reset      => ipb_global_reset,
        -- fast commands
        ctrl_fastblock_o      => ctrl_fast_block,
        -- command processor
        ctrl_command_block_from_ipbus   => ctrl_command_block_from_ipbus,                    
        ctrl_command_block_to_ipbus     => ctrl_command_block_to_ipbus 
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
        reset                 => ipb_global_reset,
        ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_cnfg_sel),
        ipb_miso_o            => ipb_miso_o(ipb_daq_system_cnfg_sel),
        -- fast block
        cnfg_fastblock_o      => cnfg_fast_block,
        -- command block
        cnfg_command_block_o  => cnfg_command_block
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
        reset                 => ipb_global_reset,
        ipb_mosi_i            => ipb_mosi_i(ipb_daq_system_stat_sel),
        ipb_miso_o            => ipb_miso_o(ipb_daq_system_stat_sel),
        -- fast command block statuses
        stat_fast_block_i      => stat_fast_block,
        -- command block statuses
        stat_command_block_i  => stat_command_block,        
        -- clock frequencies tester
        test_clock_frequency   => test_clock_frequency,
        -- temporary line while HYBRID block is not existing
        trig_data_i => trig_data_to_hb
    );
    --===================================--
    
    
--    clkRate0 : clkRateTool32
--    GENERIC MAP (
--       -- clock rate of clkref in MHz
--        CLKREF_RATE_IN_MHZ => 125
--    )  
--    PORT MAP (
--        clkref   => osc125_a_mgtrefclk_i,
--        clktest  => ipb_clk,
--        clkvalue => ipb_clk,
--        value    => test_clock_frequency(0)
--    );
    
--    clkRate1 : clkRateTool32
--    GENERIC MAP (
--       -- clock rate of clkref in MHz
--        CLKREF_RATE_IN_MHZ => 125
--    )  
--    PORT MAP (
--        clkref   => osc125_a_mgtrefclk_i,
--        clktest  => clk_40MHz,
--        clkvalue => ipb_clk,
--        value    => test_clock_frequency(1)
--    );
    
--    clkRate2 : clkRateTool32
--        GENERIC MAP (
--           -- clock rate of clkref in MHz
--            CLKREF_RATE_IN_MHZ => 125
--        )  
--        PORT MAP (
--            clkref   => osc125_a_mgtrefclk_i,
--            clktest  => fast_signal_to_phy.trigger,
--            clkvalue => ipb_clk,
--            value    => test_clock_frequency(2)
--        );

end usr;
