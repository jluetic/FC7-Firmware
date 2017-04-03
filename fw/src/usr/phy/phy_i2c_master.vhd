----------------------------------------------------------------------------------
-- Company: Jarne de Clercq, Alexandre Leonard, Jelena Luetic
-- Create Date: 11/22/2016 03:44:28 PM
-- Description: slow control master
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity phy_i2c_master is
    generic(
        -- Input frequency clock
        IN_FREQ     : integer := 40_000_000;
        -- SCL frequency clock
        OUT_FREQ    : integer := 100_000
    );
    port(
        ref_clk_i   : in std_logic;
        reset_i     : in std_logic;
        -- Request
        en_i        : in std_logic;
        chip_address_i   : in std_logic_vector(6 downto 0);
        reg_address_i : in std_logic_vector(7 downto 0);
        rw_i        : in std_logic;
        data_i      : in std_logic_vector(7 downto 0);
        -- Response
        valid_o     : out std_logic;
        error_o     : out std_logic;
        data_o      : out std_logic_vector(7 downto 0);
        -- I2C lines
        scl_o       : out std_logic;
        sda_miso_i  : in std_logic;
        sda_mosi_o  : out std_logic;
        sda_tri_o   : out std_logic
    );
end phy_i2c_master;


architecture Behavioral of phy_i2c_master is
    --== Clocking signals ==--
    -- Division of the clock
    constant CLK_DIV    : integer := IN_FREQ / OUT_FREQ;

    -- Clock enable
    signal clk_en       : std_logic;
    -- Clock divider counter
    signal clk_divider  : integer range 0 to CLK_DIV;
    -- Asserted on rising edge
    signal rising_clk   : std_logic;
    -- Asserted on middle of high clock
    signal high_clk     : std_logic;
    -- Asserted on falling edge
    signal falling_clk  : std_logic;
    -- Asserted on middle of low clock
    signal low_clk      : std_logic;
    
    signal delay : integer range 0 to 5;


    --== State machine ==--

    type state_t is (IDLE, START, SEND_START, CHIP_ADDR, REG_ADDR, RW, WAIT_CHIP_ADDR_ACK, CHIP_ADDR_ACK, WAIT_REG_ADDR_ACK, REG_ADDR_ACK, ENDING_WR_FOR_RD, STOP_FOR_RD, START_RD, RD, RD_ACK, RST_1, ENDING_RD, WR, RST_2, ACK_2, ENDING_WR, STOP, ERROR);
    signal state        : state_t;
    
    -- Transaction parameters
    signal chip_address      : std_logic_vector(6 downto 0);
    signal reg_address       : std_logic_vector(7 downto 0);
    signal rw_n         : std_logic;
    signal rw_next         : std_logic;
    signal din          : std_logic_vector(7 downto 0) := (others => '0');
    signal dout         : std_logic_vector(7 downto 0) := (others => '0');

    -- Address and data counters
    signal chip_address_cnt  : integer range 0 to 6;
    signal reg_address_cnt : integer range 0 to 7;
    signal data_cnt     : integer range 0 to 7;
    

begin

    --=========--
    --== SCL ==--
    --=========--
    process(ref_clk_i)
    begin
        if (rising_edge(ref_clk_i)) then
            -- Reset & default values
            if (reset_i = '1' or clk_en = '0') then
                scl_o <= '1';
                clk_divider <= 0;
                rising_clk <= '0';
                high_clk <= '0';
                falling_clk <= '0';
                low_clk <= '0';
            else
                -- Counting
                if (clk_divider = (CLK_DIV - 1)) then
                    clk_divider <= 0;
                else
                    clk_divider <= clk_divider + 1;
                end if;
                -- SCK generation
                if (clk_divider < (CLK_DIV - 1) / 2) then
                    scl_o <= '1';
                else
                    scl_o <= '0';
                end if;
                -- Rising edge pulse
                if (clk_divider = 0) then
                    rising_clk <= '1';
                else
                    rising_clk <= '0';
                end if;
                -- High clock pulse
                if (clk_divider = (CLK_DIV - 1) / 4) then
                    high_clk <= '1';
                else
                    high_clk <= '0';
                end if;
                -- Falling edge pulse
                if (clk_divider = (CLK_DIV - 1) / 2) then
                    falling_clk <= '1';
                else
                    falling_clk <= '0';
                end if;
                -- Low clock pulse
                if (clk_divider = (CLK_DIV - 1) * 3 / 4) then
                    low_clk <= '1';
                else
                    low_clk <= '0';
                end if;
            end if;
        end if;
    end process;

    --=========--
    --== SDA ==--
    --=========--
    process(ref_clk_i)
    begin
        if (rising_edge(ref_clk_i)) then
            -- Reset & default values
            if (reset_i = '1') then
                valid_o <= '0';
                error_o <= '0';
                data_o <= (others => '0');
                sda_mosi_o <= '1';
                sda_tri_o <= '0';
                clk_en <= '0';
                state <= IDLE;
                chip_address <= (others => '0');
                reg_address <= (others => '0');
                rw_n <= '0';
                rw_next <= '0';
                din <= (others => '0');
                dout <= (others => '0');
                chip_address_cnt <= 0;
                reg_address_cnt <= 0;
                data_cnt <= 0;
            else
                case state is
                    -- Wait for request
                    when IDLE =>
                        -- Reset the flags
                        valid_o <= '0';
                        error_o <= '0';
                        sda_mosi_o <= '1';
                        sda_tri_o <= '0';
                        clk_en <= '0';
                        rw_next <= '0';
                        -- On request
                        if (en_i = '1') then
                            -- Store the request values
                            chip_address <= chip_address_i;
                            reg_address <= reg_address_i;
                            rw_n <= rw_i;
                            din <= data_i;
                            -- Change state
                            state <= START;
                            delay <= 5;
                        end if;

                    -- Create a start condition
                    when START =>
                        clk_en <= '1';
                     --   delay <= delay - 1;
                        if (delay = 1) then
                            state <= SEND_START;
                            delay <= 5;
                        else 
                            delay <= delay -1;
                        end if;
                        
                        
                    when SEND_START =>
                        -- On a high clock, put data low
                        if (high_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            -- Set the counter for the chip_address
                            chip_address_cnt <= 6;
                            state <= CHIP_ADDR;
                        end if;

                    -- Transmit the chip address signal
                    when CHIP_ADDR =>
                        -- Write data on a low clock
                        if (low_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= chip_address(chip_address_cnt);
                            sda_tri_o <= '0';
                            -- If the address is sent, got to rw bit
                            if (chip_address_cnt = 0) then
                                state <= RW;
                            -- or decrement counter
                            else
                                chip_address_cnt <= chip_address_cnt - 1;
                            end if;
                        end if;

                    -- Send the rw bit
                    when RW =>
                        -- Write data on a low clock
                        if (low_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= rw_next; -- first transaction is always a write (A.L.)
                            sda_tri_o <= '0';
                            state <= WAIT_CHIP_ADDR_ACK;
                        end if;

                    -- Free the bus for slave to write
                    when WAIT_CHIP_ADDR_ACK =>
                        -- On the falling edge of the RW bit, free the line
                        if (falling_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            state <= CHIP_ADDR_ACK;
                        end if;

                    -- Read the chip address acknowledgment
                    when CHIP_ADDR_ACK =>
                        -- On high clock, read data
                        if (high_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            -- If the slave acknowledged
                            if (sda_miso_i = '0') then
                                -- Set the reg. and data counter
                                reg_address_cnt <= 7;
                                data_cnt <= 7;
                                -- Go to reg. address state or read state (a read request starts by a write
                                case rw_next is
                                    when '0' => state <= REG_ADDR;
                                    when others => state <= RD;
                                end case;
                                rw_next <= rw_n; -- update rw_next for potential next run in read request

                            -- or error                               
                            else
                                state <= ERROR;
                            end if;
                        end if;

                    -- Transmit the reg address signal
                    when REG_ADDR =>
                        -- Write data on a low clock
                        if (falling_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= reg_address(reg_address_cnt);
                            sda_tri_o <= '0';
                            -- If the reg address is sent, go to wait reg. address ack
                            if (reg_address_cnt = 0) then
                                state <= WAIT_REG_ADDR_ACK;
                            -- or decrement counter
                            else
                                reg_address_cnt <= reg_address_cnt - 1;
                            end if;
                        end if;
                        
                    -- Free the bus for slave to write
                    when WAIT_REG_ADDR_ACK =>
                        -- On the falling edge of the RW bit, free the line
                        if (falling_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            state <= REG_ADDR_ACK;
                        end if;

                    -- Read the reg. address acknowledgment
                    when REG_ADDR_ACK =>
                        -- On high clock, read data
                        if (high_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';

                            -- If the slave acknowledged
                            if (sda_miso_i = '0') then
                                -- Set the chip address and data counters
                                chip_address_cnt <= 6;
                                data_cnt <= 7;
                                -- Go to read or write states
                                case rw_n is
                                    when '1' => state <= ENDING_WR_FOR_RD;
                                    when others => state <= WR;
                                end case;

                            -- or error                               
                            else
                                state <= ERROR;
                            end if;
                        end if;

                    -- Wait for the clock to go low before sending the STOP signals, otherwise
                    -- the signal would be sent to soon
                    when ENDING_WR_FOR_RD =>
                        -- On the falling clock
                        if (falling_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            state <= STOP_FOR_RD;
                        end if;

                    -- Send stop signal before start signal for read
                    when STOP_FOR_RD =>
                        -- On a high clock
                        if (high_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '0';
                            -- Go back to Start state but rw_next is now different maybe we need to wait a litlle bit before sending a start
                            state <= START;
                        end if;
                        
                    -- On high clock, read data
                    when RD =>
                        if (high_clk = '1') then
                            -- Slave controls the line
                            dout(data_cnt) <= sda_miso_i;
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            -- If all the data has been read, send acknowledgment
                            if (data_cnt = 0) then
                                state <= RD_ACK;
                            -- otherwise continue
                            else
                                data_cnt <= data_cnt - 1;
                            end if;
                        end if;
    
                    -- Send the read ackownledgment 
                    when RD_ACK =>
                        -- On the falling clock, take back control
                        if (falling_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            state <= RST_1;
                        end if;
    
                    -- Wait for the clock to go low before sending the STOP signals, otherwise
                    -- the signal would be sent to soon
                    when RST_1 =>
                        -- Wait for a low clock
                        if (low_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            state <= ENDING_RD;
                        end if;

                    -- Wait for the clock to go low before sending the STOP signals, otherwise
                    -- the signal would be sent to soon
                    when ENDING_RD =>
                        if (low_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            state <= STOP;
                        end if;
    
                    -- Write data on the line
                    when WR =>
                        -- On the falling clock, change the data
                        if (falling_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= din(data_cnt);
                            sda_tri_o <= '0';
                            -- When no more data has to be sent, go for acknowledgment
                            if (data_cnt = 0) then
                                state <= RST_2;
                            -- or continue
                            else
                                data_cnt <= data_cnt - 1;
                            end if;
                        end if;
    
                    -- Give control of the line to the slave
                    when RST_2 =>
                        -- Wait for the falling clock
                        if (falling_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            state <= ACK_2;
                        end if;

                    -- Read the write ackownledgment
                    when ACK_2 =>
                        -- On the high clock
                        if (high_clk = '1') then
                            -- Slave controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '1';
                            -- If the slave acknowledged, go for end of transaction
                            if (sda_miso_i = '0') then
                                state <= ENDING_WR;
                            -- or error
                            else
                                state <= ERROR;
                            end if;
                        end if;
    
                    -- Wait for the clock to go low before sending the STOP signals, otherwise
                    -- the signal would be sent to soon
                    when ENDING_WR =>
                        -- On the falling clock
                        if (falling_clk = '1') then
                            -- Master controls the line
                            sda_mosi_o <= '0';
                            sda_tri_o <= '0';
                            state <= STOP;
                        end if;

                    -- Send the stop signal
                    when STOP =>
                        -- On a high clock
                        if (high_clk = '1') then
                            -- Set the output busses
                            valid_o <= '1';
                            error_o <= '0';

                            case rw_n is
                                when '1' => data_o <= dout;
                                when others => data_o <= (others => '0');
                            end case;

                            -- Master controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '0';
                            -- Go back to IDLE state
                            state <= IDLE;
                        end if;

                    -- Set an error
                    when ERROR =>
                        -- Wait for high clock
                        if (high_clk = '1') then
                            -- Set the output busses
                            valid_o <= '0';
                            error_o <= '1';
                            data_o <= (others => '0');
                            -- Master controls the line
                            sda_mosi_o <= '1';
                            sda_tri_o <= '0';
                            -- Go back to IDLE state
                            state <= IDLE;
                        end if;
                    --
                    when others =>
                        valid_o <= '0';
                        error_o <= '0';
                        data_o <= (others => '0');
                        sda_mosi_o <= '1';
                        sda_tri_o <= '1';
                        clk_en <= '0';
                        state <= IDLE;
                        chip_address <= (others => '0');
                        rw_n <= '0';
                        rw_next <= '0';
                        din <= (others => '0');
                        dout <= (others => '0');
                        chip_address_cnt <= 0;
                        reg_address_cnt <= 0;
                        data_cnt <= 0;
                        
                end case; -- end state case
            end if;
        end if;
    end process;     
end Behavioral;