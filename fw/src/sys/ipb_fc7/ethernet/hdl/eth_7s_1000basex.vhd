-- Contains the instantiation of the Xilinx MAC & 1000baseX pcs/pma & GTP transceiver cores
--
-- Do not change signal names in here without correspondig alteration to the timing contraints file
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;
use work.emac_hostbus_decl.all;

entity eth_7s_1000basex is
	port(
		clk_fr_i   : in std_logic; 
        
        gtx_refclk : in  std_logic;
		gtx_txp    : out std_logic;
        gtx_txn    : out std_logic;
		gtx_rxp    : in  std_logic;
		gtx_rxn    : in  std_logic;
        
        mac_clk_o  : out std_logic;
		rst_i      : in  std_logic;
		locked_o   : out std_logic;
		
		tx_data    : in  std_logic_vector(7 downto 0);
		tx_valid   : in  std_logic;
		tx_last    : in  std_logic;
		tx_error   : in  std_logic;
		tx_ready   : out std_logic;
		rx_data    : out std_logic_vector(7 downto 0);
		rx_valid   : out std_logic;
		rx_last    : out std_logic;
		rx_error   : out std_logic;
		
		hostbus_in : in  emac_hostbus_in := ('0', "00", "0000000000", X"00000000", '0', '0', '0');
		hostbus_out: out emac_hostbus_out
	);

end eth_7s_1000basex;

architecture rtl of eth_7s_1000basex is

	COMPONENT tri_mode_eth_mac_v5_5
		PORT (
			glbl_rstn : IN STD_LOGIC;
			rx_axi_rstn : IN STD_LOGIC;
			tx_axi_rstn : IN STD_LOGIC;
			rx_axi_clk : IN STD_LOGIC;
			rx_reset_out : OUT STD_LOGIC;
			rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			rx_axis_mac_tvalid : OUT STD_LOGIC;
			rx_axis_mac_tlast : OUT STD_LOGIC;
			rx_axis_mac_tuser : OUT STD_LOGIC;
			rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
			rx_statistics_valid : OUT STD_LOGIC;
			tx_axi_clk : IN STD_LOGIC;
			tx_reset_out : OUT STD_LOGIC;
			tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_axis_mac_tvalid : IN STD_LOGIC;
			tx_axis_mac_tlast : IN STD_LOGIC;
			tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			tx_axis_mac_tready : OUT STD_LOGIC;
			tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			tx_statistics_valid : OUT STD_LOGIC;
			pause_req : IN STD_LOGIC;
			pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			speed_is_100 : OUT STD_LOGIC;
			speed_is_10_100 : OUT STD_LOGIC;
			gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			gmii_tx_en : OUT STD_LOGIC;
			gmii_tx_er : OUT STD_LOGIC;
			gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			gmii_rx_dv : IN STD_LOGIC;
			gmii_rx_er : IN STD_LOGIC;
			rx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0);
			tx_mac_config_vector : IN STD_LOGIC_VECTOR(79 DOWNTO 0)
		);
	END COMPONENT;

	signal gmii_txd, gmii_rxd: std_logic_vector(7 downto 0);
	signal gmii_tx_en, gmii_tx_er, gmii_rx_dv, gmii_rx_er: std_logic;
	signal gmii_rx_clk: std_logic;
	signal clk125, txoutclk_ub, txoutclk, clk125_ub: std_logic;
--	signal clkin, clk125, txoutclk_ub, txoutclk, clk125_ub, clk_fr: std_logic;
	signal clk62_5_ub, clk62_5, clkfb: std_logic;
	signal rstn, phy_done, mmcm_locked, locked_int, mmcm_reset, mmcm_reset_phy: std_logic;
	signal status: std_logic_vector(15 downto 0);
	signal decoupled_clk : std_logic;
	
begin
	
bufg_tx: BUFG port map(i => txoutclk_ub,o => txoutclk);

mmcm_reset <= rst_i or mmcm_reset_phy;
	
mcmm: MMCME2_BASE
generic map(
    CLKIN1_PERIOD => 16.0,
    CLKFBOUT_MULT_F => 16.0,
    CLKOUT1_DIVIDE => 16,
    CLKOUT2_DIVIDE => 8)
port map(
    clkin1   => txoutclk,
    clkout1  => clk62_5_ub,
    clkout2  => clk125_ub,
    clkfbout => clkfb,
    clkfbin  => clkfb,
    rst      => mmcm_reset,
    pwrdwn   => '0',
    locked   => mmcm_locked);
	
bufg_125: BUFG port map(i => clk125_ub,	o => clk125);
bufg_62_5: BUFG port map(i => clk62_5_ub,o => clk62_5);

mac_clk_o <= clk125;

	process(clk_fr_i) --process(clk_fr)
	begin
		if rising_edge(clk_fr_i) then --if rising_edge(clk_fr) then
			locked_int <= mmcm_locked and phy_done;
		end if;
	end process;

	locked_o <= locked_int;
	rstn     <= not (not locked_int or rst_i);

	mac: tri_mode_eth_mac_v5_5
		port map(
			glbl_rstn => rstn,
			rx_axi_rstn => '1',
			tx_axi_rstn => '1',
			rx_axi_clk => clk125,
			rx_reset_out => open,
			rx_axis_mac_tdata => rx_data,
			rx_axis_mac_tvalid => rx_valid,
			rx_axis_mac_tlast => rx_last,
			rx_axis_mac_tuser => rx_error,
			rx_statistics_vector => open,
			rx_statistics_valid => open,
			tx_axi_clk => clk125,
			tx_reset_out => open,
			tx_axis_mac_tdata => tx_data,
			tx_axis_mac_tvalid => tx_valid,
			tx_axis_mac_tlast => tx_last,
			tx_axis_mac_tuser(0) => tx_error,
			tx_axis_mac_tready => tx_ready,
			tx_ifg_delay => X"00",
			tx_statistics_vector => open,
			tx_statistics_valid => open,
			pause_req => '0',
			pause_val => X"0000",
			speed_is_100 => open,
			speed_is_10_100 => open,
			gmii_txd => gmii_txd,
			gmii_tx_en => gmii_tx_en,
			gmii_tx_er => gmii_tx_er,
			gmii_rxd => gmii_rxd,
			gmii_rx_dv => gmii_rx_dv,
			gmii_rx_er => gmii_rx_er,
			rx_mac_config_vector => X"0000_0000_0000_0000_0802",
			tx_mac_config_vector => X"0000_0000_0000_0000_0002"
		);

	hostbus_out.hostrddata <= (others => '0');
	hostbus_out.hostmiimrdy <= '0';

    -- Vivado generates a CRC error if you drive the CPLLLOCKDET circuitry with
    -- the same clock used to drive the transceiver PLL.  While this makes sense
    -- if the clk is derved from the CPLL (e.g. TXOUTCLK) it is less clear is 
    -- essential if you use the clock raw from the input pins.  The short story
    -- is that it has always worked in the past with ISE, but Vivado generates 
    -- DRC error.  Can be bypassed by decoupling the clock from the perpective 
    -- of the tools by just toggling a flip flop, which is what is done below.
--    process(clk_fr)
--    begin
--        if rising_edge(clk_fr) then
--            decoupled_clk <= not decoupled_clk;
--        end if;
--    end process;
--    decoupled_clk <= clk_fr;


	phy: entity work.gig_eth_pcs_pma_v11_4_block
		port map
		(
			gtrefclk => gtx_refclk, --clkin,
			txp => gtx_txp,
			txn => gtx_txn,
			rxp => gtx_rxp,
			rxn => gtx_rxn,
			txoutclk => txoutclk_ub,
			resetdone => phy_done,
			mmcm_locked => mmcm_locked,
			userclk => clk62_5,
			userclk2 => clk125,
			independent_clock_bufg => clk_fr_i, -- decoupled_clk, --clk_fr,
			pma_reset => rst_i,
			gmii_txd => gmii_txd,
			gmii_tx_en => gmii_tx_en,
			gmii_tx_er => gmii_tx_er,
			gmii_rxd => gmii_rxd,
			gmii_rx_dv => gmii_rx_dv,
			gmii_rx_er => gmii_rx_er,
			gmii_isolate => open,
			configuration_vector => "00000",
			status_vector => status,
			reset => rst_i,
			signal_detect => '1'
		);

end rtl;

