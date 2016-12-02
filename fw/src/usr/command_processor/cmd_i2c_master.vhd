----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2016 10:08:18 AM
-- Design Name: 
-- Module Name: cmd_i2c_master - rtl
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
use work.user_package.all;
use work.system_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmd_i2c_master is
    Generic (
           NUM_HYBRIDS     : integer range 1 to 32 := 1;
           NUM_CHIPS       : integer range 1 to 16 := 1
    );
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start_sending : in STD_LOGIC;
           command_type : in STD_LOGIC_VECTOR (3 downto 0);
           hybrid_id : in STD_LOGIC_VECTOR (4 downto 0);
           chip_id : in STD_LOGIC_VECTOR (3 downto 0);
           read : in STD_LOGIC;
           page : in STD_LOGIC;
           register_address : in STD_LOGIC_VECTOR (7 downto 0);
           write_mask : in STD_LOGIC_VECTOR (7 downto 0);
           data : in STD_LOGIC_VECTOR (7 downto 0);
           chip_data : out array_16x8bit;
           i2c_fsm_status : out STD_LOGIC_VECTOR (3 downto 0);
           error_code : out STD_LOGIC_VECTOR (7 downto 0);
           i2c_request : out cmd_wbus;
           i2c_reply : in cmd_rbus;
           data_ready : out STD_LOGIC;
           data_processed : in std_logic_vector(4 downto 0);
           execution_finished : out std_logic
     );
end cmd_i2c_master;

architecture rtl of cmd_i2c_master is

    type state_type is (Idle, SendCommand, WaitForReply, WaitForProcessed, Finished);
    signal i2c_fsm_state    : state_type := Idle;
    signal start_sending_loc      : std_logic := '0';
    -- when all the commands had been executed
    signal all_done               : std_logic := '0';
        
    -- counters
    signal chip_counter           : integer range 0 to NUM_CHIPS-1 := 0;
    signal hybrid_counter         : integer range 0 to NUM_HYBRIDS-1 := 0;
    
    signal temp_hybrid_id         : std_logic_vector(4 downto 0);    

begin

I2C_FSM: process(reset, clk)
begin
    if reset = '1' then
        i2c_fsm_state <= Idle;
        start_sending_loc <= start_sending;
        
        i2c_fsm_status <= x"1";
        error_code <= x"00";
        data_ready <= '0';
        
        execution_finished <= '0';
        all_done <= '0';
        
        chip_counter <= 0;
        hybrid_counter <= 0;
        
        chip_data <= (others => (others => '0'));
        
        i2c_request.cmd_page <= '0';
        i2c_request.cmd_read <= '0';
        i2c_request.cmd_hybrid_id <= (others => '0');
        i2c_request.cmd_chip_id <= (others => '0');
        i2c_request.cmd_register <= (others => '0');
        i2c_request.cmd_write_mask <= (others => '0');
        i2c_request.cmd_data <= (others => '0');        
        i2c_request.cmd_strobe <= '0'; 
        
    elsif rising_edge(clk) then
    case i2c_fsm_state is
        when Idle =>
            i2c_fsm_status <= x"1";
            execution_finished <= '0';
            if start_sending /= start_sending_loc then
                start_sending_loc <= start_sending;
                
                error_code <= x"00";       
                data_ready <= '0';         

                chip_counter <= 0;
                hybrid_counter <= 0;
                
                chip_data <= (others => (others => '0'));
                all_done <= '0';
                i2c_fsm_state <= SendCommand;
            end if;
        when SendCommand =>
            i2c_fsm_status <= x"2";
            -- setting register value to a certain hybrid,chip
            if command_type = x"1" then
                    if(TO_INTEGER(unsigned(hybrid_id))+1>NUM_HYBRIDS) or (TO_INTEGER(unsigned(chip_id))+1>NUM_CHIPS) then
                        -- wrong hybrid or chip id
                        error_code <= x"23";
                        i2c_fsm_state <= Finished;
                    else
                        i2c_request.cmd_hybrid_id <= hybrid_id;
                        temp_hybrid_id <= hybrid_id;
                        i2c_request.cmd_chip_id <= chip_id;
                        i2c_request.cmd_strobe <= '1';
                        i2c_fsm_state <= WaitForReply;
                    end if; 
            -- setting register value to all chips within a certain hybrid
            elsif command_type = x"2" then                    
                    if TO_INTEGER(unsigned(hybrid_id))+1>NUM_HYBRIDS then
                        -- wrong hybrid or chip id
                        error_code <= x"23";
                        i2c_fsm_state <= Finished;
                    else
                        i2c_request.cmd_hybrid_id <= hybrid_id;
                        temp_hybrid_id <= hybrid_id;
                        i2c_request.cmd_chip_id <= std_logic_vector(to_unsigned(chip_counter, i2c_request.cmd_chip_id 'length));
                        i2c_request.cmd_strobe <= '1';
                        i2c_fsm_state <= WaitForReply; 
                    end if;
            -- setting register value to all chips all Hybrids
            elsif command_type = x"3" then                    
                    i2c_request.cmd_hybrid_id <= std_logic_vector(to_unsigned(hybrid_counter, i2c_request.cmd_hybrid_id 'length));
                    temp_hybrid_id <= std_logic_vector(to_unsigned(hybrid_counter, i2c_request.cmd_hybrid_id 'length));
                    i2c_request.cmd_chip_id <= std_logic_vector(to_unsigned(chip_counter, i2c_request.cmd_chip_id 'length));
                    i2c_request.cmd_strobe <= '1';
                    i2c_fsm_state <= WaitForReply; 
            else
                    -- wrong command
                    if command_type /= x"0" then 
                        error_code <= x"21";
                    end if;
                    i2c_request.cmd_strobe <= '0';
                    i2c_fsm_state <= Finished;                     
            end if;
            i2c_request.cmd_page <= page;
            i2c_request.cmd_read <= read;
            i2c_request.cmd_register <= register_address;
            i2c_request.cmd_write_mask <= write_mask;
            i2c_request.cmd_data <= data;
        when WaitForReply =>
            i2c_fsm_status <= x"3";
            -- will wait for response from phy here
            if i2c_reply.cmd_strobe = '1' then
                i2c_request.cmd_strobe <= '0';
                if i2c_reply.cmd_err = '0' then
                    -- setting register value to a certain hybrid,chip
                    if command_type = x"1" then
                        if read = '1' then 
                            chip_data(TO_INTEGER(unsigned(chip_id))) <= i2c_reply.cmd_data;
                            data_ready <= '1';
                            all_done <= '1';
                            i2c_fsm_state <= WaitForProcessed;
                        else
                            i2c_fsm_state <= Finished;
                        end if;
                    -- setting register value to all chips within a certain hybrid
                    elsif command_type = x"2" then
                        if read = '1' then
                            chip_data(chip_counter) <= i2c_reply.cmd_data;
                        end if;
                        if chip_counter < NUM_CHIPS-1 then
                            chip_counter <= chip_counter + 1;
                            i2c_fsm_state <= SendCommand;
                        else
                            if read = '1' then
                                all_done <= '1';
                                data_ready <= '1';
                                i2c_fsm_state <= WaitForProcessed;
                            else 
                                i2c_fsm_state <= Finished;
                            end if;
                        end if;
                    -- setting register value to all chips all Hybrids
                    elsif command_type = x"3" then
                        if read = '1' then
                            chip_data(chip_counter) <= i2c_reply.cmd_data;
                        end if;
                        if hybrid_counter <= NUM_HYBRIDS-1 and chip_counter < NUM_CHIPS-1 then
                            chip_counter <= chip_counter + 1;
                            i2c_fsm_state <= SendCommand;
                        elsif hybrid_counter < NUM_HYBRIDS-1 then
                            if read = '1' then
                                all_done <= '0';
                                data_ready <= '1';
                                i2c_fsm_state <= WaitForProcessed;
                            else 
                                i2c_fsm_state <= SendCommand;
                            end if;                        
                            chip_counter <= 0;
                            hybrid_counter <= hybrid_counter + 1;
                        else
                            if read = '1' then
                                all_done <= '1';
                                data_ready <= '1';
                                i2c_fsm_state <= WaitForProcessed;
                            else 
                                i2c_fsm_state <= Finished;
                            end if;
                        end if;     
                    else
                        -- status changed during execution
                        error_code <= x"22";
                    end if;
                else
                    -- TODO Here it uses only 4 bits of error code, need to be checked
                    error_code <= x"3" & i2c_reply.cmd_data(3 downto 0);
                    i2c_fsm_state <= Finished;
                end if;
            end if;
        when WaitForProcessed =>
            i2c_fsm_status <= x"4";
            if data_processed = temp_hybrid_id and all_done = '1' then 
                data_ready <= '0';               
                i2c_fsm_state <= Finished;
            elsif data_processed = temp_hybrid_id then
                data_ready <= '0';
                chip_data <= (others => (others => '0'));
                i2c_fsm_state <= SendCommand;
            end if;
        when Finished =>
            i2c_fsm_status <= x"5";
            execution_finished <= '1';
            -- execution finished
            i2c_fsm_state <= Idle;
        when others =>
            i2c_fsm_status <= x"f";
            -- fsm in a wrong state
            error_code <= x"2f";
            i2c_fsm_state <= Idle;
    end case;
    end if;
end process;

end rtl;
