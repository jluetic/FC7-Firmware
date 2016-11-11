----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2016 12:52:31 PM
-- Design Name: 
-- Module Name: command_processor_core - rtl
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
use work.i2c_hybrid_constants_pack.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity command_processor_core is
  Port ( 
    clk             : in std_logic;
    reset           : in std_logic;    
    ------
    i2c_hybrids_scl  : inout std_logic;
    i2c_hybrids_sda  : inout std_logic

  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- signal definition
    --==========================--
    signal enable_i2c             : std_logic := '0';
    -- bus 000 with hybrids
    signal bus_select             : std_logic_vector(2 downto 0) := "000";
    signal cmd                    : std_logic_vector(31 downto 0) := (others => '0');
    signal reply                  : std_logic_vector(31 downto 0) := (others => '0');
    signal execute_strobe         : std_logic := '0';
    -- hybrid_id, addresses are in i2c_hybrid_constants_pack
    signal hybrid_id              : integer range 1 to 16 := 1;
    -- register_address, refer predefined addresses from i2c_hybrid_constants_pack
    signal register_address       : std_logic_vector(7 downto 0) := (others => '0');
    signal data_to_hybrid         : std_logic_vector(7 downto 0) := (others => '0');    
    signal data_from_hybrid       : std_logic_vector(7 downto 0) := (others => '0');
    --==========================--
    
    --==========================--
    -- processor fsm definition
    --==========================--
    type type_processor_fsm_state is (Initial, GetThreshold, ReplyGetThreshold, SetThreshold, ReplySetThreshold, Failed);
    signal processor_fsm_state    : type_processor_fsm_state := Initial;
    --==========================--
    
    --==========================--
    -- i2c fsm definition
    --==========================--
    signal i2c_read               : std_logic := '0';
    signal i2c_write              : std_logic := '0';
    signal i2c_read_loc           : std_logic := '0';
    signal i2c_write_loc          : std_logic := '0';
    -- started to send i2c command
    signal started_sending        : std_logic := '0';
    -- operation failed
    signal operation_failed       : std_logic := '0';
    -- sending done
    signal done                   : std_logic := '0';
    type type_i2c_fsm_state is (Idle, SendRead, PostSendRead, WaitReadReply, SendWrite, PostSendWrite, WaitWriteReply, Failed);
    signal i2c_fsm_state          : type_i2c_fsm_state := Idle;
    --==========================--

begin

    done <= reply(26);

--===================================--
i2c_master: entity work.i2c_master_top
--===================================--
generic map (nbr_of_busses => 1)
port map
(
    clk               => clk,
    reset             => reset,
    ------------------
    id_o              => open, -- read only, bus owner 8 bits
    id_i              => (others => '0'), -- bus owner 8 bits
    enable            => enable_i2c,
    bus_select        => bus_select,
    prescaler         => "1100000000", -- 10 bits
    command           => execute_strobe & cmd(30 downto 0), -- here command (32 bits)
    reply             => reply, --
    ------------------
    scl_io(0)         => i2c_hybrids_scl,            
    sda_io(0)         => i2c_hybrids_sda
);             
--===================================--

PROCESSOR_FSM: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            processor_fsm_state <= Initial;            
        end if;
        case processor_fsm_state is
            when Initial =>
                processor_fsm_state <= GetThreshold;                   
            when GetThreshold =>
                hybrid_id <= 1;
                register_address <= REGISTER_VCth;
                i2c_read <= not i2c_read;
                processor_fsm_state <= ReplyGetThreshold;
            when ReplyGetThreshold =>
                if(i2c_fsm_state = Idle and started_sending = '1') then
                    if(operation_failed = '1') then
                        processor_fsm_state <= Failed;
                    else
                        processor_fsm_state <= SetThreshold;
                    end if;
                end if;
            when SetThreshold =>
                data_to_hybrid <= std_logic_vector(to_unsigned(TO_INTEGER(unsigned(data_from_hybrid)) + 1, 8));
                hybrid_id <= 1;
                register_address <= REGISTER_VCth;
                i2c_write <= not i2c_write;
                processor_fsm_state <= ReplySetThreshold;                
            when ReplySetThreshold =>
                if(i2c_fsm_state = Idle and started_sending = '1') then
                    if(operation_failed = '1') then
                        processor_fsm_state <= Failed;
                    else
                        processor_fsm_state <= Initial;
                    end if;
                end if;
            when Failed =>
                processor_fsm_state <= Initial;
            when others =>
                processor_fsm_state <= Initial;
        end case;                   
    end if;
end process;

I2C_FSM: process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            enable_i2c <= '0';
            i2c_fsm_state <= Idle;
            i2c_read_loc <= i2c_read;
            i2c_write_loc <= i2c_write;
        end if;
        case i2c_fsm_state is
            when Idle =>
                enable_i2c <= '0';
                if i2c_read /= i2c_read_loc then
                    i2c_fsm_state <= SendRead;
                    i2c_read_loc <= i2c_read;
                end if;
                if i2c_write /= i2c_write_loc then
                    i2c_fsm_state <= SendWrite;
                    i2c_write_loc <= i2c_write;
                end if;
            when SendRead =>
                enable_i2c <= '1';
                execute_strobe <= '1';
                started_sending <= '1';
                -- extended mode (2 bytes of data), has to be off for hybrids(0)
                cmd(25) <= '0';
                -- i2c mode with registers
                cmd(24) <= '1';
                -- rw_bit: write = 1, read = 0
                cmd(23) <= '0';
                -- chip address
                cmd(22 downto 16) <= hybrid_address(hybrid_id);
                cmd(15 downto 8) <= register_address;
                i2c_fsm_state <= PostSendRead;
            when PostSendRead =>
                execute_strobe <= '0';
                if(done = '0') then  
                    i2c_fsm_state <= WaitReadReply;
                end if;
            when WaitReadReply =>
                started_sending <= '0';
                if(done = '1') then
                    -- check for errors
                    if(reply(27) = '0') then
                        data_from_hybrid <= reply(7 downto 0);
                        i2c_fsm_state <= Idle;
                    else
                        i2c_fsm_state <= Failed;
                    end if;
                end if;
	        when SendWrite =>
                enable_i2c <= '1';
                execute_strobe <= '1';
                started_sending <= '1';
                -- extended mode (2 bytes of data), has to be off for hybrids(0)
                cmd(25) <= '0';
                -- i2c mode with registers
                cmd(24) <= '1';
                -- rw_bit: write = 1, read = 0
                cmd(23) <= '1';
                -- chip address
                cmd(22 downto 16) <= hybrid_address(hybrid_id);
                cmd(15 downto 8) <= register_address;
                cmd(7 downto 0) <= data_to_hybrid;
                i2c_fsm_state <= PostSendWrite;
            when PostSendWrite =>
                execute_strobe <= '0';
                if(done = '0') then  
                    i2c_fsm_state <= WaitWriteReply;
                end if;
            when WaitWriteReply =>
                started_sending <= '0';
                if(done = '1') then
                    -- check for errors
                    if(reply(27) = '0') then
                        i2c_fsm_state <= Idle;
                    else
                        i2c_fsm_state <= Failed;
                    end if;
                end if;	
            when Failed =>
                operation_failed <= '1';
                i2c_fsm_state <= Idle;
            when others =>
                i2c_fsm_state <= Idle;                
        end case;
    end if;
end process;

end rtl;
