----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/22/2016 04:00:25 PM
-- Design Name: 
-- Module Name: phy_i2c_slave - Behavioral
-- Project Name: 
-- Target Devices: j
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.user_package.ALL;
use work.cbc3_emulator_package.ALL;


entity CBC3_i2c_slave is
generic(
    CHIP_ADDR : std_logic_vector(6 downto 0) := "1110000"
);
port(

    clk_ref_i   : in std_logic;
    reset_i     : in std_logic;

    -- I2C lines
    scl_i       : in std_logic;
    sda_miso_o  : out std_logic;
    sda_mosi_i  : in std_logic;
    sda_tri_o   : out std_logic;
    --sda_o: out std_logic;
    --sda_i: in std_logic
           
    masks_o    : out std_logic_vector(253 downto 0);
    VTH_o       : out std_logic_vector(9 downto 0) 
);
end CBC3_i2c_slave;

architecture Behavioral of CBC3_i2c_slave is

    
    signal chip_address_requested :std_logic_vector(6 downto 0) := (others => '0');
    signal reg_address_requested: std_logic_vector(7 downto 0) := (others => '0');
    signal rw_requested: std_logic := '0';

    signal chip_address_cnt: integer := 6;
    signal reg_address_cnt: integer := 7;
    signal data_cnt: integer := 7;

    type state_t is (IDLE, START, CHECK_CHIP_ADDR, REST_1, REST_4, RW_BIT, SEND_ACK, GET_REG_ADDR, FETCH_REG_DATA_AND_ACK, REST_2, READ_DATA_OR_STOP, ADJUST_DATA, WRITE_DATA_AND_ACK, REST_3, SEND_DATA, WAIT_MASTER_ACK);
    signal state: state_t := IDLE;

    signal regs_page1_internal : array_reg_page1_medium := regs_page1_default_medium;
    signal regs_page2_internal : array_reg_page2_medium := regs_page2_default_medium;
    
    signal data : std_logic_vector(7 downto 0) := (others => '1');
    signal data_tmp : std_logic_vector(7 downto 0) := (others => '1');    

       
    signal masks_registers: std_logic_vector(255 downto 0) := (others => '0');
    signal VTH_register1: std_logic_vector(7 downto 0) := (others => '0');
    signal VTH_register2: std_logic_vector(7 downto 0) := "00000010";
   
   
    
begin
    masks_o <= masks_registers(253 downto 0); 
    VTH_o <= VTH_register2(1 downto 0) & VTH_register1(7 downto 0);
    
     
    process(clk_ref_i)
        variable previous_sda: std_logic := '1';
        variable current_sda: std_logic := '1';
        variable previous_scl: std_logic := '1';
        variable current_scl: std_logic := '1'; 
        
        
        
    begin
        if (rising_edge(clk_ref_i)) then
        
            previous_sda := current_sda;
            current_sda := sda_mosi_i;
            --current_sda := sda_i;
            previous_scl := current_scl;
            current_scl := scl_i;
            
            -- Reset & default values
            if (reset_i = '1') then
                -- master controls the bus
                sda_miso_o <= '1';
                sda_tri_o <= '1';
                --sda_o <= '1';

                state <= IDLE;
                chip_address_requested <= (others => '0');
                rw_requested <= '0';
                reg_address_requested <= (others => '0');
                
                --put registers back to default values
                regs_page1_internal <= regs_page1_default_medium;
                regs_page2_internal <= regs_page2_default_medium;
                
                masks_registers <= (others => '0');
                VTH_register1 <= (others => '0');
                VTH_register2 <=  "00000010";
                
          
                                
            else
                case state is
                    when IDLE =>
                        -- master controls the bus
--                        sda_miso_o <= '1';
--                        sda_tri_o <= '1';                            
                        chip_address_cnt <= chip_address_cnt +1;               
                        if (current_sda = '0' and previous_sda = '1' and scl_i = '1') then
                            chip_address_cnt <= 6;
                            state <= START;
                        end if;

                    when START =>
                        -- master controls the bus
                      --  idle_status <= '0';
                       -- start_status <= '1';
                        
                        sda_miso_o <= '1';
                        sda_tri_o <= '1';
                        --sda_o <= '1';
                        if (previous_scl = '0' and current_scl = '1') then
                            chip_address_requested(chip_address_cnt) <= sda_mosi_i;
                            --chip_address_requested(chip_address_cnt) <= sda_i;

                            if (chip_address_cnt = 0) then
                                state <= CHECK_CHIP_ADDR;
                            else
                                chip_address_cnt <= chip_address_cnt - 1;
                            end if;

                        end if;

                    when CHECK_CHIP_ADDR =>
                        -- master controls the bus
                        

                        --sda_o <= '1';
                        if (chip_address_requested = CHIP_ADDR or chip_address_requested = "1111111") then
                            state <= RW_BIT;
                            sda_miso_o <= '1';
                            sda_tri_o <= '1';
                        else
                            sda_miso_o <= 'Z';
                            sda_tri_o <= 'Z';
                            state <= IDLE;
                        end if;

                    when RW_BIT =>
                        -- master controls the bus
                        
                        sda_miso_o <= '1';
                        sda_tri_o <= '1';
                        --sda_o <= '1';
                        if (previous_scl = '0' and current_scl = '1') then
                            rw_requested <= sda_mosi_i;
                            --rw_requested <= sda_i;
                            state <= SEND_ACK;
                        end if;

                    when SEND_ACK =>
                        -- slave controls the bus
                        
                        if (previous_scl = '1' and current_scl = '0') then --test
                            sda_tri_o <= '0';
                            sda_miso_o <= '0';
                            --sda_o <= '0';
                            state <= REST_1;

                        end if;

                    when REST_1 =>
                        
                        if (previous_scl = '1' and current_scl = '0') then
                            sda_miso_o <= '1';
                            sda_tri_o <= '1'; -- test
                            --sda_o <= '1';
                            reg_address_cnt <= 7;
                            data_cnt <= 7;
                            case rw_requested is
                                when '0' => state <= GET_REG_ADDR;
                                when others => state <= SEND_DATA;
                            end case;

                        end if;


                    when GET_REG_ADDR =>
                            -- master controls the bus
                            --get_reg_status <= '1';
                            sda_miso_o <= '1';
                            sda_tri_o <= '1';
                            --sda_o <= '1';
                            if (previous_scl = '0' and current_scl = '1') then
                                reg_address_requested(reg_address_cnt) <= sda_mosi_i;
                                --reg_address_requested(reg_address_cnt) <= sda_i;
                                if (reg_address_cnt = 0) then
                                    state <= FETCH_REG_DATA_AND_ACK;
                                else
                                    reg_address_cnt <= reg_address_cnt - 1;
                                end if;
                            end if;


                    when FETCH_REG_DATA_AND_ACK =>

                        if (reg_address_requested = "00000000") then
                            data <= regs_page1_internal(0);
                        else
                           if(regs_page1_internal(0)(7)='0') then
                                data <= regs_page1_internal(to_integer(unsigned(reg_address_requested)));
                            elsif(regs_page1_internal(0)(7)='1') then
                                data <= regs_page2_internal(to_integer(unsigned(reg_address_requested)));
                            end if;
                        end if;    
                        data_cnt <= 7;
                        -- slave controls the bus
                        if (previous_scl = '1' and current_scl = '0') then
                            sda_tri_o <= '0';
                            sda_miso_o <= '0';
                            --sda_o <= '0';
                            state <= REST_2;
                        end if;

                     when REST_2 =>
                        if (previous_scl = '1' and current_scl = '0') then
                            sda_tri_o <= '0';
                            sda_miso_o <= '1';
                            --sda_o <= '1';
                            data_cnt <= 7;
                            state <= READ_DATA_OR_STOP;
                        end if;

                    when READ_DATA_OR_STOP =>
                       
                        -- master controls the bus
                        sda_miso_o <= '1';
                        sda_tri_o <= '1';
                        --sda_o <= '1';
                        if (current_sda = '1' and previous_sda = '0' and scl_i = '1') then --stop signal
                            state <= IDLE;
                        --Jarne
                        elsif (current_sda = '0' and previous_sda = '1' and scl_i = '1') then --restart signal
                            state <= START;
                        elsif (previous_scl = '0' and current_scl = '1') then
                            data_tmp(data_cnt) <= sda_mosi_i;
                            --data_tmp(data_cnt) <= sda_i;
                            if (data_cnt = 0) then
                                state <= ADJUST_DATA;
                            else
                                data_cnt <= data_cnt - 1;
                            end if;
                        end if;
                        
                    when ADJUST_DATA =>
                        data <= data_tmp;
                        state <= WRITE_DATA_AND_ACK;


                    when WRITE_DATA_AND_ACK =>
                        --which page to write to depends on the bit 7 of register 0. In this case we use bit 7 of register 0 of page 1 to save the page. Register O of page 2 is a dummy                        
                        if(regs_page1_internal(0)(7)='0' or reg_address_requested = x"00") then
                            regs_page1_internal(to_integer(unsigned(reg_address_requested))) <= data;
                        elsif(regs_page1_internal(0)(7)='1') then
                            regs_page2_internal(to_integer(unsigned(reg_address_requested))) <= data;
                        end if; 
                        
                        case regs_page1_internal(0)(7) & reg_address_requested is
                            when"000000001" =>
                                masks_registers(7 downto 0) <= data;
                            when"000000010" =>
                                masks_registers(15 downto 8) <= data;
                            when"000000011" =>
                                masks_registers(23 downto 16) <= data;
                            when"000000100" =>
                                masks_registers(31 downto 24) <= data;
                            when"000000101" =>
                                masks_registers(39 downto 32) <= data;
                            when"000000110" =>
                                masks_registers(47 downto 40) <= data;
                            when"000000111" =>
                                masks_registers(55 downto 48) <= data;
                            when"000001000" =>
                                masks_registers(63 downto 56) <= data;
                            when"000001001" =>
                                masks_registers(71 downto 64) <= data;
                            when"000001010" =>
                                masks_registers(79 downto 72) <= data;
                            when"000001011" =>
                                masks_registers(87 downto 80) <= data;
                            when"000001100" =>
                                masks_registers(95 downto 88) <= data;
                            when"000001101" =>
                                masks_registers(103 downto 96) <= data;
                            when"000001110" =>
                                masks_registers(111 downto 104) <= data;
                            when"000001111" =>
                                masks_registers(119 downto 112) <= data;
                            when"000010000" =>
                                masks_registers(127 downto 120) <= data;
                            when"000010001" =>
                                masks_registers(135 downto 128) <= data;
                            when"000010010" =>
                                masks_registers(143 downto 136) <= data;
                            when"000010011" =>
                                masks_registers(151 downto 144) <= data;
                            when"000010100" =>
                                masks_registers(159 downto 152) <= data;
                            when"000010101" =>
                                masks_registers(167 downto 160) <= data;
                            when"000010110" =>
                                masks_registers(175 downto 168) <= data;
                            when"000010111" =>
                                masks_registers(183 downto 176) <= data;
                            when"000011000" =>
                                masks_registers(191 downto 184) <= data;
                            when"000011001" =>
                                masks_registers(199 downto 192) <= data;
                            when"000011010" =>
                                masks_registers(207 downto 200) <= data;
                            when"000011011" =>
                                masks_registers(215 downto 208) <= data;
                            when"000011100" =>
                                masks_registers(223 downto 216) <= data;
                            when"000011101" =>
                                masks_registers(231 downto 224) <= data;
                            when"000011110" =>
                                masks_registers(239 downto 232) <= data;
                            when"000011111" =>
                                masks_registers(247 downto 240) <= data;
                            when"000100000" =>
                                masks_registers(255 downto 248) <= data;
                           --if it corresponds to a VTH register then thi info will be used in the stub data
                            when "000100001" =>
                                VTH_register1 <= data;
                            when "000100010" =>
                                VTH_register2 <= data;                                                                                                                                
                           when others =>

                        end case;
                        -- slave controls the bus
                        if (previous_scl = '1' and current_scl = '0') then
                            sda_tri_o <= '0';
                            sda_miso_o <= '0';
                            --sda_o <= '0';
                            data_cnt <= 7;
                            state <= REST_3;
                        end if;

                   when REST_3 =>
                       if (previous_scl = '1' and current_scl = '0') then
                           sda_tri_o <= '0';
                           sda_miso_o <= '1';
                           --sda_o <= '1';
                           data_cnt <= 7;
                           state <= IDLE;
                       end if;

                    when SEND_DATA  =>
                        sda_tri_o <= '0';
                        -- slave controls the bus
                        if (previous_scl = '0' and current_scl = '1') then
                            sda_miso_o <= data(data_cnt);
                            sda_tri_o <= '0';
                            --sda_o <= data(data_cnt);
                            if (data_cnt = 0) then
                                state <= REST_4;
                            -- or decrement counter
                            else
                                data_cnt <= data_cnt - 1;
                            end if;
                        end if;

                    when REST_4 =>
                        if (previous_scl = '1' and current_scl = '0') then
                            sda_tri_o <= '1';
                            sda_miso_o <= '1';
                            state <= WAIT_MASTER_ACK;
                        end if;


                    when WAIT_MASTER_ACK =>
                         -- master controls the bus
                         sda_miso_o <= '1';
                         sda_tri_o <= '1';
                         --sda_o <= '1';
                        if (previous_scl = '0' and current_scl = '1') then
                             if (sda_mosi_i = '0') then
                             --if (sda_i = '0') then
                                state <= IDLE;
                             else
                                 state <= IDLE; -- should do something with error here
                             end if;
                         end if;

                end case;

            end if;--reset

        end if;--clk


    end process;
    



end Behavioral;