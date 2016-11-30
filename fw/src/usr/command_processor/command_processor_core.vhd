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
use work.cmdbus.all;
use work.system_package.all;
use work.user_package.all;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity command_processor_core is
  Generic (
    NUM_HYBRIDS     : natural := 1;
    NUM_CHIPS       : natural := 1
  );
  Port ( 
    clk             : in std_logic;
    reset           : in std_logic;    
    -- command from IpBus
    command_in      : in array_2x32bit;
    -- output command
    i2c_request     : out cmd_wbus;
    i2c_reply	    : in cmd_rbus;
    -- status back using IpBus
    status_out      : out std_logic_vector(31 downto 0);
    -- 8 chips data back
    status_data     : out array_2x32bit
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- signal definition
    --==========================--
    -- previous command
    signal command_in_prev_0      : std_logic_vector(31 downto 0) := (others => '0');
    signal command_in_prev_1      : std_logic_vector(31 downto 0) := (others => '0');
    -- command type
    signal command_type           : std_logic_vector(3 downto 0) := (others => '0');
    -- hybrid_id
    signal hybrid_id              : std_logic_vector(4 downto 0) := (others => '0');
    -- cbc on hybrid id
    signal chip_id                : std_logic_vector(3 downto 0) := (others => '0');
    -- page in the CBC
    signal page                   : std_logic := '0';
    -- read or write setting
    signal read                   : std_logic := '0';
    -- register_address
    signal register_address       : std_logic_vector(7 downto 0) := (others => '0');
    -- write mask
    signal write_mask             : std_logic_vector(7 downto 0) := (others => '0');
    signal data_to_hybrid         : std_logic_vector(7 downto 0) := (others => '0');
    -- when data was taken back by IPBus
    signal status_data_processed  : std_logic;    
    --==========================--
    
    --==========================--
    -- processor fsm definition
    --==========================--
    type state_type is (Idle, SendCommand, WaitForResponse, WaitForProcessed, Finished);
    signal processor_fsm_state    : state_type := Idle;
    signal start_sending          : std_logic := '0';
    signal start_sending_loc      : std_logic := '0';
    -- when all the commands had been executed
    signal all_done               : std_logic := '0';
    --==========================--
    
    -- multiple read-out
    signal chip_data              : array_8x8bit := (others => (others => '0'));
    
    -- counters
    signal chip_counter           : std_logic_vector(3 downto 0) := (others => '0');
    signal hybrid_counter         : std_logic_vector(4 downto 0) := (others => '0');
        
    -- statuses
    signal status_command         : std_logic_vector(3 downto 0) := x"0";
    signal status_fsm             : std_logic_vector(3 downto 0) := x"0";
    signal status_error           : std_logic_vector(7 downto 0) := x"00";
    signal status_data_ready      : std_logic := '0';    
    
begin

    -- data processed signal
    status_data_processed <= command_in(0)(11);     
    
    -- statuses
    status_out(31 downto 28) <= status_command;
    status_out(27 downto 24) <= status_fsm;
    status_out(23 downto 16) <= status_error;
    status_out(15)           <= status_data_ready;
    status_out(14 downto 0)  <= (others => '0');
    
    -- multiple read-out
    status_data(0)(7 downto 0) <= chip_data(0);
    status_data(0)(15 downto 8) <= chip_data(1);
    status_data(0)(23 downto 16) <= chip_data(2);
    status_data(0)(31 downto 24) <= chip_data(3);
    status_data(1)(7 downto 0) <= chip_data(4);
    status_data(1)(15 downto 8) <= chip_data(5);
    status_data(1)(23 downto 16) <= chip_data(6);
    status_data(1)(31 downto 24) <= chip_data(7);    
        
process(reset, clk)
begin
    if reset = '1' then
        command_in_prev_0 <= command_in(0);
        command_in_prev_1 <= command_in(1);
        
    elsif rising_edge(clk) then
        if command_in(0) /= command_in_prev_0 and command_in(1) /= command_in_prev_1 then
            command_in_prev_0 <= command_in(0);
            command_in_prev_1 <= command_in(1);
            if processor_fsm_state = Idle then            
                start_sending <= not start_sending;
            end if;
        end if;
    end if;
end process;

PROCESSOR_FSM: process(reset, clk)
begin
    if reset = '1' then
        processor_fsm_state <= Idle;
        start_sending_loc <= start_sending;
        
        status_command <= x"0";
        status_fsm <= x"0";
        status_error <= x"00";
        status_data_ready <= '0';
        
        all_done <= '0';
        
        chip_data <= (others => (others => '0'));
        
        command_type    <= (others => '0');
        hybrid_id       <= (others => '0');
        chip_id         <= (others => '0');
        read            <= '0';
        page            <= '0';
        register_address <= (others => '0');
        write_mask <= (others => '0');
        data_to_hybrid  <= (others => '0');
        
        i2c_request.cmd_page <= '0';
        i2c_request.cmd_read <= '0';
        i2c_request.cmd_hybrid_id <= (others => '0');
        i2c_request.cmd_chip_id <= (others => '0');
        i2c_request.cmd_register <= (others => '0');
        i2c_request.cmd_write_mask <= (others => '0');
        i2c_request.cmd_data <= (others => '0');        
        i2c_request.cmd_strobe <= '0'; 
        
    elsif rising_edge(clk) then
    case processor_fsm_state is
        when Idle =>
            status_fsm <= x"1";
            if start_sending /= start_sending_loc then
                start_sending_loc <= start_sending;
                
                status_error <= x"00";       
                status_data_ready <= '0';         
                chip_counter <= (others => '0');
                hybrid_counter <= (others => '0');
                
                command_type    <= command_in(0)(31 downto 28);
                hybrid_id       <= command_in(0)(10 downto 6);
                chip_id         <= command_in(0)(5 downto 2);
                read            <= command_in(0)(1);
                page            <= command_in(0)(0);
                register_address <= command_in(1)(23 downto 16);
                write_mask      <= command_in(1)(15 downto 8);
                data_to_hybrid  <= command_in(1)(7 downto 0);
                
                chip_data <= (others => (others => '0'));
                all_done <= '0';
                processor_fsm_state <= SendCommand;
            end if;
        when SendCommand =>
            status_fsm <= x"2";
            -- setting register value to a certain hybrid,chip
            if command_type = x"1" then
                    status_command <= x"1";
                    i2c_request.cmd_hybrid_id <= hybrid_id;
                    i2c_request.cmd_chip_id <= chip_id;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            -- setting register value to all chips within a certain hybrid
            elsif command_type = x"2" then                    
                    status_command <= x"2";
                    i2c_request.cmd_hybrid_id <= hybrid_id;
                    i2c_request.cmd_chip_id <= chip_counter;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            -- setting register value to all chips all Hybrids
            elsif command_type = x"3" then                    
                    status_command <= x"3";
                    i2c_request.cmd_hybrid_id <= hybrid_counter;
                    i2c_request.cmd_chip_id <= chip_counter;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            else
                    status_command <= x"0";
                    -- wrong command
                    status_error <= x"11";
                    i2c_request.cmd_strobe <= '0';
                    processor_fsm_state <= Finished;                     
            end if;
            i2c_request.cmd_page <= page;
            i2c_request.cmd_read <= read;
            i2c_request.cmd_register <= register_address;
            i2c_request.cmd_write_mask <= write_mask;
            i2c_request.cmd_data <= data_to_hybrid;
        when WaitForResponse =>
            status_fsm <= x"3";
            -- will wait for response from phy here
            if i2c_reply.cmd_strobe = '1' then
                i2c_request.cmd_strobe <= '0';
                if i2c_reply.cmd_err = '0' then
                    -- setting register value to a certain hybrid,chip
                    if command_type = x"1" then
                        if read = '1' then 
                            chip_data(0) <= i2c_reply.cmd_data;
                            status_data_ready <= '1';
                            all_done <= '1';
                            processor_fsm_state <= WaitForProcessed;
                        else
                            processor_fsm_state <= Finished;
                        end if;
                    -- setting register value to all chips within a certain hybrid
                    elsif command_type = x"2" then
                        if read = '1' then
                            chip_data(to_integer(unsigned(chip_counter))) <= i2c_reply.cmd_data;
                        end if;
                        if chip_counter < std_logic_vector(to_unsigned(NUM_CHIPS-1, chip_counter'length)) then
                            chip_counter <= chip_counter + 1;
                            processor_fsm_state <= SendCommand;
                        else
                            if read = '1' then
                                all_done <= '1';
                                status_data_ready <= '1';
                                processor_fsm_state <= WaitForProcessed;
                            else 
                                processor_fsm_state <= Finished;
                            end if;
                        end if;
                    -- setting register value to all chips all Hybrids
                    elsif command_type = x"3" then
                        if read = '1' then
                            chip_data(to_integer(unsigned(chip_counter))) <= i2c_reply.cmd_data;
                        end if;
                        if hybrid_counter < std_logic_vector(to_unsigned(NUM_HYBRIDS, hybrid_counter'length)) and chip_counter < std_logic_vector(to_unsigned(NUM_CHIPS-1, chip_counter'length)) then
                            chip_counter <= chip_counter + 1;
                            processor_fsm_state <= SendCommand;
                        elsif hybrid_counter < std_logic_vector(to_unsigned(NUM_HYBRIDS-1, hybrid_counter'length)) then
                            if read = '1' then
                                all_done <= '0';
                                status_data_ready <= '1';
                                processor_fsm_state <= WaitForProcessed;
                            else 
                                processor_fsm_state <= SendCommand;
                            end if;                        
                            chip_counter <= (others => '0');
                            hybrid_counter <= hybrid_counter + 1;
                        else
                            if read = '1' then
                                all_done <= '1';
                                status_data_ready <= '1';
                                processor_fsm_state <= WaitForProcessed;
                            else 
                                processor_fsm_state <= Finished;
                            end if;
                        end if;     
                    else
                        -- status changed during execution
                        status_error <= x"12";
                    end if;
                else
                    status_error <= i2c_reply.cmd_data;
                    processor_fsm_state <= Finished;
                end if;
            end if;
        when WaitForProcessed =>
            status_fsm <= x"4";
            if status_data_processed = '1' and all_done = '1' then 
                status_data_ready <= '0';               
                processor_fsm_state <= Finished;
            elsif status_data_processed = '1' then
                status_data_ready <= '0';
                chip_data <= (others => (others => '0'));
                processor_fsm_state <= SendCommand;
            end if;
        when Finished =>
            status_fsm <= x"5";
            -- execution finished
            processor_fsm_state <= Idle;
        when others =>
            status_fsm <= x"f";
            -- fsm in a wrong state
            status_error <= x"1f";
            processor_fsm_state <= Idle;
    end case;
    end if;
end process;

end rtl;
