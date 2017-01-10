----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 12/02/2016 10:08:18 AM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.user_package.all;
use work.system_package.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
           i2c_mask : in STD_LOGIC_VECTOR (7 downto 0);
           command_fifo_empty_i : in STD_LOGIC;
           command_fifo_read_next_o : out STD_LOGIC;
           command_fifo_data_i : in STD_LOGIC_VECTOR (31 downto 0);
           reply_fifo_we_o : out STD_LOGIC;
           reply_fifo_data_o : out STD_LOGIC_VECTOR (31 downto 0);
           i2c_fsm_status : out STD_LOGIC_VECTOR (3 downto 0);
           error_code : out STD_LOGIC_VECTOR (7 downto 0);
           i2c_request : out cmd_wbus;
           i2c_reply : in cmd_rbus
     );
end cmd_i2c_master;

architecture rtl of cmd_i2c_master is

    --==========================--
    -- i2c signal definition
    --==========================--
    -- command type
    signal command_type           : std_logic_vector(3 downto 0) := (others => '0');
    -- hybrid_id
    signal hybrid_id              : std_logic_vector(3 downto 0) := (others => '0');
    -- cbc on hybrid id
    signal chip_id                : std_logic_vector(3 downto 0) := (others => '0');
    -- use mask
    signal use_mask               : std_logic := '0';
    -- page in the CBC
    signal page                   : std_logic := '0';
    -- read or write setting
    signal read                   : std_logic := '0';
    -- register_address
    signal register_address       : std_logic_vector(7 downto 0) := (others => '0');
    signal data_to_chip           : std_logic_vector(7 downto 0) := (others => '0');
    --==========================--
    
    
    type state_type is (Idle, SetCommand, SendCommand, WaitForReply, WriteFifo, Finished);
    signal i2c_fsm_state    : state_type := Idle;
    signal start_sending_loc      : std_logic := '0';
    
    -- counters
    signal chip_counter           : integer range 0 to NUM_CHIPS := 0;
    signal hybrid_counter         : integer range 0 to NUM_HYBRIDS := 0;
    
    -- write counter, to ensure that fifo is written
    signal write_counter          : std_logic_vector(1 downto 0) := "00";
        
begin

I2C_FSM: process(reset, clk)
begin
    if reset = '1' then
        i2c_fsm_state <= Idle;
        
        i2c_fsm_status <= x"1";
        error_code <= x"00";
        
        command_fifo_read_next_o <= '0';
        
        reply_fifo_we_o <= '0';
        reply_fifo_data_o <= (others => '0');
                
        chip_counter <= 0;
        hybrid_counter <= 0;
                
        i2c_request.cmd_page <= '0';
        i2c_request.cmd_read <= '0';
        i2c_request.cmd_hybrid_id <= (others => '0');
        i2c_request.cmd_chip_id <= (others => '0');
        i2c_request.cmd_register <= (others => '0');
        i2c_request.cmd_write_mask <= (others => '1');
        i2c_request.cmd_data <= (others => '0');        
        i2c_request.cmd_strobe <= '0'; 
                
    elsif rising_edge(clk) then
    case i2c_fsm_state is
        when Idle =>        
            i2c_fsm_status <= x"1";                   
                        
            if command_fifo_empty_i = '0' then                
                i2c_fsm_state <= SetCommand;
            end if;
            
        when SetCommand =>
            i2c_fsm_status <= x"2";      
                    
            error_code <= x"00";
            chip_counter <= 0;
            hybrid_counter <= 0;
            
            command_type <= command_fifo_data_i(31 downto 28);
            hybrid_id <= command_fifo_data_i(27 downto 24);
            chip_id <= command_fifo_data_i(23 downto 20);
            use_mask <= command_fifo_data_i(18);
            page <= command_fifo_data_i(17);
            read <= command_fifo_data_i(16);
            register_address <= command_fifo_data_i(15 downto 8);
            data_to_chip <= command_fifo_data_i(7 downto 0);
            
            command_fifo_read_next_o <= '1';            
            i2c_fsm_state <= SendCommand;
            
        when SendCommand =>
            i2c_fsm_status <= x"3";
 
            write_counter <= "00";
            -- setting register value to a certain hybrid,chip
            if command_type = x"0" then
                    if(TO_INTEGER(unsigned(hybrid_id))+1>NUM_HYBRIDS) or (TO_INTEGER(unsigned(chip_id))+1>NUM_CHIPS) then
                        -- wrong hybrid or chip id
                        error_code <= x"23";
                        i2c_fsm_state <= Finished;
                    else
                        i2c_request.cmd_hybrid_id <= hybrid_id;
                        i2c_request.cmd_chip_id <= chip_id;
                        i2c_request.cmd_strobe <= '1';
                        i2c_fsm_state <= WaitForReply;
                    end if; 
            -- setting register value to all chips within a certain hybrid
            elsif command_type = x"1" then                    
                    if TO_INTEGER(unsigned(hybrid_id))+1>NUM_HYBRIDS or chip_counter+1>NUM_CHIPS then
                        -- wrong hybrid or chip id
                        error_code <= x"23";
                        i2c_fsm_state <= Finished;
                    else
                        i2c_request.cmd_hybrid_id <= hybrid_id;
                        i2c_request.cmd_chip_id <= std_logic_vector(to_unsigned(chip_counter, i2c_request.cmd_chip_id'length));
                        i2c_request.cmd_strobe <= '1';
                        i2c_fsm_state <= WaitForReply; 
                    end if;
            -- setting register value to all chips all Hybrids
            elsif command_type = x"2" then
                    if hybrid_counter+1>NUM_HYBRIDS or chip_counter+1>NUM_CHIPS then
                        -- wrong hybrid or chip id
                        error_code <= x"23";
                        i2c_fsm_state <= Finished;
                    else                    
                        i2c_request.cmd_hybrid_id <= std_logic_vector(to_unsigned(hybrid_counter, i2c_request.cmd_hybrid_id 'length));
                        i2c_request.cmd_chip_id <= std_logic_vector(to_unsigned(chip_counter, i2c_request.cmd_chip_id'length));
                        i2c_request.cmd_strobe <= '1';
                        i2c_fsm_state <= WaitForReply;
                    end if; 
            else
                    -- wrong command
                    error_code <= x"21";                    
                    i2c_request.cmd_strobe <= '0';
                    i2c_fsm_state <= Finished;                     
            end if;
            i2c_request.cmd_page <= page;
            i2c_request.cmd_read <= read;
            i2c_request.cmd_register <= register_address;
            if use_mask = '1' then
                i2c_request.cmd_write_mask <= i2c_mask;
            else
                i2c_request.cmd_write_mask <= x"FF";
            end if;
            i2c_request.cmd_data <= data_to_chip;
                        
        when WaitForReply =>
            i2c_fsm_status <= x"4";
            -- TODO: very strange, fifo needs two clock cycles to read set empty flag to 0, otherwise it executes all the commands twice. the line below should be in SendCommand state
            command_fifo_read_next_o <= '0';     
            
            i2c_request.cmd_strobe <= '0';            
            -- will wait for response from phy here
            if i2c_reply.cmd_strobe = '1' then                
                if i2c_reply.cmd_err = '0' then
                    -- setting register value to a certain hybrid,chip
                    if command_type = x"0" then
                        if read = '1' then
                            reply_fifo_data_o(31 downto 28) <= command_type; 
                            reply_fifo_data_o(27 downto 24) <= hybrid_id; 
                            reply_fifo_data_o(23 downto 20) <= chip_id;
                            reply_fifo_data_o(19 downto 18) <= "00";
                            reply_fifo_data_o(17) <= page; 
                            reply_fifo_data_o(16) <= '0';
                            reply_fifo_data_o(15 downto 8) <= register_address; 
                            reply_fifo_data_o(7 downto 0) <= i2c_reply.cmd_data;
                            reply_fifo_we_o <= '1';
                        end if;
                        i2c_fsm_state <= Finished;
                    -- setting register value to all chips within a certain hybrid
                    elsif command_type = x"1" then
                        if read = '1' then
                            reply_fifo_data_o(31 downto 28) <= command_type; 
                            reply_fifo_data_o(27 downto 24) <= hybrid_id; 
                            reply_fifo_data_o(23 downto 20) <= std_logic_vector(to_unsigned(chip_counter, 4)); 
                            reply_fifo_data_o(19 downto 18) <= "00";
                            reply_fifo_data_o(17) <= page; 
                            reply_fifo_data_o(16) <= '0'; 
                            reply_fifo_data_o(15 downto 8) <= register_address; 
                            reply_fifo_data_o(7 downto 0) <= i2c_reply.cmd_data;
                            reply_fifo_we_o <= '1';
                        end if;
                        if chip_counter < NUM_CHIPS-1 then
                            chip_counter <= chip_counter + 1;
                            if read = '1' then                            
                                i2c_fsm_state <= WriteFifo;
                            else
                                i2c_fsm_state <= SendCommand;
                            end if;
                        else
                            i2c_fsm_state <= Finished;
                        end if;
                    -- setting register value to all chips all Hybrids
                    elsif command_type = x"2" then
                        if read = '1' then
                            reply_fifo_data_o(31 downto 28) <= command_type; 
                            reply_fifo_data_o(27 downto 24) <= std_logic_vector(to_unsigned(hybrid_counter, 4)); 
                            reply_fifo_data_o(23 downto 20) <= std_logic_vector(to_unsigned(chip_counter, 4)); 
                            reply_fifo_data_o(19 downto 18) <= "00";
                            reply_fifo_data_o(17) <= page; 
                            reply_fifo_data_o(16) <= '0'; 
                            reply_fifo_data_o(15 downto 8) <= register_address; 
                            reply_fifo_data_o(7 downto 0) <= i2c_reply.cmd_data;                            
                            reply_fifo_we_o <= '1';
                        end if;
                        if hybrid_counter < NUM_HYBRIDS and chip_counter < NUM_CHIPS-1 then
                            chip_counter <= chip_counter + 1;
                            if read = '1' then                            
                                i2c_fsm_state <= WriteFifo;
                            else
                                i2c_fsm_state <= SendCommand;
                            end if;
                        elsif hybrid_counter < NUM_HYBRIDS-1 then     
                            chip_counter <= 0;
                            hybrid_counter <= hybrid_counter + 1;
                            if read = '1' then                            
                                i2c_fsm_state <= WriteFifo;
                            else
                                i2c_fsm_state <= SendCommand;
                            end if;
                        else
                            i2c_fsm_state <= Finished;
                        end if;     
                    else
                        -- status changed during execution
                        error_code <= x"22";
                        i2c_fsm_state <= Finished;
                    end if;
                else
                    -- TODO Here it uses only 4 bits of error code, need to be checked
                    error_code <= x"3" & i2c_reply.cmd_data(3 downto 0);
                    i2c_fsm_state <= Finished;
                end if;
            end if;
        
        when WriteFifo =>
            i2c_fsm_status <= x"5";
            if write_counter = "01" then
                reply_fifo_we_o <= '0';            
            elsif write_counter = "11" then
                i2c_fsm_state <= SendCommand;   
            end if;
            write_counter <= write_counter + 1;
                                                
        when Finished =>
            i2c_fsm_status <= x"6";
            command_fifo_read_next_o <= '0';
                        
            if write_counter = "01" then
                reply_fifo_we_o <= '0';            
            elsif write_counter = "11" then
                i2c_fsm_state <= Idle;   
            end if;
            write_counter <= write_counter + 1;          
            
        when others =>
            i2c_fsm_status <= x"f";
            -- fsm in a wrong state
            error_code <= x"2f";
            i2c_fsm_state <= Idle;
    end case;
    end if;
end process;

end rtl;
