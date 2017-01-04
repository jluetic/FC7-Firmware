----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2016 04:55:38 PM
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.VComponents.all;

entity clock_divider is
    port(
        i_clk         : in  std_logic;
        i_rst         : in  std_logic;
        i_clk_divider : in  std_logic_vector(31 downto 0);
        o_clk         : out std_logic
    );
end clock_divider;

architecture rtl of clock_divider is
    signal r_clk_counter        : unsigned(31 downto 0) := (others => '0');
    signal r_clk_divider        : unsigned(31 downto 0);
    signal r_clk_divider_half   : unsigned(31 downto 0);
    signal reset_internal       : std_logic := '0';
    signal i_clk_divider_prev   : std_logic_vector(31 downto 0);
    signal o_clk_int            : std_logic := '0';
    signal trigger_selector    : std_logic;
begin

    trigger_selector <= '1' when TO_INTEGER(unsigned(i_clk_divider)) > 1 else '0';

    --===================================--
    UserTriggerMux : BUFGCTRL  
    --===================================--
    generic map (  
        INIT_OUT     => 0,  
        PRESELECT_I0 => FALSE,  
        PRESELECT_I1 => FALSE)  
        port map (  
        O       => o_clk,  
        CE0     => '1',  
        CE1     => '1',  
        I0      => i_clk,  
        I1      => o_clk_int,  
        IGNORE0 => '1',  
        IGNORE1 => '1',  
        S0      => not trigger_selector, -- Clock select0 input  
        S1      => trigger_selector -- Clock select1 input  
    );
    --===================================--

    p_clk_divider: process(i_rst,reset_internal,i_clk_divider,i_clk)
    begin
        if(i_rst='1' or reset_internal='1') then
            reset_internal      <= '0';
            r_clk_counter       <= (others=>'0');
            r_clk_divider       <= (others=>'0');
            r_clk_divider_half  <= (others=>'0');
            o_clk_int               <= '0';
        elsif(i_clk_divider /= i_clk_divider_prev) then
            i_clk_divider_prev  <= i_clk_divider;
            reset_internal      <= '1';
        elsif(rising_edge(i_clk)) then
            r_clk_divider       <= unsigned(i_clk_divider)-1;
            r_clk_divider_half  <= unsigned('0'&i_clk_divider(31 downto 1)); -- half
            
            if(r_clk_counter < r_clk_divider_half) then 
                r_clk_counter   <= r_clk_counter + 1;
                o_clk_int           <= '0';
            elsif(r_clk_counter = r_clk_divider) then
                r_clk_counter   <= (others=>'0');
                o_clk_int           <= '1';
            else
                r_clk_counter   <= r_clk_counter + 1;
                o_clk_int           <= '1';
            end if;
        end if;
    end process p_clk_divider;
end rtl;
