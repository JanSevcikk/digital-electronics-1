----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.04.2023 11:45:13
-- Design Name: 
-- Module Name: edge - Behavioral
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


entity edge is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           sig_in : in STD_LOGIC; 
           r_out : out STD_LOGIC;
           f_out : out STD_LOGIC
          );
end edge;

architecture Behavioral of edge is

begin
    
     p_edge : process(clk)   
    begin
        if rising_edge(clk) then
          if(sig_in = '1')  then
          r_out <= '1';
          f_out <= '0';
          else 
          r_out <= '0';
          f_out <= '1';
          end if;
            end if;
    end process p_edge;
    
end architecture Behavioral;