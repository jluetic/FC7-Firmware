----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2016 01:39:32 PM
-- Design Name: 
-- Module Name: sim_command_processor_core - Behavioral
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
use work.ipbus.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_command_processor_core is
--  Port ( );
end sim_command_processor_core;

architecture Behavioral of sim_command_processor_core is

    -- clock definition
    constant clk40_period : time := 25 ns;
    constant clk_ipb_period : time := 32 ns;    
    signal clk_40MHz : std_logic;
    signal clk_ipb : std_logic;   
    
    signal i2c_request              : cmd_wbus;
    signal i2c_reply                : cmd_rbus;
    
    signal reset                  : std_logic := '0';
    
    -- hybrid_id
    signal hybrid_id              : std_logic_vector(3 downto 0) := x"0";
    -- cbc on hybrid id
    signal chip_id                : std_logic_vector(3 downto 0) := x"1";
    -- use mask
    signal use_mask               : std_logic := '0';
    -- page in the CBC
    signal page                   : std_logic := '0';
    -- read or write setting
    signal read                   : std_logic := '1';
    -- register_address
    signal register_address       : std_logic_vector(7 downto 0) := x"23";
    signal data                   : std_logic_vector(7 downto 0) := x"AB";
    
    -- Control tom Command Processor Block
    signal ctrl_command_block_from_ipbus       : ctrl_command_block_from_ipbus_type;
    signal ctrl_command_block_to_ipbus         : ctrl_command_block_to_ipbus_type;
    signal cnfg_command_block                  : cnfg_command_block_type;
    signal stat_command_block                  : stat_command_block_type;

begin 

    --===================================--
    -- clocks
    --===================================--    
    clk40_process: process
    begin
        clk_40MHz <= '1';
        wait for clk40_period/2;
        clk_40MHz <= '0';
        wait for clk40_period/2;
    end process;
    
    clk_ipb_process: process
    begin
        clk_ipb <= '1';
        wait for clk_ipb_period/2;
        clk_ipb <= '0';
        wait for clk_ipb_period/2;
    end process;    

    --===================================--
    -- port maps
    --===================================--  

    --===================================--
    -- Block responsible for I2C command processing. Is connected to: hybrids.
    --===================================--
    uut_command_processor_block: entity work.command_processor_core
    --===================================--
    port map
    (
        clk_40MHz       => clk_40MHz,
        ipb_clk         => clk_ipb,
        reset           => reset,     
        -- controls from ipbus
        cnfg_command_block              => cnfg_command_block,
        ctrl_command_block_from_ipbus   => ctrl_command_block_from_ipbus,    
        ctrl_command_block_to_ipbus     => ctrl_command_block_to_ipbus,
        -- fifo statuses out
        stat_command_block              => stat_command_block,
        -- i2c commands
        i2c_request     => i2c_request,
        i2c_reply       => i2c_reply        
    );        
    
    PHY_RESPONSE_GENERATOR: entity work.answer_block
    port map ( clk          => clk_40MHz,
               i2c_request  => i2c_request,
               i2c_reply    => i2c_reply);
 
               
    --===================================--
    -- execution
    --===================================--
    
    cnfg_command_block.i2c_mask <= x"ff";               

    STIMULUS: process
        
        procedure read_i2c_reply is
        begin
            ctrl_command_block_from_ipbus.reply_fifo_read_next <= '1';
            wait for 32 ns;
            ctrl_command_block_from_ipbus.reply_fifo_read_next <= '0';
        end read_i2c_reply;
        
        -- 0 - certain hybrid/chip, 1 - all chips on hybrid, 2 - all hybrids all chups
        procedure write_i2c_command( i2c_command : in std_logic_vector(3 downto 0) ) is
            variable command_i2c : std_logic_vector(31 downto 0);
        begin            
            command_i2c := i2c_command & hybrid_id & chip_id & '0' & use_mask & page & read & register_address & data;
            ctrl_command_block_from_ipbus.command_fifo_data <= command_i2c;
            ctrl_command_block_from_ipbus.command_fifo_we <= '1'; 
            wait for 32 ns;
            ctrl_command_block_from_ipbus.command_fifo_we <= '0';  
        end write_i2c_command;
        
     
    begin
        
        -- initialization
        reset <= '1';
        wait for 50 ns;
        reset <= '0';
        wait for 200 ns;
        
        --=======================--
        -- send i2c command
        --=======================--
        write_i2c_command(x"1");       
        wait for 1500 ns;
        
        --=======================--
        -- read i2c reply
        --=======================--
        read_i2c_reply;
        read_i2c_reply;
        read_i2c_reply;               
        wait for 100 ns;        
        
        -- wait at the end    
        wait for 300 ns;
    end process;
    

end Behavioral;
