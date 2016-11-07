-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version : 2.1
--  \   \         Application : 7 Series FPGAs Transceivers Wizard
--  /   /         Filename : gig_eth_pcs_pma_v11_4_gtwizard.vhd
-- /___/   /\     
-- \   \  /  \ 
--  \___\/\___\
--
--
-- Module GTWIZARD (a GT Wrapper)
-- Generated by Xilinx 7 Series FPGAs Transceivers Wizard
-- 
-- 
-- (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;


--***************************** Entity Declaration ****************************

entity  gig_eth_pcs_pma_v11_4_GTWIZARD is
generic
(

    -- Simulation attributes
    WRAPPER_SIM_GTRESET_SPEEDUP     : string     :=  "false";        -- Set to "true" to speed up sim reset
    RX_DFE_KL_CFG2_IN               : bit_vector :=  X"3010D90C";
    PMA_RSV_IN                      : bit_vector :=  x"00018480";
    SIM_VERSION                     : string     :=  "3.0"

);
port
(
    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y4)
    --____________________________CHANNEL PORTS________________________________
    ------------------------- Channel - Ref Clock Ports ------------------------
    GT0_GTREFCLK0_IN                        : in   std_logic;
    -------------------------------- Channel PLL -------------------------------
    GT0_CPLLFBCLKLOST_OUT                   : out  std_logic;
    GT0_CPLLLOCK_OUT                        : out  std_logic;
    GT0_CPLLLOCKDETCLK_IN                   : in   std_logic;
    GT0_CPLLREFCLKLOST_OUT                  : out  std_logic;
    GT0_CPLLRESET_IN                        : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    GT0_EYESCANDATAERROR_OUT                : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    GT0_LOOPBACK_IN                         : in   std_logic_vector(2 downto 0);
    GT0_RXPD_IN                             : in   std_logic_vector(1 downto 0);
    GT0_TXPD_IN                             : in   std_logic_vector(1 downto 0);
    ------------------------------- Receive Ports ------------------------------
    GT0_RXUSERRDY_IN                        : in   std_logic;
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    GT0_RXCHARISCOMMA_OUT                   : out  std_logic_vector(1 downto 0);
    GT0_RXCHARISK_OUT                       : out  std_logic_vector(1 downto 0);
    GT0_RXDISPERR_OUT                       : out  std_logic_vector(1 downto 0);
    GT0_RXNOTINTABLE_OUT                    : out  std_logic_vector(1 downto 0);
    ------------------- Receive Ports - Clock Correction Ports -----------------
    GT0_RXCLKCORCNT_OUT                     : out  std_logic_vector(1 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    GT0_RXMCOMMAALIGNEN_IN                  : in   std_logic;
    GT0_RXPCOMMAALIGNEN_IN                  : in   std_logic;
    ------------------- Receive Ports - RX Data Path interface -----------------
    GT0_GTRXRESET_IN                        : in   std_logic;
    GT0_RXDATA_OUT                          : out  std_logic_vector(15 downto 0);
    GT0_RXOUTCLK_OUT                        : out  std_logic;
    GT0_RXPCSRESET_IN                       : in   std_logic;
    GT0_RXUSRCLK_IN                         : in   std_logic;
    GT0_RXUSRCLK2_IN                        : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GT0_GTXRXN_IN                           : in   std_logic;
    GT0_GTXRXP_IN                           : in   std_logic;
    GT0_RXCDRLOCK_OUT                       : out  std_logic;
    GT0_RXELECIDLE_OUT                      : out  std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    GT0_RXBUFRESET_IN                       : in   std_logic;
    GT0_RXBUFSTATUS_OUT                     : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    GT0_RXRESETDONE_OUT                     : out  std_logic;
    ------------------------------- Transmit Ports -----------------------------
    GT0_TXUSERRDY_IN                        : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    GT0_TXCHARDISPMODE_IN                   : in   std_logic_vector(1 downto 0);
    GT0_TXCHARDISPVAL_IN                    : in   std_logic_vector(1 downto 0);
    GT0_TXCHARISK_IN                        : in   std_logic_vector(1 downto 0);
    ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    GT0_TXBUFSTATUS_OUT                     : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GT0_GTTXRESET_IN                        : in   std_logic;
    GT0_TXDATA_IN                           : in   std_logic_vector(15 downto 0);
    GT0_TXOUTCLK_OUT                        : out  std_logic;
    GT0_TXOUTCLKFABRIC_OUT                  : out  std_logic;
    GT0_TXOUTCLKPCS_OUT                     : out  std_logic;
    GT0_TXPCSRESET_IN                       : in   std_logic;
    GT0_TXUSRCLK_IN                         : in   std_logic;
    GT0_TXUSRCLK2_IN                        : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GT0_GTXTXN_OUT                          : out  std_logic;
    GT0_GTXTXP_OUT                          : out  std_logic;
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    GT0_TXRESETDONE_OUT                     : out  std_logic





);


end  gig_eth_pcs_pma_v11_4_GTWIZARD;
    
architecture RTL of  gig_eth_pcs_pma_v11_4_GTWIZARD is

    attribute CORE_GENERATION_INFO : string;
    attribute CORE_GENERATION_INFO of RTL : architecture is "gig_eth_pcs_pma_v11_4_GTWIZARD,gtwizard_v2_2,{protocol_file=gigabit_ethernet_CC}";


--***********************************Parameter Declarations********************

    constant DLY : time := 1 ns;

--***************************** Signal Declarations *****************************

    -- ground and tied_to_vcc_i signals
    signal  tied_to_ground_i                :   std_logic;
    signal  tied_to_ground_vec_i            :   std_logic_vector(63 downto 0);
    signal  tied_to_vcc_i                   :   std_logic;

  
    signal  gt0_mgtrefclktx_i           :   std_logic_vector(1 downto 0);
    signal  gt0_mgtrefclkrx_i           :   std_logic_vector(1 downto 0);
  
 
    signal   gt0_qpllclk_i            :   std_logic;
    signal   gt0_qpllrefclk_i         :   std_logic;


--*************************** Component Declarations **************************
component gig_eth_pcs_pma_v11_4_GTWIZARD_GT
generic
(
    -- Simulation attributes
    GT_SIM_GTRESET_SPEEDUP       : string   := "false";
    RX_DFE_KL_CFG2_IN            : bit_vector :=   X"3010D90C";
    PMA_RSV_IN                   : bit_vector :=   X"00000000";
    PCS_RSVD_ATTR_IN             : bit_vector :=   X"000000000000";
    SIM_VERSION                  : string     := "3.0"
);
port 
(   
    ------------------------- Channel - Ref Clock Ports ------------------------
    GTREFCLK0_IN                            : in   std_logic;
    -------------------------------- Channel PLL -------------------------------
    CPLLFBCLKLOST_OUT                       : out  std_logic;
    CPLLLOCK_OUT                            : out  std_logic;
    CPLLLOCKDETCLK_IN                       : in   std_logic;
    CPLLREFCLKLOST_OUT                      : out  std_logic;
    CPLLRESET_IN                            : in   std_logic;
    ------------------------------- Eye Scan Ports -----------------------------
    EYESCANDATAERROR_OUT                    : out  std_logic;
    ------------------------ Loopback and Powerdown Ports ----------------------
    LOOPBACK_IN                             : in   std_logic_vector(2 downto 0);
    RXPD_IN                                 : in   std_logic_vector(1 downto 0);
    TXPD_IN                                 : in   std_logic_vector(1 downto 0);
    ------------------------------- Receive Ports ------------------------------
    RXUSERRDY_IN                            : in   std_logic;
    ----------------------- Receive Ports - 8b10b Decoder ----------------------
    RXCHARISCOMMA_OUT                       : out  std_logic_vector(1 downto 0);
    RXCHARISK_OUT                           : out  std_logic_vector(1 downto 0);
    RXDISPERR_OUT                           : out  std_logic_vector(1 downto 0);
    RXNOTINTABLE_OUT                        : out  std_logic_vector(1 downto 0);
    ------------------- Receive Ports - Clock Correction Ports -----------------
    RXCLKCORCNT_OUT                         : out  std_logic_vector(1 downto 0);
    --------------- Receive Ports - Comma Detection and Alignment --------------
    RXMCOMMAALIGNEN_IN                      : in   std_logic;
    RXPCOMMAALIGNEN_IN                      : in   std_logic;
    ------------------- Receive Ports - RX Data Path interface -----------------
    GTRXRESET_IN                            : in   std_logic;
    RXDATA_OUT                              : out  std_logic_vector(15 downto 0);
    RXOUTCLK_OUT                            : out  std_logic;
    RXPCSRESET_IN                           : in   std_logic;
    RXUSRCLK_IN                             : in   std_logic;
    RXUSRCLK2_IN                            : in   std_logic;
    ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
    GTXRXN_IN                               : in   std_logic;
    GTXRXP_IN                               : in   std_logic;
    RXCDRLOCK_OUT                           : out  std_logic;
    RXELECIDLE_OUT                          : out  std_logic;
    -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
    RXBUFRESET_IN                           : in   std_logic;
    RXBUFSTATUS_OUT                         : out  std_logic_vector(2 downto 0);
    ------------------------ Receive Ports - RX PLL Ports ----------------------
    RXRESETDONE_OUT                         : out  std_logic;
    ------------------------------- Transmit Ports -----------------------------
    TXUSERRDY_IN                            : in   std_logic;
    ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
    TXCHARDISPMODE_IN                       : in   std_logic_vector(1 downto 0);
    TXCHARDISPVAL_IN                        : in   std_logic_vector(1 downto 0);
    TXCHARISK_IN                            : in   std_logic_vector(1 downto 0);
    ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
    TXBUFSTATUS_OUT                         : out  std_logic_vector(1 downto 0);
    ------------------ Transmit Ports - TX Data Path interface -----------------
    GTTXRESET_IN                            : in   std_logic;
    TXDATA_IN                               : in   std_logic_vector(15 downto 0);
    TXOUTCLK_OUT                            : out  std_logic;
    TXOUTCLKFABRIC_OUT                      : out  std_logic;
    TXOUTCLKPCS_OUT                         : out  std_logic;
    TXPCSRESET_IN                           : in   std_logic;
    TXUSRCLK_IN                             : in   std_logic;
    TXUSRCLK2_IN                            : in   std_logic;
    ---------------- Transmit Ports - TX Driver and OOB signaling --------------
    GTXTXN_OUT                              : out  std_logic;
    GTXTXP_OUT                              : out  std_logic;
    ----------------------- Transmit Ports - TX PLL Ports ----------------------
    TXRESETDONE_OUT                         : out  std_logic




);
end component;




--********************************* Main Body of Code**************************

begin                       

    tied_to_ground_i                    <= '0';
    tied_to_ground_vec_i(63 downto 0)   <= (others => '0');
    tied_to_vcc_i                       <= '1';
    --------------------------- GT Instances  -------------------------------   

    --_________________________________________________________________________
    --_________________________________________________________________________
    --GT0  (X0Y4)

    gt0_GTWIZARD_i :  gig_eth_pcs_pma_v11_4_GTWIZARD_GT
    generic map
    (
        -- Simulation attributes
        GT_SIM_GTRESET_SPEEDUP        =>  WRAPPER_SIM_GTRESET_SPEEDUP,
        RX_DFE_KL_CFG2_IN             =>  RX_DFE_KL_CFG2_IN,
        PMA_RSV_IN                    =>  PMA_RSV_IN,
        PCS_RSVD_ATTR_IN              =>  X"000000000000",
        SIM_VERSION                   =>  SIM_VERSION    
    )
    port map
    (
        ------------------------- Channel - Ref Clock Ports ------------------------
        GTREFCLK0_IN                    =>      GT0_GTREFCLK0_IN,
        -------------------------------- Channel PLL -------------------------------
        CPLLFBCLKLOST_OUT               =>      GT0_CPLLFBCLKLOST_OUT,
        CPLLLOCK_OUT                    =>      GT0_CPLLLOCK_OUT,
        CPLLLOCKDETCLK_IN               =>      GT0_CPLLLOCKDETCLK_IN,
        CPLLREFCLKLOST_OUT              =>      GT0_CPLLREFCLKLOST_OUT,
        CPLLRESET_IN                    =>      GT0_CPLLRESET_IN,
        ------------------------------- Eye Scan Ports -----------------------------
        EYESCANDATAERROR_OUT            =>      GT0_EYESCANDATAERROR_OUT,
        ------------------------ Loopback and Powerdown Ports ----------------------
        LOOPBACK_IN                     =>      GT0_LOOPBACK_IN,
        RXPD_IN                         =>      GT0_RXPD_IN,
        TXPD_IN                         =>      GT0_TXPD_IN,
        ------------------------------- Receive Ports ------------------------------
        RXUSERRDY_IN                    =>      GT0_RXUSERRDY_IN,
        ----------------------- Receive Ports - 8b10b Decoder ----------------------
        RXCHARISCOMMA_OUT               =>      GT0_RXCHARISCOMMA_OUT,
        RXCHARISK_OUT                   =>      GT0_RXCHARISK_OUT,
        RXDISPERR_OUT                   =>      GT0_RXDISPERR_OUT,
        RXNOTINTABLE_OUT                =>      GT0_RXNOTINTABLE_OUT,
        ------------------- Receive Ports - Clock Correction Ports -----------------
        RXCLKCORCNT_OUT                 =>      GT0_RXCLKCORCNT_OUT,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        RXMCOMMAALIGNEN_IN              =>      GT0_RXMCOMMAALIGNEN_IN,
        RXPCOMMAALIGNEN_IN              =>      GT0_RXPCOMMAALIGNEN_IN,
        ------------------- Receive Ports - RX Data Path interface -----------------
        GTRXRESET_IN                    =>      GT0_GTRXRESET_IN,
        RXDATA_OUT                      =>      GT0_RXDATA_OUT,
        RXOUTCLK_OUT                    =>      GT0_RXOUTCLK_OUT,
        RXPCSRESET_IN                   =>      GT0_RXPCSRESET_IN,
        RXUSRCLK_IN                     =>      GT0_RXUSRCLK_IN,
        RXUSRCLK2_IN                    =>      GT0_RXUSRCLK2_IN,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        GTXRXN_IN                       =>      GT0_GTXRXN_IN,
        GTXRXP_IN                       =>      GT0_GTXRXP_IN,
        RXCDRLOCK_OUT                   =>      GT0_RXCDRLOCK_OUT,
        RXELECIDLE_OUT                  =>      GT0_RXELECIDLE_OUT,
        -------- Receive Ports - RX Elastic Buffer and Phase Alignment Ports -------
        RXBUFRESET_IN                   =>      GT0_RXBUFRESET_IN,
        RXBUFSTATUS_OUT                 =>      GT0_RXBUFSTATUS_OUT,
        ------------------------ Receive Ports - RX PLL Ports ----------------------
        RXRESETDONE_OUT                 =>      GT0_RXRESETDONE_OUT,
        ------------------------------- Transmit Ports -----------------------------
        TXUSERRDY_IN                    =>      GT0_TXUSERRDY_IN,
        ---------------- Transmit Ports - 8b10b Encoder Control Ports --------------
        TXCHARDISPMODE_IN               =>      GT0_TXCHARDISPMODE_IN,
        TXCHARDISPVAL_IN                =>      GT0_TXCHARDISPVAL_IN,
        TXCHARISK_IN                    =>      GT0_TXCHARISK_IN,
        ------------ Transmit Ports - TX Buffer and Phase Alignment Ports ----------
        TXBUFSTATUS_OUT                 =>      GT0_TXBUFSTATUS_OUT,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        GTTXRESET_IN                    =>      GT0_GTTXRESET_IN,
        TXDATA_IN                       =>      GT0_TXDATA_IN,
        TXOUTCLK_OUT                    =>      GT0_TXOUTCLK_OUT,
        TXOUTCLKFABRIC_OUT              =>      GT0_TXOUTCLKFABRIC_OUT,
        TXOUTCLKPCS_OUT                 =>      GT0_TXOUTCLKPCS_OUT,
        TXPCSRESET_IN                   =>      GT0_TXPCSRESET_IN,
        TXUSRCLK_IN                     =>      GT0_TXUSRCLK_IN,
        TXUSRCLK2_IN                    =>      GT0_TXUSRCLK2_IN,
        ---------------- Transmit Ports - TX Driver and OOB signaling --------------
        GTXTXN_OUT                      =>      GT0_GTXTXN_OUT,
        GTXTXP_OUT                      =>      GT0_GTXTXP_OUT,
        ----------------------- Transmit Ports - TX PLL Ports ----------------------
        TXRESETDONE_OUT                 =>      GT0_TXRESETDONE_OUT



    );


     
end RTL;
