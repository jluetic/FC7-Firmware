----------------------------------------------------------------------------------
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic 
-- Create Date: 11/22/2016 03:23:38 PM
-- Description: muxdemux to select which hybrid is concerned for slow control
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;


entity slow_control_muxdemux is
    port (
        clk            : in std_logic;
        reset_i        : in std_logic;
        cmd_request_i  : in cmd_wbus;
        cmd_request_o  : out cmd_wbus_array(0 to NUM_HYBRIDS-1);
        cmd_reply_i    : in cmd_rbus_array(0 to NUM_HYBRIDS-1);
        cmd_reply_o    : out cmd_rbus
    );
end slow_control_muxdemux;

architecture Behavioral of slow_control_muxdemux is

    type state_t is (IDLE, ACK);
    signal state : state_t := IDLE;
    --signal timeout: unsigned(31 downto 0) := (others => '0');
    signal timeout : integer range 0 to 200_000;
    constant SC_TIMEOUT         : integer := 200_000;
    constant SC_TIMEOUT_ERROR : std_logic_vector(7 downto 0) := x"EE";

begin
    process(clk)
        variable sel : natural range 0 to NUM_HYBRIDS-1;
    begin
        if (rising_edge(clk)) then
            if (reset_i = '1') then
                -- reset all output requests, reply, counter, state and sel
                cmd_request_o <= (others => (cmd_strobe => '0', cmd_hybrid_id => (others => '0'), cmd_chip_id => (others => '0'), cmd_page => '0', cmd_read => '0', cmd_register => (others => '0'), cmd_data => (others => '0'), cmd_write_mask => (others => '0')));
                cmd_reply_o <= (cmd_strobe => '0', cmd_data => (others => '0'), cmd_err => '0');
                --timeout <= (others => '0');
                timeout <= 0;
                state <= IDLE;
                sel := 0;

            else
                case state is
                    -- Wait for a strobe from command processor
                    when IDLE =>
                        -- reset all output requests
                        cmd_request_o <= (others => (cmd_strobe => '0', cmd_hybrid_id => (others => '0'), cmd_chip_id => (others => '0'), cmd_page => '0', cmd_read => '0', cmd_register => (others => '0'), cmd_data => (others => '0'), cmd_write_mask => (others => '0')));
                        cmd_reply_o <= (cmd_strobe => '0', cmd_data => (others => '0'), cmd_err => '0');
                        -- When strobe detected
                        if (cmd_request_i.cmd_strobe = '1') then
                            -- Set timeout
                            --timeout <= to_unsigned(SC_TIMEOUT - 4, 32);
                            timeout <= SC_TIMEOUT;
                            -- Get hybrid number from addr
                            sel := to_integer(unsigned(cmd_request_i.cmd_hybrid_id));
                            -- Forward request to selected bus
                            cmd_request_o(sel) <= cmd_request_i;
                            -- Go to ACK state
                            state <= ACK;
                        end if;
                        
                    -- Wait for acknoledgment 
                    when ACK =>
                        -- reset output strobe
                        cmd_request_o(sel).cmd_strobe <= '0';
                        -- when timeout is reached
                        if (timeout = 0) then
                            -- send SC_TIMEOUT_ERROR with err bit high
                            cmd_reply_o <= (cmd_strobe => '1', cmd_data => SC_TIMEOUT_ERROR, cmd_err => '1');
                            -- Go to IDLE state
                            state <= IDLE;
                        else
                            -- Decrement timeout
                            timeout <= timeout - 1;
                            -- When acknoledge received, forward the reply to command processor
                            if (cmd_reply_i(sel).cmd_strobe = '1') then
                                cmd_reply_o <= cmd_reply_i(sel);
                                -- and go to IDLE state
                                state <= IDLE;
                            end if; -- end ack received condition
                        end if; -- end timeout = 0 condition
                end case; -- end case state
            end if; -- end reset condition
        end if; -- end rising_edge(clk) condition
    end process;
end Behavioral;
