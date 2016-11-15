----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/08/2016 12:52:31 PM
-- Design Name: 
-- Module Name: fast_command_core - rtl
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fast_command_core is
  Generic (
    NUM_HYBRIDS           : integer := 1
  );
  Port (
    clk_160MHz            : in std_logic;
    clk_40MHz             : in std_logic;
    clk_lhc               : in std_logic;
    reset                 : in std_logic;
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- commands from Command Prcoessor block
    cp_command            : in std_logic_vector(3 downto 0);
    -- number of triggers to accept, output trigger frequency divider, module(s) to accept stub from, ~ 67.1 million as a maximum should be enough
    cp_data               : in std_logic_vector(25 downto 0);    
    done                  : out std_logic;
    failed                : out std_logic;
    -- output trigger to Hybrids
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal trigger_i                : std_logic := '0';
    signal done_i                   : std_logic := '0';
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '0');
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    type trigger_source_type is (None, LHC_Strobe, Stubs, UserFrequency);
    signal trigger_source           : trigger_source_type := None;
    signal user_divider             : std_logic_vector(25 downto 0);
    signal user_trigger             : std_logic;
    signal command_arrived_loc      : std_logic := cp_command(3);
    signal continuous_triggering    : std_logic := '0';
    -- accept N triggers related signals
    type triggering_state_type is (Idle, Continuous, Starting, Triggering, FinishedTriggering, TriggeringFailed);
    signal triggering_state           : triggering_state_type := Continuous;
    signal trigger_count            : std_logic_vector(25 downto 0) := (others => '0');
    signal counter                  : std_logic_vector(25 downto 0) := (others => '0');
    signal reset_counter            : std_logic := '0';
    signal reset_counter_loc        : std_logic := '0';

begin

    trigger_out <= trigger_i;
    done <= done_i;

--===================================--
clk_divider: entity work.clock_divider
--===================================--
port map
(
    i_clk           => clk_40MHz,
    i_rst           => reset,
    i_clk_divider   => user_divider,
    o_clk           => user_trigger
);             
--===================================--

process (clk_160MHz)
begin
    if rising_edge(clk_160MHz) then
        if reset = '1' then
            trigger_source <= None;
            failed <= '0';
            done_i <= '0';
        end if;
        done_i <= '0';
        failed <= '0';
        if triggering_state = FinishedTriggering then
            done_i <= '1';
        elsif triggering_state = TriggeringFailed then
            done_i <= '1';  
            failed <= '1';
        elsif triggering_state = Idle then 
            trigger_source <= None;
        end if; 
        if(cp_command(3) /= command_arrived_loc) then
            command_arrived_loc <= cp_command(3);
            case cp_command(2 downto 0) is
                -- switch to no triggers
                when "000" =>
                    trigger_source <= None;
                    reset_counter <= not reset_counter;
                    continuous_triggering <= '1';
                    done_i <= '1';
                -- switch to LHC clock as trigger
                when "001" =>
                    trigger_source <= LHC_Strobe;
                    reset_counter <= not reset_counter;
                    continuous_triggering <= '1';
                    done_i <= '1';
                -- switch to triggering using stubs from the hybrids, could be coincidence
                when "010" =>
                    hybrid_mask_inv <= not cp_data(NUM_HYBRIDS downto 1);
                    trigger_source <= Stubs;
                    reset_counter <= not reset_counter;
                    continuous_triggering <= '1';
                    done_i <= '1';
                -- switch to triggering in user defined frequency
                when "011" =>
                    user_divider <= cp_data;
                    trigger_source <= UserFrequency;
                    reset_counter <= not reset_counter;
                    continuous_triggering <= '1';
                    done_i <= '1';
                when "100" =>                    
                    if triggering_state /= Triggering then
                        continuous_triggering <= '0';
                        reset_counter <= not reset_counter;
                    else
                        done_i <= '1';  
                        failed <= '1';  
                    end if;
                when others =>
                    done_i <= '1';
                    failed <= '1';    
            end case;
        end if;
    end if;    
end process;

process (trigger_source, clk_160MHz, user_trigger, clk_lhc)
begin
    case trigger_source is
        -- no triggers
        when None =>
            trigger_i <= '0';
        -- spread LHC clock as trigger
        when LHC_Strobe =>
            trigger_i <= clk_lhc;
        -- triggers using stubs from the hybrids, could be coincidence
        when Stubs =>
            if ones_mask = (hybrid_mask_inv OR in_stubs) then
                trigger_i <= '1';
            else
                trigger_i <= '0';
            end if;
        -- trigger with defined user frequency <= 40MHz
        when UserFrequency =>
            if user_divider = "00000000000000000000000001" then
                trigger_i <= clk_40MHz;
            else
                trigger_i <= user_trigger;
            end if;
        -- no triggers
        when others =>
            trigger_i <= '0';
    end case;            
end process;

process (trigger_i)
begin
    if rising_edge(trigger_i) then
        if(reset_counter /= reset_counter_loc) then
            reset_counter_loc <= reset_counter;
            counter <= (others => '0');
            if continuous_triggering = '1' then
                triggering_state <= Continuous;
            else
                triggering_state <= Starting;
            end if;    
        else
            case triggering_state is
                when Idle =>
                    triggering_state <= Idle;
                when Continuous =>
                    triggering_state <= Continuous;
                when Starting =>
                    if trigger_source = None then
                        triggering_state <= TriggeringFailed; 
                    else
                        trigger_count <= cp_data - 1;
                        triggering_state <= Triggering;
                    end if;
                when Triggering =>
                    if counter >= trigger_count then
                        triggering_state <= FinishedTriggering;
                    end if;
                when FinishedTriggering =>
                    triggering_state <= Idle;
                when TriggeringFailed =>
                    triggering_state <= Idle;
                when others =>
                    triggering_state <= Idle;                                                         
            end case;            
            counter <= counter + 1;
        end if;
    end if;
end process;

end rtl;
