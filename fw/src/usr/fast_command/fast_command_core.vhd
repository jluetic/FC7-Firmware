----------------------------------------------------------------------------------
-- Engineer: Mykyta Haranko
-- Create Date: 11/08/2016 12:52:31 PM
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use work.user_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fast_command_core is
  Port (
    clk_40MHz             : in std_logic;
    l1_trigger_in         : in std_logic;
    reset                 : in std_logic;
    -- control buses from Command Processor Block
    ctrl_fastblock_i      : in ctrl_fastblock;
    cnfg_fastblock_i      : in cnfg_fastblock;
    -- stubs from hybrids
    in_stubs              : in std_logic_vector(NUM_HYBRIDS downto 1);
    -- trigger status register output (3-0 - source, 4 - state, 5 - configured)
    trigger_status_out    : out std_logic_vector(7 downto 0);
    -- fast command block error
    error_code            : out std_logic_vector(7 downto 0);
    -- output trigger to Hybrids (temporary, for tests)
    trigger_out           : out std_logic
  );
end fast_command_core;

architecture rtl of fast_command_core is

    signal reset_int                : std_logic;

    -- masks
    signal ones_mask                : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    
    -- trigger fsm related
    type trigger_state_type is (Idle, Running);
    signal trigger_state            : trigger_state_type := Idle;
    signal trigger_start_loc        : std_logic := '0';
    signal trigger_stop_loc         : std_logic := '0';
    signal no_triggers              : std_logic := '0';
    signal ipb_reset                : std_logic := '0';
    
    -- trigger signals 
    signal trigger_i                : std_logic;
    signal stubs_user_muxed         : std_logic;
    signal clock_enable             : std_logic := '0';
    signal user_trigger             : std_logic;
    signal stubs_trigger            : std_logic;
    
    -- trigger configs
    signal trigger_source           : std_logic_vector(3 downto 0) := x"1";    
    signal hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    signal user_trigger_divider     : integer range 1 to MAX_TRIGGER_DIVIDER := 1;    
    signal triggers_to_accept       : integer range 0 to MAX_NTRIGGERS_TO_ACCEPT := 0;
    
    -- temporary configuration signals
    signal temp_trigger_source           : std_logic_vector(3 downto 0) := x"1";
    signal temp_hybrid_mask_inv          : std_logic_vector(NUM_HYBRIDS downto 1) := (others => '1');
    signal temp_user_trigger_divider     : integer range 1 to MAX_TRIGGER_DIVIDER := 1;    
    signal temp_triggers_to_accept       : integer range 0 to MAX_NTRIGGERS_TO_ACCEPT := 0;
    
    -- accept N triggers related signals
    signal counter                  : std_logic_vector(31 downto 0) := (others => '0');
    signal reset_counter            : std_logic := '0';
    
    -- trigger checker counter
    signal checked                  : std_logic := '0';
    signal trigger_checker          : std_logic_vector(31 downto 0) := (others => '0');
    
    -- status signals
    signal status_source            : std_logic_vector(3 downto 0) := x"0";
    -- 1 - running, 0 - idle
    signal status_state             : std_logic := '0';
    signal configured               : std_logic := '0';
    
begin

    -- combined reset signal
    reset_int <= reset or ipb_reset;

    stubs_trigger <= '1' when ones_mask = (hybrid_mask_inv XOR in_stubs) else '0';
    
    -- status
    trigger_status_out(7 downto 6) <= "00";
    trigger_status_out(5)          <= configured;
    trigger_status_out(4)          <= status_state;
    trigger_status_out(3 downto 0) <= status_source;

--===================================--
clk_divider: entity work.clock_divider
--===================================--
port map
(
    i_clk           => clk_40MHz,
    i_rst           => reset_int,
    i_clk_divider   => std_logic_vector(to_unsigned(user_trigger_divider,32)),
    o_clk           => user_trigger
);             
--===================================--

--===================================--
MUX_Stubs_User : BUFGCTRL  
--===================================--
generic map (  
  INIT_OUT     => 0,  
  PRESELECT_I0 => FALSE,  
  PRESELECT_I1 => FALSE)  
port map (  
  O       => stubs_user_muxed,  
  CE0     => '1',  
  CE1     => '1',  
  I0      => stubs_trigger,  
  I1      => user_trigger,
  IGNORE0 => '1',  
  IGNORE1 => '1',  
  S0      => not trigger_source(0), -- Clock select0 input  
  S1      => trigger_source(0) -- Clock select1 input  
);
--===================================--

--===================================--
MUX_Final : BUFGCTRL  
--===================================--
generic map (  
  INIT_OUT     => 0,  
  PRESELECT_I0 => FALSE,  
  PRESELECT_I1 => FALSE)  
port map (  
  O       => trigger_i,  
  CE0     => '1',  
  CE1     => '1',  
  I0      => l1_trigger_in,  
  I1      => stubs_user_muxed,  
  IGNORE0 => '1',  
  IGNORE1 => '1',  
  S0      => not trigger_source(1), -- Clock select0 input  
  S1      => trigger_source(1) -- Clock select1 input  
);
--===================================--

--===================================--
BufGCE_Out : BUFGCE
--===================================--
port map (
    I   => trigger_i,
    O   => trigger_out,
    CE  => clock_enable
);
--===================================--

COMMAND_HANDLER: process (reset_int, clk_40MHz)
begin
    if reset_int = '1' then
        ipb_reset <= '0';
        trigger_start_loc <= '0';
        trigger_stop_loc <= '0';
        
        temp_trigger_source <= x"1";
        temp_hybrid_mask_inv <= (others => '1');
        temp_user_trigger_divider <= 1;
        temp_triggers_to_accept <= 0;
        configured <= '0';
        
    elsif rising_edge(clk_40MHz) then
        ipb_reset <= '0';
        trigger_start_loc <= '0';
        trigger_stop_loc <= '0';
        if trigger_state = Idle then            
            trigger_source <= temp_trigger_source;
            hybrid_mask_inv <= temp_hybrid_mask_inv;
            user_trigger_divider <= temp_user_trigger_divider;
            triggers_to_accept <= temp_triggers_to_accept;
        end if;
        if ctrl_fastblock_i.cmd_strobe = '1' then
            if ctrl_fastblock_i.reset = '1' then
                ipb_reset <= '1';
            elsif ctrl_fastblock_i.load_config = '1' then                
                if trigger_state = Running then
                    trigger_stop_loc <= '1';
                end if;
                temp_trigger_source <= cnfg_fastblock_i.trigger_source;
                temp_hybrid_mask_inv <= not cnfg_fastblock_i.stubs_mask(NUM_HYBRIDS-1 downto 0);
                temp_user_trigger_divider <= cnfg_fastblock_i.divider;
                temp_triggers_to_accept <= cnfg_fastblock_i.triggers_to_accept;
                configured <= '1';
            elsif ctrl_fastblock_i.start_trigger = '1' then
                if trigger_state = Idle then
                    trigger_start_loc <= '1';
                end if;
            elsif ctrl_fastblock_i.stop_trigger = '1' then
                if trigger_state = Running then
                    trigger_stop_loc <= '1';
                end if;
            end if;
        end if;
    end if;
end process;

SOURCE_PROCESS: process (reset_int, clk_40MHz)
begin
    if reset_int = '1' then
        status_source <= x"1";
        trigger_checker <= (others => '0');
        no_triggers <= '0';
        checked <= '0';
    elsif rising_edge(clk_40MHz) then
        if reset_counter = '1' then
            checked <= '0';
            trigger_checker <= (others => '0');
        end if;
        if checked = '0' then            
            if trigger_state = Running then                
                -- if no trigger for MAX_TIME_WITHOUT_TRIGGER seconds => bye bye
                if TO_INTEGER(unsigned(trigger_checker)) >= MAX_TIME_WITHOUT_TRIGGER*CLK_40MHZ_NCOUNTS then
                    if counter = x"00000000" then
                        no_triggers <= '1';
                    else
                        no_triggers <= '0';
                    end if;
                    checked <= '1';                    
                else
                    no_triggers <= '0';
                end if;
                trigger_checker <= trigger_checker + 1;                
            end if;            
        end if;
        case trigger_source is
            -- spread L1-Trigger as trigger
            when x"1" =>
                status_source <= x"1";
            -- triggers using stubs from the hybrids, could be coincidence
            when x"2" =>
                status_source <= x"2";
            -- trigger with defined user frequency <= 40MHz
            when x"3" =>
                status_source <= x"3";
            -- no triggers
            when others =>
                status_source <= x"f";
        end case;            
    end if;            
end process;

STATE_PROCESS: process (reset_int, clk_40MHz)
begin
    if reset_int = '1' then
       trigger_state <= Idle;
       error_code <= x"00";
    elsif rising_edge(clk_40MHz) then
        reset_counter <= '0';
        case trigger_state is
            -- Idle
            when Idle =>
                status_state <= '0';
                clock_enable <= '0';
                if trigger_start_loc = '1' then
                    error_code <= x"00";
                    reset_counter <= '1';
                    trigger_state <= Running;
                end if;    
            -- Triggering
            when Running =>                
                status_state <= '1';
                clock_enable <= '1';
                if trigger_stop_loc = '1' then
                    clock_enable <= '0';
                    trigger_state <= Idle;
                elsif no_triggers = '1' then
                    clock_enable <= '0';
                    -- no triggers
                    error_code <= x"03";
                    trigger_state <= Idle;
                elsif triggers_to_accept /= 0 and TO_INTEGER(unsigned(counter))+1 > triggers_to_accept then
                    clock_enable <= '0';
                    trigger_state <= Idle;                
                end if;          
            when others =>
                clock_enable <= '0';
                trigger_state <= Idle;
                -- unknown state
                error_code <= x"01";             
        end case;
    end if;
end process;

COUNTER_PROCESS: process(reset_int, reset_counter, trigger_i)
begin
    if reset_int = '1' or reset_counter = '1' then
        counter <= (others => '0');
    elsif rising_edge(trigger_i) and trigger_state = Running then
        counter <= counter + 1;
    end if;
end process;

end rtl;
