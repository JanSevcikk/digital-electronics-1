-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2023 15:27:16
-- Design Name: 
-- Module Name: dot_line_detector - Behavioral
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

entity dot_line_detector is
    Port (
        cnt_i : in STD_LOGIC_VECTOR (7 downto 0);
        line : out std_logic;
        dot : out std_logic
    );
end dot_line_detector;

architecture Behavioral of dot_line_detector is

begin
    p_dot_line_detector : process(cnt_i)
    begin
        if(cnt_i >="10000000") then
                dot <= '0';
               line <= '1';
        else if(cnt_i >="01010110" ) then
                dot <= '1';
               line <= '0';  
        else if(cnt_i >="00000000") then
                dot <= '0';
               line <= '0';    
         
             end if;
             end if;    
             end if;
    end process p_dot_line_detector;
end Behavioral;