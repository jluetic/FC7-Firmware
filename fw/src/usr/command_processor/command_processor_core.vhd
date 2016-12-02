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
use work.system_package.all;
use work.user_package.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity command_processor_core is
  Generic (
    NUM_HYBRIDS     : integer range 1 to 32 := 1;
    NUM_CHIPS       : integer range 1 to 16 := 1
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
    status_data     : out array_4x32bit
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- command processing signals
    --==========================--
    signal command_from_ipbus      : std_logic_vector(3 downto 0) := (others => '0');
    signal command_from_ipbus_loc      : std_logic_vector(3 downto 0) := (others => '0');
    type command_type is (None, I2C, Fast, Unknown);
    signal ipbus_command_type     : command_type;
    signal ipbus_command_type_loc : command_type := None;    
    
    --==========================--
    -- i2c signal definition
    --==========================--
    -- command type
    signal i2c_command            : std_logic_vector(3 downto 0) := (others => '0');
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
    signal data_to_chip           : std_logic_vector(7 downto 0) := (others => '0');
    -- data from chips
    signal chip_data              : array_16x8bit := (others => (others => '0'));
    -- i2c fsm status
    signal i2c_fsm_status         : std_logic_vector(3 downto 0) := (others => '0');
    -- i2c fsm status
    signal i2c_fsm_error          : std_logic_vector(7 downto 0) := (others => '0');
    signal i2c_execution_finished : std_logic;
    --==========================--
    
    --==========================--
    -- processor fsm definition
    --==========================--
    type state_type is (Idle, SendCommand, WaitForFinished);
    signal processor_fsm_state    : state_type := Idle;
    signal processor_fsm_error         : std_logic_vector(7 downto 0) := (others => '0');
    signal start_sending_i2c          : std_logic := '0';
    --==========================--
    
    --==========================--    
    -- statuses
    --==========================--
    signal status_last_command    : std_logic_vector(3 downto 0) := x"0";
    signal status_processor_fsm   : std_logic_vector(3 downto 0) := x"0";
    signal status_error_block_id  : std_logic_vector(3 downto 0) := x"0";
    signal status_error_code      : std_logic_vector(7 downto 0) := x"00";
    signal status_data_ready      : std_logic := '0'; 
    --==========================--   
    
begin

    command_from_ipbus <= command_in(0)(31 downto 28);
    
    with command_from_ipbus select ipbus_command_type <=
        None    when x"0",
        I2C     when x"1",
        I2C     when x"2",
        I2C     when x"3",
        Unknown when x"4",
        Unknown when x"6",
        Unknown when x"7",
        Unknown when x"8",
        Fast    when x"9",
        Unknown when x"A",
        Unknown when x"B",
        Unknown when x"C",
        Unknown when x"D",
        Unknown when x"E",
        Unknown when x"F",
        Unknown when others;
   
    --===================================--
    -- Block responsible for I2C Command Sending
    --===================================--
    i2c_master: entity work.cmd_i2c_master
    --===================================--
    generic map
    (
       NUM_HYBRIDS => NUM_HYBRIDS,
       NUM_CHIPS   => NUM_CHIPS
    )
    port map
    (
       clk              => clk,
       reset            => reset,
       start_sending    => start_sending_i2c,
       command_type     => i2c_command,
       hybrid_id        => hybrid_id,
       chip_id          => chip_id,
       read             => read,
       page             => page,
       register_address => register_address,
       write_mask       => write_mask,
       data             => data_to_chip,
       chip_data        => chip_data,
       i2c_fsm_status   => i2c_fsm_status,
       error_code       => i2c_fsm_error,
       i2c_request      => i2c_request,
       i2c_reply        => i2c_reply,
       data_ready       => status_data_ready,
       data_processed   => command_in(0)(15 downto 11),
       execution_finished => i2c_execution_finished
    );        
    --===================================--
        
    -- statuses
    status_out(31 downto 28) <= status_last_command;
    status_out(27 downto 24) <= status_processor_fsm;
    status_out(23 downto 20) <= status_error_block_id;
    status_out(19 downto 12) <= status_error_code;
    status_out(11)           <= status_data_ready;
    status_out(10 downto 0)  <= (others => '0');
    
    -- multiple read-out
    GENERATE_OUT_DATA: for reg_id in 0 to 3 generate
        status_data(reg_id)(7 downto 0) <= chip_data(reg_id*4);
        status_data(reg_id)(15 downto 8) <= chip_data(reg_id*4+1);
        status_data(reg_id)(23 downto 16) <= chip_data(reg_id*4+2);
        status_data(reg_id)(31 downto 24) <= chip_data(reg_id*4+3);
    end generate;   

PROCESSOR_FSM: process(reset, clk)
begin
    if reset = '1' then
        command_from_ipbus_loc <= command_from_ipbus;
        ipbus_command_type_loc <= ipbus_command_type;
        
        processor_fsm_error <= x"00";
        processor_fsm_state <= Idle;        
        status_processor_fsm <= x"1";

        -- i2c resetter               
        i2c_command         <= (others => '0');
        hybrid_id           <= (others => '0');
        chip_id             <= (others => '0');
        read                <= '0';
        page                <= '0';
        register_address    <= (others => '0');
        write_mask          <= (others => '0');
        data_to_chip        <= (others => '0');   
        
    elsif rising_edge(clk) then
    case processor_fsm_state is
        when Idle =>
            status_processor_fsm <= x"1";
            if command_from_ipbus /= command_from_ipbus_loc then
                processor_fsm_error <= x"00";
                status_last_command <= command_from_ipbus;
                command_from_ipbus_loc <= command_from_ipbus;
                ipbus_command_type_loc <= ipbus_command_type;
                if ipbus_command_type = I2C then
                    i2c_command     <= command_from_ipbus;
                    hybrid_id       <= command_in(0)(10 downto 6);
                    chip_id         <= command_in(0)(5 downto 2);
                    read            <= command_in(0)(1);
                    page            <= command_in(0)(0);
                    register_address<= command_in(1)(23 downto 16);
                    write_mask      <= command_in(1)(15 downto 8);
                    data_to_chip    <= command_in(1)(7 downto 0);
                end if;
                processor_fsm_state <= SendCommand;
            end if;  
        when SendCommand =>
            status_processor_fsm <= x"2";
            case ipbus_command_type_loc is
                when None =>
                    processor_fsm_state <= Idle;
                when Unknown =>
                    -- unknown command
                    processor_fsm_error <= x"11";
                    processor_fsm_state <= Idle;
                when I2C =>
                    -- wait for previous command to be finished
                    if i2c_fsm_status = x"1" and i2c_execution_finished = '0' then
                        start_sending_i2c <= not start_sending_i2c;
                        processor_fsm_state <= WaitForFinished;
                    end if;
                when others =>
                    -- case statement exeception
                    processor_fsm_error <= x"1e";
                    processor_fsm_state <= Idle;
            end case;
        when WaitForFinished =>
            status_processor_fsm <= x"3";
            case ipbus_command_type_loc is
                when I2C =>
                    if i2c_execution_finished = '1' then
                        -- will be zero if no error
                        processor_fsm_error <= i2c_fsm_error;
                        processor_fsm_state <= Idle;
                    end if;
                when others =>
                    -- case statement exeception
                    processor_fsm_error <= x"1e";
                    processor_fsm_state <= Idle;
            end case;                 
        when others =>
            -- wring fsm state
            processor_fsm_error <= x"1f";
            processor_fsm_state <= Idle;        
    end case;
    end if;
end process;

ERROR_HANDLER: process(reset, clk)
begin
    if reset = '1' then
       status_error_block_id <= x"0";
       status_error_code <= x"00"; 
    elsif rising_edge(clk) then
        if processor_fsm_error /= x"00" then
            status_error_block_id <= x"1";
            status_error_code <= processor_fsm_error;
        else
            status_error_block_id <= x"0";
            status_error_code <= x"00";  
        end if;    
    end if;
end process;

end rtl;
