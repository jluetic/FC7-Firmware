----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko 
-- Create Date: 02/06/2017 09:00:00 PM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity i2c_replies_fifo is
  Port (
    reset           : in std_logic;    
    wr_clk          : in std_logic;
    rd_clk          : in std_logic;
    reply_ready     : in std_logic;
    din_i           : in  std_logic_vector(31 downto 0);      
    read_next       : in  std_logic; 
    dout_o          : out std_logic_vector(31 downto 0);
    empty_o         : out std_logic;
    full_o          : out std_logic;
    ndata_o         : out std_logic_vector(15 downto 0)
  );
end i2c_replies_fifo;

architecture rtl of i2c_replies_fifo is

   signal we               : std_logic;
   signal waddr            : std_logic_vector(15 downto 0) := (others => '0');
   signal din              : std_logic_vector(31 downto 0);
   signal ndata            : std_logic_vector(15 downto 0) := (others => '0');  
   signal nwdata           : std_logic_vector(15 downto 0) := (others => '0');
   signal nrdata           : std_logic_vector(15 downto 0) := (others => '0');    
   signal full             : std_logic;
   signal raddr            : std_logic_vector(15 downto 0) := (others => '0');
   signal empty            : std_logic;
   constant max_events     : integer := 2**16;

begin

    --=============================--
    process(reset, wr_clk)
    --=============================--
    begin
    if reset='1' then     
        we       <= '0';
        waddr    <= ( others => '0' );
        nwdata    <= ( others => '0' );           
    elsif rising_edge(wr_clk) then  
        we         <= '0';
        if reply_ready = '1' then   
            if full = '0' then
                we        <= '1';
                waddr     <= nwdata;
                nwdata     <= nwdata + 1;
                din       <= din_i;
            end if;
        end if;
    end if;
    end process;

	--=============================--
    process(reset, rd_clk)
    --=============================--
    begin
    if reset='1' then     
        raddr  <= (others => '0');
        nrdata <= (others => '0');
    elsif falling_edge(rd_clk) then
        if read_next = '1' and empty = '0' then
            raddr <= nrdata + 1;
            nrdata <= nrdata + 1;
        end if;
    end if;
    end process;

    ndata <= nwdata - nrdata;
    empty <= '1' when ( to_integer(unsigned(ndata)) = 0 ) else '0';
    full  <= '1' when ( to_integer(unsigned(nwdata)) = (max_events-1) ) else '0';

    -- 32 x 65536
    replies_bram : entity work.replies_bram
    PORT map (
        clka    => wr_clk,
        wea(0)  => we,
        addra   => waddr(15 downto 0),
        dina    => din,
        clkb    => rd_clk,
        addrb   => raddr(15 downto 0),
        doutb   => dout_o
    );
 
    ndata_o  <= ndata;
    full_o   <= full;
    empty_o  <= empty;

end rtl;
