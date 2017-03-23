----------------------------------------------------------------------------------
-- Engineer: Jarne de Clercq, Alexandre Leonard, Jelena Luetic -- 
-- Create Date: 12/13/2016 04:37:57 PM
-- Description: Writing generated data to pipeline
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

entity trig_data_pipeline is
Port ( 
    clk_40 : in std_logic;
    reset_i : in std_logic;
    trigger_i : in std_logic;
    --trig_lat_i : in std_logic_vector(8 downto 0);
    data_i : in std_logic_vector(253 downto 0);
    data_o : out std_logic_vector(275 downto 0)
);
end trig_data_pipeline;

architecture Behavioral of trig_data_pipeline is  
    signal pipeline_add_in : integer := 0;
    signal w_enabled: std_logic_vector(0 downto 0) := (others=>'0');
    signal ena: std_logic;
    signal r_enabled: std_logic;
    signal l1_cnt : integer := 0;
    signal tr_event_in : std_logic_vector(275 downto 0);
    signal tr_event_out : std_logic_vector(275 downto 0);
    signal l1_latency : integer := 1;   
begin
-- creating a pipeline instance
pipeline_bram : entity work.cbc3_pipeline
      PORT MAP (
        clka => clk_40,
        ena => ena,
        wea => w_enabled,
        addra => std_logic_vector(to_unsigned(pipeline_add_in,9)),
        dina => tr_event_in,
        clkb => clk_40,
        enb => r_enabled,
        addrb => std_logic_vector(to_unsigned(pipeline_add_in-l1_latency,9)),
        doutb => tr_event_out
      );
    -- l1_latency <= to_integer(unsigned(trig_lat_i));
    -- writing to the pipeline
    write_to_pipe: process (clk_40)
    begin
        if (rising_edge(clk_40)) then
            if (reset_i='1') then
                tr_event_in <=(others=>'0');
                pipeline_add_in <= 0;
            else
            -- writing to the pipeline at 40 MHz   
                ena<='1';
                w_enabled<=(others=>'1');
                tr_event_in <=
                          data_i & 
                          std_logic_vector(to_unsigned(l1_cnt+1,9)) &
                          std_logic_vector(to_unsigned(pipeline_add_in+1,9))&
                          "00" & 
                          "11";
                if (pipeline_add_in+1=512) then
                    pipeline_add_in<=0;
                else
                    pipeline_add_in <= pipeline_add_in+1;
                end if;

            end if; 
        end if;
    end process;
    
    -- reading from the pipeline
    read_from_pipe: process(clk_40)
    begin
        if (rising_edge(clk_40)) then
            r_enabled<='1';
            if (reset_i='1') then
                data_o <= (others=>'0');
                l1_cnt <=0; 
            elsif (trigger_i='1') then
                data_o <= tr_event_out(275 downto 22) & std_logic_vector(to_unsigned(l1_cnt+1,9)) & tr_event_out(12 downto 0);
                -- FIXME implement latency error 
                if (l1_cnt+1=512) then
                    l1_cnt<=0;
                elsif (trigger_i='1') then
                    l1_cnt<=l1_cnt+1;
                end if; -- L1 cnt                 
            else
                data_o <= (others=>'0');
                r_enabled<='1';
            end if; -- trigger
        end if; -- rising edge
    end process;
end Behavioral;
