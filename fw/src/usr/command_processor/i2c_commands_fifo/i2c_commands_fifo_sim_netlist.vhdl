-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
-- Date        : Wed Dec 21 16:19:11 2016
-- Host        : cmsharankonb running 64-bit Ubuntu 16.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/harankom/Soft/Xilinx/Projects/FC7-Firmware/fw/src/usr/command_processor/i2c_commands_fifo/i2c_commands_fifo_sim_netlist.vhdl
-- Design      : i2c_commands_fifo
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k420tffg1156-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_5_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_3_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_5_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_10 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_10 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_10;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_10 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__52\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_11 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_11 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_11;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_11 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__51\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_12 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_12 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_12;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_12 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__50\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_13 is
  port (
    \dout[0]\ : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_tmp : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en : in STD_LOGIC;
    p_29_out : in STD_LOGIC;
    p_36_out : in STD_LOGIC;
    p_43_out : in STD_LOGIC;
    p_50_out : in STD_LOGIC;
    p_5_out : in STD_LOGIC;
    p_15_out : in STD_LOGIC;
    p_22_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_13 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_13;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_13 is
  signal \^empty\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_8_out : STD_LOGIC;
  signal \^wr_tmp\ : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  empty <= \^empty\;
  wr_tmp <= \^wr_tmp\;
full_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => p_8_out,
      I1 => p_5_out,
      I2 => p_15_out,
      I3 => p_22_out,
      O => \^empty\
    );
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_10_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_8_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^wr_tmp\,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
\gf36e1_inst.sngfifo36e1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => wr_en,
      I1 => \^empty\,
      I2 => p_29_out,
      I3 => p_36_out,
      I4 => p_43_out,
      I5 => p_50_out,
      O => \^wr_tmp\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_14 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_14 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_14;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_14 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__43\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_15 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_15 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_15;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_15 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__48\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_16 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_16 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_16;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_16 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__47\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_17 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_17 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_17;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_17 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__46\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_18 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_18 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_18;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_18 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__45\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_19 is
  port (
    p_11_out_8 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_19 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_19;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_19 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out_7 : STD_LOGIC;
  signal p_12_out_9 : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out_9,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out_8,
      FULL => p_10_out_7,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__44\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out_7,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_21 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_15_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_21 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_21;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_21 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_17_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_15_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_22 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_22 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_22;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_22 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_23 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_23 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_23;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_23 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__41\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_24 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_24 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_24;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_24 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__40\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_25 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_25 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_25;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_25 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__39\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_26 is
  port (
    p_18_out_2 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_26 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_26;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_26 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out_1 : STD_LOGIC;
  signal p_19_out_3 : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out_3,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out_2,
      FULL => p_17_out_1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__38\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out_1,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_27 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_27 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_27;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_27 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__37\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out_2,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_29 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_22_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_29 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_29;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_29 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_24_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_22_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_30 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_30 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_30;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_30 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__29\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_31 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_31 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_31;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_31 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__34\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_32 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_32 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_32;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_32 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__33\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_33 is
  port (
    p_25_out_2 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_33 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_33;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_33 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out_1 : STD_LOGIC;
  signal p_26_out_3 : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out_3,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out_2,
      FULL => p_24_out_1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__32\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out_1,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_34 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_34 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_34;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_34 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out_2,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_35 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_35 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_35;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_35 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_37 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_29_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_37 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_37;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_37 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_31_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_29_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_38 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_38 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_38;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_38 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_39 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_39 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_39;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_39 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__27\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_40 is
  port (
    p_32_out_2 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_40 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_40;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_40 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out_1 : STD_LOGIC;
  signal p_33_out_3 : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out_3,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out_2,
      FULL => p_31_out_1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out_1,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_41 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_41 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_41;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_41 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out_2,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_42 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_42 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_42;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_42 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_43 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_43 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_43;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_43 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__23\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_45 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_36_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_45 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_45;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_45 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_38_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_36_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_46 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_46 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_46;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_46 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_47 is
  port (
    p_39_out_2 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_47 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_47;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_47 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out_1 : STD_LOGIC;
  signal p_40_out_3 : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out_3,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out_2,
      FULL => p_38_out_1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__20\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out_1,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_48 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_48 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_48;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_48 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out_2,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_49 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_49 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_49;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_49 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_50 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_50 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_50;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_50 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_51 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_51 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_51;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_51 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_53 is
  port (
    \dout[0]\ : out STD_LOGIC;
    p_43_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_53 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_53;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_53 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_45_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[0]\,
      FULL => p_43_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_54 is
  port (
    p_46_out_2 : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_54 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_54;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_54 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out_1 : STD_LOGIC;
  signal p_47_out_3 : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out_3,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out_2,
      FULL => p_45_out_1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out_1,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_55 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_55 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_55;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_55 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out_2,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_56 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_56 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_56;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_56 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_57 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_57 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_57;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_57 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_58 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_58 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_58;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_58 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_59 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_59 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_59;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_59 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_61 is
  port (
    \dout[4]\ : out STD_LOGIC;
    p_50_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    full : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_6 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_43_out : in STD_LOGIC;
    p_36_out : in STD_LOGIC;
    p_29_out : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_61 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_61;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_61 is
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_15\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal \^p_50_out\ : STD_LOGIC;
  signal p_52_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "INDEPENDENT";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  p_50_out <= \^p_50_out\;
full_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \^p_50_out\,
      I1 => p_43_out,
      I2 => p_36_out,
      I3 => p_29_out,
      I4 => \rsync.ric.wr_rst_reg_reg\,
      O => full
    );
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_52_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => din(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \dout[4]\,
      FULL => \^p_50_out\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_6,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => wr_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => wr_tmp,
      WRERR => \gf36e1_inst.sngfifo36e1_n_15\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_62 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_62 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_62;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_62 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_63 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_63 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_63;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_63 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_64 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_64 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_64;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_64 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_65 is
  port (
    p_25_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_3 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_2 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_32_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_65 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_65;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_65 is
  signal \^e_3\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_24_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_28_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_3 <= \^e_3\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_26_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_25_out,
      FULL => p_24_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_2,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_3\,
      WRERR => p_28_out
    );
\gf36e1_inst.sngfifo36e1_i_1__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_24_out,
      I1 => p_32_out,
      O => \^e_3\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_66 is
  port (
    p_18_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_2 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_1 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_25_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_66 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_66;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_66 is
  signal \^e_2\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_21_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_2 <= \^e_2\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_19_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_18_out,
      FULL => p_17_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_1,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_2\,
      WRERR => p_21_out
    );
\gf36e1_inst.sngfifo36e1_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_17_out,
      I1 => p_25_out,
      O => \^e_2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_67 is
  port (
    p_11_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_1 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_0 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_18_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_67 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_67;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_67 is
  signal \^e_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_10_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_1 <= \^e_1\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_12_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_11_out,
      FULL => p_10_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_0,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_1\,
      WRERR => p_14_out
    );
\gf36e1_inst.sngfifo36e1_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_10_out,
      I1 => p_18_out,
      O => \^e_1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_7 is
  port (
    p_46_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_6 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_5 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_7 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_7;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_7 is
  signal \^e_6\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_45_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_49_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_6 <= \^e_6\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_47_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_46_out,
      FULL => p_45_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_5,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_6\,
      WRERR => p_49_out
    );
\gf36e1_inst.sngfifo36e1_i_1__49\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_45_out,
      I1 => \rsync.ric.wr_rst_reg_reg_0\,
      O => \^e_6\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_8 is
  port (
    p_39_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_5 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_4 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_46_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_8 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_8;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_8 is
  signal \^e_5\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_38_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_42_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_5 <= \^e_5\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_40_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_39_out,
      FULL => p_38_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_4,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_5\,
      WRERR => p_42_out
    );
\gf36e1_inst.sngfifo36e1_i_1__54\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_38_out,
      I1 => p_46_out,
      O => \^e_5\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_prim_v6_9 is
  port (
    p_32_out : out STD_LOGIC;
    DO : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_4 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    e_3 : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_39_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_prim_v6_9 : entity is "builtin_prim_v6";
end i2c_commands_fifo_builtin_prim_v6_9;

architecture STRUCTURE of i2c_commands_fifo_builtin_prim_v6_9 is
  signal \^e_4\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_31_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_35_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_4 <= \^e_4\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"000A",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => true,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => p_33_out,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => \rsync.ric.wr_rst_reg_reg\(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => DO(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_32_out,
      FULL => p_31_out,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => e_3,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_4\,
      WRERR => p_35_out
    );
\gf36e1_inst.sngfifo36e1_i_1__53\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_31_out,
      I1 => p_39_out,
      O => \^e_4\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0\ is
  port (
    p_4_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_1\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_10\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_3_out_0 : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => \gf36e1_inst.sngfifo36e1_n_10\,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => \gf36e1_inst.sngfifo36e1_n_0\,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_4_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => \gf36e1_inst.sngfifo36e1_n_1\,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out_0
    );
\gf36e1_inst.sngfifo36e1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_20\ is
  port (
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : out STD_LOGIC;
    e_0 : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out_8 : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    p_30_out : in STD_LOGIC;
    p_37_out : in STD_LOGIC;
    p_44_out : in STD_LOGIC;
    p_51_out : in STD_LOGIC;
    p_4_out : in STD_LOGIC;
    p_16_out : in STD_LOGIC;
    p_23_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_20\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_20\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_20\ is
  signal \^e_0\ : STD_LOGIC;
  signal \^full\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_12_out : STD_LOGIC;
  signal p_13_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal p_9_out : STD_LOGIC;
  signal \^rd_tmp\ : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
  full <= \^full\;
  rd_tmp <= \^rd_tmp\;
empty_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => p_9_out,
      I1 => p_4_out,
      I2 => p_16_out,
      I3 => p_23_out,
      O => \^full\
    );
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_11_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_13_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_9_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => \^rd_tmp\,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_12_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => rd_en,
      I1 => \^full\,
      I2 => p_30_out,
      I3 => p_37_out,
      I4 => p_44_out,
      I5 => p_51_out,
      O => \^rd_tmp\
    );
\gf36e1_inst.sngfifo36e1_i_1__42\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out_8,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_28\ is
  port (
    p_16_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_28\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_28\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_28\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_18_out : STD_LOGIC;
  signal p_19_out : STD_LOGIC;
  signal p_20_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_18_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_20_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_16_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_19_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__35\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_36\ is
  port (
    p_23_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_36\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_36\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_36\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_25_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_27_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_25_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_27_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_23_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_26_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__28\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_44\ is
  port (
    p_30_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_44\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_44\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_44\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_32_out : STD_LOGIC;
  signal p_33_out : STD_LOGIC;
  signal p_34_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_32_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_34_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_30_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_33_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_52\ is
  port (
    p_37_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_52\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_52\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_52\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_39_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal p_40_out : STD_LOGIC;
  signal p_41_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_39_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_41_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_37_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_40_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_60\ is
  port (
    p_44_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_60\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_60\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_60\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal p_46_out : STD_LOGIC;
  signal p_47_out : STD_LOGIC;
  signal p_48_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_46_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_48_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => p_44_out,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_47_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \i2c_commands_fifo_builtin_prim_v6__parameterized0_68\ is
  port (
    p_51_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    e_0 : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_tmp : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    DO : in STD_LOGIC_VECTOR ( 3 downto 0 );
    p_11_out : in STD_LOGIC;
    p_44_out : in STD_LOGIC;
    p_37_out : in STD_LOGIC;
    p_30_out : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \i2c_commands_fifo_builtin_prim_v6__parameterized0_68\ : entity is "builtin_prim_v6";
end \i2c_commands_fifo_builtin_prim_v6__parameterized0_68\;

architecture STRUCTURE of \i2c_commands_fifo_builtin_prim_v6__parameterized0_68\ is
  signal \^e_0\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_11\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_13\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_14\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_16\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_17\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_18\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_19\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_20\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_21\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_22\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_23\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_24\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_25\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_26\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_27\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_28\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_29\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_30\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_31\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_32\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_33\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_34\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_35\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_36\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_37\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_38\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_39\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_40\ : STD_LOGIC;
  signal \gf36e1_inst.sngfifo36e1_n_41\ : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal \^p_51_out\ : STD_LOGIC;
  signal p_53_out : STD_LOGIC;
  signal p_54_out : STD_LOGIC;
  signal p_55_out : STD_LOGIC;
  signal \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 63 downto 4 );
  signal \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \gf36e1_inst.sngfifo36e1\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \gf36e1_inst.sngfifo36e1\ : label is "PRIMITIVE";
begin
  e_0 <= \^e_0\;
  p_51_out <= \^p_51_out\;
empty_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \^p_51_out\,
      I1 => p_44_out,
      I2 => p_37_out,
      I3 => p_30_out,
      I4 => \rsync.ric.wr_rst_reg_reg\,
      O => empty
    );
\gf36e1_inst.sngfifo36e1\: unisim.vcomponents.FIFO36E1
    generic map(
      ALMOST_EMPTY_OFFSET => X"0005",
      ALMOST_FULL_OFFSET => X"000A",
      DATA_WIDTH => 4,
      DO_REG => 1,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      EN_SYN => false,
      FIFO_MODE => "FIFO36",
      FIRST_WORD_FALL_THROUGH => false,
      INIT => X"000000000000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      SIM_DEVICE => "7SERIES",
      SRVAL => X"000000000000000000"
    )
        port map (
      ALMOSTEMPTY => p_53_out,
      ALMOSTFULL => \gf36e1_inst.sngfifo36e1_n_11\,
      DBITERR => p_55_out,
      DI(63 downto 4) => B"000000000000000000000000000000000000000000000000000000000000",
      DI(3 downto 0) => DO(3 downto 0),
      DIP(7 downto 0) => B"00000000",
      DO(63 downto 4) => \NLW_gf36e1_inst.sngfifo36e1_DO_UNCONNECTED\(63 downto 4),
      DO(3 downto 0) => dout(3 downto 0),
      DOP(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_DOP_UNCONNECTED\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gf36e1_inst.sngfifo36e1_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => \^p_51_out\,
      FULL => \gf36e1_inst.sngfifo36e1_n_13\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDCLK => rd_clk,
      RDCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_16\,
      RDCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_17\,
      RDCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_18\,
      RDCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_19\,
      RDCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_20\,
      RDCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_21\,
      RDCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_22\,
      RDCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_23\,
      RDCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_24\,
      RDCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_25\,
      RDCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_26\,
      RDCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_27\,
      RDCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_28\,
      RDEN => rd_tmp,
      RDERR => \gf36e1_inst.sngfifo36e1_n_14\,
      REGCE => '0',
      RST => wr_rst_i,
      RSTREG => '0',
      SBITERR => p_54_out,
      WRCLK => rd_clk,
      WRCOUNT(12) => \gf36e1_inst.sngfifo36e1_n_29\,
      WRCOUNT(11) => \gf36e1_inst.sngfifo36e1_n_30\,
      WRCOUNT(10) => \gf36e1_inst.sngfifo36e1_n_31\,
      WRCOUNT(9) => \gf36e1_inst.sngfifo36e1_n_32\,
      WRCOUNT(8) => \gf36e1_inst.sngfifo36e1_n_33\,
      WRCOUNT(7) => \gf36e1_inst.sngfifo36e1_n_34\,
      WRCOUNT(6) => \gf36e1_inst.sngfifo36e1_n_35\,
      WRCOUNT(5) => \gf36e1_inst.sngfifo36e1_n_36\,
      WRCOUNT(4) => \gf36e1_inst.sngfifo36e1_n_37\,
      WRCOUNT(3) => \gf36e1_inst.sngfifo36e1_n_38\,
      WRCOUNT(2) => \gf36e1_inst.sngfifo36e1_n_39\,
      WRCOUNT(1) => \gf36e1_inst.sngfifo36e1_n_40\,
      WRCOUNT(0) => \gf36e1_inst.sngfifo36e1_n_41\,
      WREN => \^e_0\,
      WRERR => p_3_out
    );
\gf36e1_inst.sngfifo36e1_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \gf36e1_inst.sngfifo36e1_n_13\,
      I1 => p_11_out,
      O => \^e_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_reset_builtin is
  port (
    wr_rst_i : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_reset_builtin : entity is "reset_builtin";
end i2c_commands_fifo_reset_builtin;

architecture STRUCTURE of i2c_commands_fifo_reset_builtin is
  signal power_on_rd_rst : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute async_reg : string;
  attribute async_reg of power_on_rd_rst : signal is "true";
  attribute msgon : string;
  attribute msgon of power_on_rd_rst : signal is "true";
  signal power_on_wr_rst : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute async_reg of power_on_wr_rst : signal is "true";
  attribute msgon of power_on_wr_rst : signal is "true";
  signal rd_rst_reg1 : STD_LOGIC;
  attribute async_reg of rd_rst_reg1 : signal is "true";
  attribute msgon of rd_rst_reg1 : signal is "true";
  signal rd_rst_reg2 : STD_LOGIC;
  attribute async_reg of rd_rst_reg2 : signal is "true";
  attribute msgon of rd_rst_reg2 : signal is "true";
  signal \rsync.ric.wr_rst_fb_reg[1]_srl4_n_0\ : STD_LOGIC;
  signal \rsync.ric.wr_rst_fb_reg_n_0_[0]\ : STD_LOGIC;
  signal \rsync.ric.wr_rst_reg_i_1_n_0\ : STD_LOGIC;
  signal wr_rst_reg : STD_LOGIC;
  signal wr_rst_reg1 : STD_LOGIC;
  attribute async_reg of wr_rst_reg1 : signal is "true";
  attribute msgon of wr_rst_reg1 : signal is "true";
  signal wr_rst_reg2 : STD_LOGIC;
  attribute async_reg of wr_rst_reg2 : signal is "true";
  attribute msgon of wr_rst_reg2 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[0]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[1]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[1]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[2]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[2]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[3]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[3]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[4]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[4]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_rd_rst_reg[5]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_rd_rst_reg[5]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_rd_rst_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[0]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[0]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[0]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[1]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[1]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[1]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[2]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[2]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[2]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[3]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[3]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[3]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[4]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[4]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[4]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.power_on_wr_rst_reg[5]\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.power_on_wr_rst_reg[5]\ : label is "yes";
  attribute msgon of \rsync.ric.power_on_wr_rst_reg[5]\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.rd_rst_reg1_reg\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.rd_rst_reg1_reg\ : label is "yes";
  attribute msgon of \rsync.ric.rd_rst_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.rd_rst_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.rd_rst_reg2_reg\ : label is "yes";
  attribute msgon of \rsync.ric.rd_rst_reg2_reg\ : label is "true";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \rsync.ric.wr_rst_fb_reg[1]_srl4\ : label is "U0/\inst_fifo_gen/gconvfifo.rf/gbi.bi/g7ser_birst.rstbt/rsync.ric.wr_rst_fb_reg ";
  attribute srl_name : string;
  attribute srl_name of \rsync.ric.wr_rst_fb_reg[1]_srl4\ : label is "U0/\inst_fifo_gen/gconvfifo.rf/gbi.bi/g7ser_birst.rstbt/rsync.ric.wr_rst_fb_reg[1]_srl4 ";
  attribute ASYNC_REG_boolean of \rsync.ric.wr_rst_reg1_reg\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.wr_rst_reg1_reg\ : label is "yes";
  attribute msgon of \rsync.ric.wr_rst_reg1_reg\ : label is "true";
  attribute ASYNC_REG_boolean of \rsync.ric.wr_rst_reg2_reg\ : label is std.standard.true;
  attribute KEEP of \rsync.ric.wr_rst_reg2_reg\ : label is "yes";
  attribute msgon of \rsync.ric.wr_rst_reg2_reg\ : label is "true";
begin
\gf36e1_inst.sngfifo36e1_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => wr_rst_reg,
      I1 => power_on_wr_rst(0),
      O => wr_rst_i
    );
\rsync.ric.power_on_rd_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => power_on_rd_rst(1),
      Q => power_on_rd_rst(0),
      R => '0'
    );
\rsync.ric.power_on_rd_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => power_on_rd_rst(2),
      Q => power_on_rd_rst(1),
      R => '0'
    );
\rsync.ric.power_on_rd_rst_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => power_on_rd_rst(3),
      Q => power_on_rd_rst(2),
      R => '0'
    );
\rsync.ric.power_on_rd_rst_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => power_on_rd_rst(4),
      Q => power_on_rd_rst(3),
      R => '0'
    );
\rsync.ric.power_on_rd_rst_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => power_on_rd_rst(5),
      Q => power_on_rd_rst(4),
      R => '0'
    );
\rsync.ric.power_on_rd_rst_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      Q => power_on_rd_rst(5),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => power_on_wr_rst(1),
      Q => power_on_wr_rst(0),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => power_on_wr_rst(2),
      Q => power_on_wr_rst(1),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => power_on_wr_rst(3),
      Q => power_on_wr_rst(2),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => power_on_wr_rst(4),
      Q => power_on_wr_rst(3),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => power_on_wr_rst(5),
      Q => power_on_wr_rst(4),
      R => '0'
    );
\rsync.ric.power_on_wr_rst_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => power_on_wr_rst(5),
      R => '0'
    );
\rsync.ric.rd_rst_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => '0',
      PRE => rst,
      Q => rd_rst_reg1
    );
\rsync.ric.rd_rst_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => rd_clk,
      CE => '1',
      D => rd_rst_reg1,
      PRE => rst,
      Q => rd_rst_reg2
    );
\rsync.ric.wr_rst_fb_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \rsync.ric.wr_rst_fb_reg[1]_srl4_n_0\,
      Q => \rsync.ric.wr_rst_fb_reg_n_0_[0]\,
      R => '0'
    );
\rsync.ric.wr_rst_fb_reg[1]_srl4\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => wr_clk,
      D => wr_rst_reg,
      Q => \rsync.ric.wr_rst_fb_reg[1]_srl4_n_0\
    );
\rsync.ric.wr_rst_reg1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      PRE => rst,
      Q => wr_rst_reg1
    );
\rsync.ric.wr_rst_reg2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => wr_rst_reg1,
      PRE => rst,
      Q => wr_rst_reg2
    );
\rsync.ric.wr_rst_reg_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => wr_rst_reg,
      I1 => \rsync.ric.wr_rst_fb_reg_n_0_[0]\,
      O => \rsync.ric.wr_rst_reg_i_1_n_0\
    );
\rsync.ric.wr_rst_reg_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \rsync.ric.wr_rst_reg_i_1_n_0\,
      PRE => wr_rst_reg2,
      Q => wr_rst_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6 is
  port (
    p_50_out : out STD_LOGIC;
    p_51_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC;
    p_43_out : in STD_LOGIC;
    p_36_out : in STD_LOGIC;
    p_29_out : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg\ : in STD_LOGIC;
    p_44_out : in STD_LOGIC;
    p_37_out : in STD_LOGIC;
    p_30_out : in STD_LOGIC;
    \rsync.ric.wr_rst_reg_reg_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out_3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out_2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_61
     port map (
      DO(3 downto 0) => p_51_out_0(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[4]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      full => full,
      p_29_out => p_29_out,
      p_36_out => p_36_out,
      p_43_out => p_43_out,
      p_50_out => p_50_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\ => \rsync.ric.wr_rst_reg_reg\,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_62
     port map (
      DO(3 downto 0) => p_44_out_1(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out_0(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_63
     port map (
      DO(3 downto 0) => p_37_out_2(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out_1(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_64
     port map (
      DO(3 downto 0) => p_30_out_3(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out_2(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_65
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out_3(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_66
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_67
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_68\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      empty => empty,
      p_11_out => p_11_out,
      p_30_out => p_30_out,
      p_37_out => p_37_out,
      p_44_out => p_44_out,
      p_51_out => p_51_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      \rsync.ric.wr_rst_reg_reg\ => \rsync.ric.wr_rst_reg_reg_0\,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_0 is
  port (
    p_43_out : out STD_LOGIC;
    p_44_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_0 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_0;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_0 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out_2 : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_53
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_43_out => p_43_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_54
     port map (
      DO(3 downto 0) => p_44_out_0(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out_2 => p_46_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_55
     port map (
      DO(3 downto 0) => p_37_out(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out_2 => p_46_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out_0(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_56
     port map (
      DO(3 downto 0) => p_30_out(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_57
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_58
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_59
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_60\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_44_out => p_44_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_1 is
  port (
    p_36_out : out STD_LOGIC;
    p_37_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_1 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_1;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_1 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out_2 : STD_LOGIC;
  signal p_44_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_45
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_36_out => p_36_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_46
     port map (
      DO(3 downto 0) => p_44_out(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_47
     port map (
      DO(3 downto 0) => p_37_out_0(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out_2 => p_39_out_2,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_48
     port map (
      DO(3 downto 0) => p_30_out(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out_2 => p_39_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out_0(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_49
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_50
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_51
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_52\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_37_out => p_37_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_2 is
  port (
    p_29_out : out STD_LOGIC;
    p_30_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_2 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_2;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_2 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out_2 : STD_LOGIC;
  signal p_37_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_37
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_29_out => p_29_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_38
     port map (
      DO(3 downto 0) => p_44_out(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_39
     port map (
      DO(3 downto 0) => p_37_out(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_40
     port map (
      DO(3 downto 0) => p_30_out_0(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out_2 => p_32_out_2,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_41
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out_2 => p_32_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out_0(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_42
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_43
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_44\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_30_out => p_30_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_3 is
  port (
    p_22_out : out STD_LOGIC;
    p_23_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_3 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_3;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_3 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out_2 : STD_LOGIC;
  signal p_30_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_29
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_22_out => p_22_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_30
     port map (
      DO(3 downto 0) => p_44_out(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_31
     port map (
      DO(3 downto 0) => p_37_out(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_32
     port map (
      DO(3 downto 0) => p_30_out(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_33
     port map (
      DO(3 downto 0) => p_23_out_0(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out_2 => p_25_out_2,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_34
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out_2 => p_25_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out_0(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_35
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_36\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_23_out => p_23_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_4 is
  port (
    p_15_out : out STD_LOGIC;
    p_16_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_4 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_4;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_4 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out_2 : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_21
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_15_out => p_15_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_22
     port map (
      DO(3 downto 0) => p_44_out(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_23
     port map (
      DO(3 downto 0) => p_37_out(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_24
     port map (
      DO(3 downto 0) => p_30_out(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_25
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_26
     port map (
      DO(3 downto 0) => p_16_out_0(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out_2 => p_18_out_2,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_27
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out_2 => p_18_out_2,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out_0(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_28\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_16_out => p_16_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_5 is
  port (
    wr_tmp : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : out STD_LOGIC;
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wr_en : in STD_LOGIC;
    p_29_out : in STD_LOGIC;
    p_36_out : in STD_LOGIC;
    p_43_out : in STD_LOGIC;
    p_50_out : in STD_LOGIC;
    p_5_out : in STD_LOGIC;
    p_15_out : in STD_LOGIC;
    p_22_out : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    p_30_out : in STD_LOGIC;
    p_37_out : in STD_LOGIC;
    p_44_out : in STD_LOGIC;
    p_51_out : in STD_LOGIC;
    p_4_out : in STD_LOGIC;
    p_16_out : in STD_LOGIC;
    p_23_out : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_5 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_5;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_5 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out_8 : STD_LOGIC;
  signal p_16_out_5 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out_4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out_3 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out_2 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out_0 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out_6 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_13
     port map (
      DO(3 downto 0) => p_51_out_0(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      empty => empty,
      p_15_out => p_15_out,
      p_22_out => p_22_out,
      p_29_out => p_29_out,
      p_36_out => p_36_out,
      p_43_out => p_43_out,
      p_50_out => p_50_out,
      p_5_out => p_5_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_14
     port map (
      DO(3 downto 0) => p_44_out_1(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out_0(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_15
     port map (
      DO(3 downto 0) => p_37_out_2(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out_1(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_16
     port map (
      DO(3 downto 0) => p_30_out_3(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out_2(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_17
     port map (
      DO(3 downto 0) => p_23_out_4(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out_3(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_18
     port map (
      DO(3 downto 0) => p_16_out_5(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out_4(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_19
     port map (
      DO(3 downto 0) => p_9_out_6(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out_8 => p_11_out_8,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out_5(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0_20\
     port map (
      DO(3 downto 0) => p_9_out_6(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      full => full,
      p_11_out_8 => p_11_out_8,
      p_16_out => p_16_out,
      p_23_out => p_23_out,
      p_30_out => p_30_out,
      p_37_out => p_37_out,
      p_44_out => p_44_out,
      p_4_out => p_4_out,
      p_51_out => p_51_out,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_extdepth_v6_6 is
  port (
    p_5_out : out STD_LOGIC;
    p_4_out : out STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_tmp : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rd_tmp : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_extdepth_v6_6 : entity is "builtin_extdepth_v6";
end i2c_commands_fifo_builtin_extdepth_v6_6;

architecture STRUCTURE of i2c_commands_fifo_builtin_extdepth_v6_6 is
  signal e_0 : STD_LOGIC;
  signal e_1 : STD_LOGIC;
  signal e_2 : STD_LOGIC;
  signal e_3 : STD_LOGIC;
  signal e_4 : STD_LOGIC;
  signal e_5 : STD_LOGIC;
  signal e_6 : STD_LOGIC;
  signal \gchain.gp1[1].gbldc.inst_prim_n_0\ : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_18_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_25_out : STD_LOGIC;
  signal p_30_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_32_out : STD_LOGIC;
  signal p_37_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_39_out : STD_LOGIC;
  signal p_44_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_46_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_9_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_i_0_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_1_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_2_O_UNCONNECTED : STD_LOGIC;
  signal NLW_i_3_O_UNCONNECTED : STD_LOGIC;
begin
\gchain.gp1[1].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6
     port map (
      DO(3 downto 0) => p_51_out(3 downto 0),
      din(3 downto 0) => din(3 downto 0),
      \dout[0]\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      e_6 => e_6,
      p_5_out => p_5_out,
      rd_clk => rd_clk,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gchain.gp1[2].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_7
     port map (
      DO(3 downto 0) => p_44_out(3 downto 0),
      e_5 => e_5,
      e_6 => e_6,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_51_out(3 downto 0),
      \rsync.ric.wr_rst_reg_reg_0\ => \gchain.gp1[1].gbldc.inst_prim_n_0\,
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[3].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_8
     port map (
      DO(3 downto 0) => p_37_out(3 downto 0),
      e_4 => e_4,
      e_5 => e_5,
      p_39_out => p_39_out,
      p_46_out => p_46_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_44_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[4].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_9
     port map (
      DO(3 downto 0) => p_30_out(3 downto 0),
      e_3 => e_3,
      e_4 => e_4,
      p_32_out => p_32_out,
      p_39_out => p_39_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_37_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[5].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_10
     port map (
      DO(3 downto 0) => p_23_out(3 downto 0),
      e_2 => e_2,
      e_3 => e_3,
      p_25_out => p_25_out,
      p_32_out => p_32_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_30_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[6].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_11
     port map (
      DO(3 downto 0) => p_16_out(3 downto 0),
      e_1 => e_1,
      e_2 => e_2,
      p_18_out => p_18_out,
      p_25_out => p_25_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_23_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[7].gbldc.inst_prim\: entity work.i2c_commands_fifo_builtin_prim_v6_12
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      e_0 => e_0,
      e_1 => e_1,
      p_11_out => p_11_out,
      p_18_out => p_18_out,
      rd_clk => rd_clk,
      \rsync.ric.wr_rst_reg_reg\(3 downto 0) => p_16_out(3 downto 0),
      wr_rst_i => wr_rst_i
    );
\gchain.gp1[8].gbldl.inst_prim\: entity work.\i2c_commands_fifo_builtin_prim_v6__parameterized0\
     port map (
      DO(3 downto 0) => p_9_out(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      e_0 => e_0,
      p_11_out => p_11_out,
      p_4_out => p_4_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_rst_i => wr_rst_i
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_0_O_UNCONNECTED
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_1_O_UNCONNECTED
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_2_O_UNCONNECTED
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => NLW_i_3_O_UNCONNECTED
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_builtin_top_v6 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    wr_rst_i : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_builtin_top_v6 : entity is "builtin_top_v6";
end i2c_commands_fifo_builtin_top_v6;

architecture STRUCTURE of i2c_commands_fifo_builtin_top_v6 is
  signal \gextw[7].gnll_fifo.inst_extd_n_6\ : STD_LOGIC;
  signal \gextw[7].gnll_fifo.inst_extd_n_7\ : STD_LOGIC;
  signal p_15_out : STD_LOGIC;
  signal p_16_out : STD_LOGIC;
  signal p_22_out : STD_LOGIC;
  signal p_23_out : STD_LOGIC;
  signal p_29_out : STD_LOGIC;
  signal p_30_out : STD_LOGIC;
  signal p_36_out : STD_LOGIC;
  signal p_37_out : STD_LOGIC;
  signal p_43_out : STD_LOGIC;
  signal p_44_out : STD_LOGIC;
  signal p_4_out : STD_LOGIC;
  signal p_50_out : STD_LOGIC;
  signal p_51_out : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal rd_tmp : STD_LOGIC;
  signal wr_tmp : STD_LOGIC;
begin
\gextw[1].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6
     port map (
      din(3 downto 0) => din(3 downto 0),
      dout(3 downto 0) => dout(3 downto 0),
      empty => empty,
      full => full,
      p_29_out => p_29_out,
      p_30_out => p_30_out,
      p_36_out => p_36_out,
      p_37_out => p_37_out,
      p_43_out => p_43_out,
      p_44_out => p_44_out,
      p_50_out => p_50_out,
      p_51_out => p_51_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      \rsync.ric.wr_rst_reg_reg\ => \gextw[7].gnll_fifo.inst_extd_n_6\,
      \rsync.ric.wr_rst_reg_reg_0\ => \gextw[7].gnll_fifo.inst_extd_n_7\,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[2].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_0
     port map (
      din(3 downto 0) => din(7 downto 4),
      dout(3 downto 0) => dout(7 downto 4),
      p_43_out => p_43_out,
      p_44_out => p_44_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[3].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_1
     port map (
      din(3 downto 0) => din(11 downto 8),
      dout(3 downto 0) => dout(11 downto 8),
      p_36_out => p_36_out,
      p_37_out => p_37_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[4].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_2
     port map (
      din(3 downto 0) => din(15 downto 12),
      dout(3 downto 0) => dout(15 downto 12),
      p_29_out => p_29_out,
      p_30_out => p_30_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[5].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_3
     port map (
      din(3 downto 0) => din(19 downto 16),
      dout(3 downto 0) => dout(19 downto 16),
      p_22_out => p_22_out,
      p_23_out => p_23_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[6].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_4
     port map (
      din(3 downto 0) => din(23 downto 20),
      dout(3 downto 0) => dout(23 downto 20),
      p_15_out => p_15_out,
      p_16_out => p_16_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[7].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_5
     port map (
      din(3 downto 0) => din(27 downto 24),
      dout(3 downto 0) => dout(27 downto 24),
      empty => \gextw[7].gnll_fifo.inst_extd_n_6\,
      full => \gextw[7].gnll_fifo.inst_extd_n_7\,
      p_15_out => p_15_out,
      p_16_out => p_16_out,
      p_22_out => p_22_out,
      p_23_out => p_23_out,
      p_29_out => p_29_out,
      p_30_out => p_30_out,
      p_36_out => p_36_out,
      p_37_out => p_37_out,
      p_43_out => p_43_out,
      p_44_out => p_44_out,
      p_4_out => p_4_out,
      p_50_out => p_50_out,
      p_51_out => p_51_out,
      p_5_out => p_5_out,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
\gextw[8].gnll_fifo.inst_extd\: entity work.i2c_commands_fifo_builtin_extdepth_v6_6
     port map (
      din(3 downto 0) => din(31 downto 28),
      dout(3 downto 0) => dout(31 downto 28),
      p_4_out => p_4_out,
      p_5_out => p_5_out,
      rd_clk => rd_clk,
      rd_tmp => rd_tmp,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i,
      wr_tmp => wr_tmp
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_fifo_generator_v13_1_1_builtin is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_fifo_generator_v13_1_1_builtin : entity is "fifo_generator_v13_1_1_builtin";
end i2c_commands_fifo_fifo_generator_v13_1_1_builtin;

architecture STRUCTURE of i2c_commands_fifo_fifo_generator_v13_1_1_builtin is
  signal wr_rst_i : STD_LOGIC;
begin
\g7ser_birst.rstbt\: entity work.i2c_commands_fifo_reset_builtin
     port map (
      rd_clk => rd_clk,
      rst => rst,
      wr_clk => wr_clk,
      wr_rst_i => wr_rst_i
    );
\v7_bi_fifo.fblk\: entity work.i2c_commands_fifo_builtin_top_v6
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      wr_clk => wr_clk,
      wr_en => wr_en,
      wr_rst_i => wr_rst_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_fifo_generator_top is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_fifo_generator_top : entity is "fifo_generator_top";
end i2c_commands_fifo_fifo_generator_top;

architecture STRUCTURE of i2c_commands_fifo_fifo_generator_top is
begin
\gbi.bi\: entity work.i2c_commands_fifo_fifo_generator_v13_1_1_builtin
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_fifo_generator_v13_1_1_synth is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_fifo_generator_v13_1_1_synth : entity is "fifo_generator_v13_1_1_synth";
end i2c_commands_fifo_fifo_generator_v13_1_1_synth;

architecture STRUCTURE of i2c_commands_fifo_fifo_generator_v13_1_1_synth is
begin
\gconvfifo.rf\: entity work.i2c_commands_fifo_fifo_generator_top
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo_fifo_generator_v13_1_1 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 15 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 15 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 32;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 32;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "kintex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "8kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 65533;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 65532;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 65536;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 40;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 65536;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 31;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of i2c_commands_fifo_fifo_generator_v13_1_1 : entity is "fifo_generator_v13_1_1";
end i2c_commands_fifo_fifo_generator_v13_1_1;

architecture STRUCTURE of i2c_commands_fifo_fifo_generator_v13_1_1 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(15) <= \<const0>\;
  data_count(14) <= \<const0>\;
  data_count(13) <= \<const0>\;
  data_count(12) <= \<const0>\;
  data_count(11) <= \<const0>\;
  data_count(10) <= \<const0>\;
  data_count(9) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(15) <= \<const0>\;
  rd_data_count(14) <= \<const0>\;
  rd_data_count(13) <= \<const0>\;
  rd_data_count(12) <= \<const0>\;
  rd_data_count(11) <= \<const0>\;
  rd_data_count(10) <= \<const0>\;
  rd_data_count(9) <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const1>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(15) <= \<const0>\;
  wr_data_count(14) <= \<const0>\;
  wr_data_count(13) <= \<const0>\;
  wr_data_count(12) <= \<const0>\;
  wr_data_count(11) <= \<const0>\;
  wr_data_count(10) <= \<const0>\;
  wr_data_count(9) <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const1>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.i2c_commands_fifo_fifo_generator_v13_1_1_synth
     port map (
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      rd_clk => rd_clk,
      rd_en => rd_en,
      rst => rst,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity i2c_commands_fifo is
  port (
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of i2c_commands_fifo : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of i2c_commands_fifo : entity is "i2c_commands_fifo,fifo_generator_v13_1_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of i2c_commands_fifo : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of i2c_commands_fifo : entity is "fifo_generator_v13_1_1,Vivado 2016.2";
end i2c_commands_fifo;

architecture STRUCTURE of i2c_commands_fifo is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 16;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 32;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 32;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintex7";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 1;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "8kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 65533;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 65532;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 16;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 65536;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 40;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 16;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 16;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 65536;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 31;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 16;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "true";
begin
U0: entity work.i2c_commands_fifo_fifo_generator_v13_1_1
     port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(15 downto 0) => NLW_U0_data_count_UNCONNECTED(15 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(31 downto 0) => din(31 downto 0),
      dout(31 downto 0) => dout(31 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(15 downto 0) => B"0000000000000000",
      prog_empty_thresh_assert(15 downto 0) => B"0000000000000000",
      prog_empty_thresh_negate(15 downto 0) => B"0000000000000000",
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(15 downto 0) => B"0000000000000000",
      prog_full_thresh_assert(15 downto 0) => B"0000000000000000",
      prog_full_thresh_negate(15 downto 0) => B"0000000000000000",
      rd_clk => rd_clk,
      rd_data_count(15 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(15 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => NLW_U0_rd_rst_busy_UNCONNECTED,
      rst => rst,
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(15 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(15 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => NLW_U0_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
