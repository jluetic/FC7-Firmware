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
    -- Constant definition
    --===================================--
    constant NUM_HYBRIDS            : integer := 2;
    constant NUM_CHIPS            : integer := 8;
    --===================================--
    
    --===================================--
    -- Signal definition
    --===================================--
    -- Clocks definition
    signal fabric_clk_pre_buf       : std_logic;                
    signal fabric_clk               : std_logic;
    signal clk_160Mhz               : std_logic;
    signal clk_40Mhz                : std_logic;
    signal clk_40Mhz_nobuf                : std_logic;
    signal clk_320Mhz               : std_logic;
    
    -- IPbus
    signal ipb_clk					: std_logic;
    signal ctrl_reg                 : array_32x32bit;
    signal stat_reg                 : array_32x32bit;
    signal command_in               : array_2x32bit;
    signal stat_chips_data          : array_4x32bit;
    -- I2C command lines from Fast Command Block to PHY and back
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    
    -- Trigger Signal from Fast Command Block
    signal trigger_out              : std_logic;
    
    -- Stubs From Hybrids
    signal hybrid_stubs             : std_logic_vector(NUM_HYBRIDS downto 1);

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
    command_in(0) <= ctrl_reg(4);
    command_in(1) <= ctrl_reg(5);
    stat_reg(2)   <= stat_chips_data(0);
    stat_reg(3)   <= stat_chips_data(1);
    stat_reg(4)   <= stat_chips_data(2);
    stat_reg(5)   <= stat_chips_data(3);
    command_processor_block: entity work.command_processor_core
    --===================================--
    generic map
        (
            NUM_HYBRIDS => NUM_HYBRIDS,
            NUM_CHIPS   => NUM_CHIPS
        )
    port map
    (
        clk             => clk_40MHz,
        reset           => '0',
        -- command from IpBus
        command_in      => command_in,
        -- should be output command register
        i2c_request     => i2c_request,
        i2c_reply       => i2c_reply,
        -- status back using IpBus
        status_out      => stat_reg(1),
        -- 8 chips data back
        status_data     => stat_chips_data
    );        
    --===================================--    
    phy_answer_generator: entity work.answer_block
        port map ( clk              => clk_40MHz,
                   request_strobe   => i2c_request.cmd_strobe,
                   i2c_reply        => i2c_reply);
    
    --===================================--
    -- Fast commands. Connected to: physical interface, hybrids.
    --===================================--
    fast_command_block: entity work.fast_command_core
    --===================================--
    generic map
    (
        NUM_HYBRIDS => NUM_HYBRIDS
    )
    port map
    (
        clk_40Mhz               => clk_40MHz,
        l1_trigger_in           => '0',
        reset                   => '0',
        -- trigger control register input (31-28 - source, 27-24 - state, 23 - reset_counter)
        trigger_control_in      => ctrl_reg(0),
        -- output trigger frequency divider
        trigger_divider_in      => ctrl_reg(1),
        -- number of triggers to accept
        triggers_to_accept_in   => ctrl_reg(2),
        -- hybrid mask                                                  
        trigger_hybrid_mask_in  => ctrl_reg(3),
        -- stubs from hybrids
        in_stubs                => hybrid_stubs,
        -- trigger status register output (31-28 - source, 27-24 - state, 23-20 - error code)
        trigger_status_out      => stat_reg(0),
        -- output trigger to Hybrids
        trigger_out             => trigger_out
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
    
    --===========================================--
    stat_regs_inst: entity work.ipb_user_status_regs
    --===========================================--
    port map
    (
        clk                    => ipb_clk,
        reset                => ipb_rst_i,
        ipb_mosi_i            => ipb_mosi_i(user_ipb_stat_regs),
        ipb_miso_o            => ipb_miso_o(user_ipb_stat_regs),
        regs_i                => stat_reg
    );
    --===========================================--



    --===========================================--
    ctrl_regs_inst: entity work.ipb_user_control_regs
    --===========================================--
    port map
    (
        clk                    => ipb_clk,
        reset                => ipb_rst_i,
        ipb_mosi_i            => ipb_mosi_i(user_ipb_ctrl_regs),
        ipb_miso_o            => ipb_miso_o(user_ipb_ctrl_regs),
        regs_o                => ctrl_reg
    );
    --===========================================--

end usr;
