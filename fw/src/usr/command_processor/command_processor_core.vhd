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
    NUM_HYBRIDS     : integer := 1;
    NUM_CHIPS       : integer := 1
  );
  Port ( 
    clk             : in std_logic;
    reset           : in std_logic;    
    -- command from IpBus
    command_in      : in std_logic_vector(31 downto 0);
    -- output command
    i2c_request     : out cmd_wbus;
    i2c_reply	    : in cmd_rbus;
    -- status back using IpBus
    status_out      : out std_logic_vector(31 downto 0)
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- signal definition
    --==========================--
    -- previous command
    signal command_in_prev        : std_logic_vector(31 downto 0) := (others => '0');
    -- command type
    signal command_type           : std_logic_vector(4 downto 0) := (others => '0');
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
    signal data_to_hybrid         : std_logic_vector(7 downto 0) := (others => '0');    
    --==========================--
    
    --==========================--
    -- processor fsm definition
    --==========================--
    type state_type is (Idle, SendCommand, WaitForResponse, SetStatus);
    signal processor_fsm_state    : state_type := Idle;
    signal start_sending          : std_logic := '0';
    signal start_sending_loc      : std_logic := '0';

    --==========================--
    
    -- counters
    signal chip_counter           : std_logic_vector(3 downto 0) := (others => '0');
    signal hybrid_counter         : std_logic_vector(4 downto 0) := (others => '0');
        
    -- statuses
    signal status_command         : std_logic_vector(3 downto 0) := x"0";
    signal status_error           : std_logic_vector(3 downto 0) := x"0";  
    signal status_fsm             : std_logic_vector(3 downto 0) := x"0";    
    
begin    
    
    -- statuses
    status_out(31 downto 28) <= status_command;
    status_out(27 downto 24) <= status_error;
    status_out(23 downto 20) <= status_fsm;
    status_out(19 downto 0) <= (others => '0');
        
process(reset, clk)
begin
    if reset = '1' then
        command_in_prev <= command_in;
        
    elsif rising_edge(clk) then
        if command_in /= command_in_prev then
            command_in_prev <= command_in;
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
        status_error <= x"0";
        status_fsm <= x"0";
        
        command_type    <= (others => '0');
        hybrid_id       <= (others => '0');
        chip_id         <= (others => '0');
        read            <= '0';
        page            <= '0';
        register_address <= (others => '0');
        data_to_hybrid  <= (others => '0');
        
        i2c_request.cmd_page <= '0';
        i2c_request.cmd_read <= '0';
        i2c_request.cmd_hybrid_id <= (others => '0');
        i2c_request.cmd_chip_id <= (others => '0');
        i2c_request.cmd_register <= (others => '0');
        i2c_request.cmd_data <= (others => '0');        
        i2c_request.cmd_strobe <= '0'; 
        
    elsif rising_edge(clk) then
    case processor_fsm_state is
        when Idle =>
            status_fsm <= x"1";
            if start_sending /= start_sending_loc then
                start_sending_loc <= start_sending;
                
                status_error <= x"0";                
                chip_counter <= (others => '0');
                hybrid_counter <= (others => '0');
                
                command_type    <= command_in(31 downto 27);
                hybrid_id       <= command_in(26 downto 22);
                chip_id         <= command_in(21 downto 18);
                read            <= command_in(17);
                page            <= command_in(16);
                register_address <= command_in(15 downto 8);
                data_to_hybrid  <= command_in(7 downto 0);
                
                processor_fsm_state <= SendCommand;
            end if;
        when SendCommand =>
            status_fsm <= x"2";
            -- setting register value to a certain hybrid,chip
            if command_type = "00001" then
                    status_command <= x"1";
                    i2c_request.cmd_hybrid_id <= hybrid_id;
                    i2c_request.cmd_chip_id <= chip_id;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            -- setting register value to all chips within a certain hybrid
            elsif command_type = "00010" then                    
                    status_command <= x"2";
                    i2c_request.cmd_hybrid_id <= hybrid_id;
                    i2c_request.cmd_chip_id <= chip_counter;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            -- setting register value to all chips all Hybrids
            elsif command_type = "00011" then                    
                    status_command <= x"3";
                    i2c_request.cmd_hybrid_id <= hybrid_counter;
                    i2c_request.cmd_chip_id <= chip_counter;
                    i2c_request.cmd_strobe <= '1';
                    processor_fsm_state <= WaitForResponse; 
            else
                    status_command <= x"0";
                    -- wrong command
                    status_error <= x"1";
                    i2c_request.cmd_strobe <= '0';
                    processor_fsm_state <= SetStatus;                     
            end if;
            i2c_request.cmd_page <= page;
            i2c_request.cmd_read <= read;
            i2c_request.cmd_register <= register_address;
            i2c_request.cmd_data <= data_to_hybrid;
        when WaitForResponse =>
            status_fsm <= x"3";
            i2c_request.cmd_strobe <= '0';
            -- will wait for response from module here
            --if i2c_reply.cmd_strobe <= '1' then
                -- setting register value to a certain hybrid,chip
                if command_type = "00001" then
                    processor_fsm_state <= SetStatus;
                -- setting register value to all chips within a certain hybrid
                elsif command_type = "00010" then
                    if chip_counter < std_logic_vector(to_unsigned(NUM_CHIPS, chip_counter'length)) then
                        chip_counter <= chip_counter + 1;
                        processor_fsm_state <= SendCommand;
                    else
                        processor_fsm_state <= SetStatus;        
                    end if;
                -- setting register value to all chips all Hybrids
                elsif command_type = "00011" then
                    if hybrid_counter < std_logic_vector(to_unsigned(NUM_HYBRIDS, hybrid_counter'length)) and chip_counter < std_logic_vector(to_unsigned(NUM_CHIPS, chip_counter'length)) then
                        chip_counter <= chip_counter + 1;
                        processor_fsm_state <= SendCommand;
                    elsif hybrid_counter < std_logic_vector(to_unsigned(NUM_HYBRIDS-1, hybrid_counter'length)) then                        
                        chip_counter <= (others => '0');
                        hybrid_counter <= hybrid_counter + 1;
                        processor_fsm_state <= SendCommand;
                    else
                        processor_fsm_state <= SetStatus;
                    end if;     
                else
                    -- status changed during execution
                    status_error <= x"2";
                    processor_fsm_state <= SetStatus;                    
                end if;
            --end if;
        when SetStatus =>
            status_fsm <= x"4";
            -- execution finished
            status_command(3) <= '1';
            processor_fsm_state <= Idle;
        when others =>
            status_fsm <= x"5";
            -- fsm in a wrong state
            status_error <= x"f";
            processor_fsm_state <= Idle;
    end case;
    end if;
end process;

end rtl;
