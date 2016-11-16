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
    -- command from IpBus
    command_in      : in std_logic_vector(31 downto 0);
    -- should be output command register
    command_out     : out std_logic_vector(31 downto 0);
    -- status back using IpBus
    status_out      : out std_logic_vector(31 downto 0)
  );
end command_processor_core;

architecture rtl of command_processor_core is

    --==========================--
    -- signal definition
    --==========================--
    -- command type
    signal command_type           : std_logic_vector(5 downto 0);
    -- hybrid_id
    signal hybrid_id              : std_logic_vector(5 downto 0);
    -- cbc on hybrid id
    signal cbc_id                 : std_logic_vector(3 downto 0);
    -- register_address
    signal register_address       : std_logic_vector(7 downto 0);
    signal data_to_hybrid         : std_logic_vector(7 downto 0);    
    --==========================--
    
    --==========================--
    -- processor fsm definition
    --==========================--
    type type_processor_fsm_state is (Idle, SendCommand, WaitForResponse, SetStatus);
    signal processor_fsm_state    : type_processor_fsm_state := Idle;
    signal start_sending          : std_logic := '0';
    signal start_sending_loc      : std_logic := '0';
    --==========================--
    
    -- statuses
    signal status_command         : std_logic_vector(3 downto 0) := x"0";
    signal status_error           : std_logic_vector(3 downto 0) := x"0";   
    
begin

    command_type    <= command_in(31 downto 26);
    hybrid_id       <= command_in(25 downto 20);
    cbc_id          <= command_in(19 downto 16);
    register_address <= command_in(15 downto 8);
    data_to_hybrid  <= command_in(7 downto 0);
    
    -- statuses
    status_out(31 downto 28) <= status_command;
    status_out(27 downto 24) <= status_error;
    status_out(23 downto 0) <= (others => '0');
        
process(command_in)
begin
    if processor_fsm_state = Idle then
        start_sending <= not start_sending;
    else
        status_error <= x"d";
    end if;
end process;

PROCESSOR_FSM: process(clk)
begin
    if rising_edge(clk) then
    case processor_fsm_state is
        when Idle =>
            if start_sending /= start_sending_loc then
                start_sending_loc <= start_sending;
                processor_fsm_state <= SendCommand;
            end if;
        when SendCommand =>
            -- will send command to hybrids here
            case command_type is
                -- setting register value to a certain hybrid,cbc
                when "000001" =>
                    status_command <= x"1";
                -- setting register value to all CBCs within a certain hybrid
                when "000010" =>
                    status_command <= x"2";
                -- setting register value to all CBCs all Hybrids
                when "000011" =>
                    status_command <= x"3";
                when others =>
                    status_command <= x"f";                    
            end case;
            processor_fsm_state <= WaitForResponse; 
        when WaitForResponse =>
            -- will wait for response from module here
            processor_fsm_state <= SetStatus;
        when SetStatus =>
            processor_fsm_state <= Idle;
        when others =>
            processor_fsm_state <= Idle;
    end case;
    end if;
end process;

end rtl;
