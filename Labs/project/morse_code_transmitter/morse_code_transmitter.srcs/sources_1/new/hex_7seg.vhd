------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 21:21:33
-- Design Name: 
-- Module Name: ascii_7seg - Behavioral
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ascii_7seg IS
	PORT
	(
	    reset  : IN std_logic;
		ascii : IN std_logic_vector(7 DOWNTO 0);  
		seg : OUT std_logic_vector(6 DOWNTO 0)    
	);
END ENTITY ascii_7seg;



ARCHITECTURE Behavioral OF ascii_7seg IS
BEGIN
 
p_7seg_decoder : PROCESS (reset,ascii)
	BEGIN
	
	    if (reset = '1') then
      seg <= "1111111";     -- Blanking display
      
    else
	
		CASE ascii IS
	
			WHEN "01000001" =>
				seg <= "0000010"; -- a
			WHEN "01000010" =>
				seg <= "1100000"; -- b
			WHEN "01000011" =>
				seg <= "1110010"; -- c
			WHEN "01000100" =>
				seg <= "1000010"; -- d
			WHEN "01000101" =>
				seg <= "0110000"; -- E
			WHEN "01000110" =>
				seg <= "0111000"; -- F
			WHEN "01000111" =>
				seg <= "0100001"; -- G
			WHEN "01001000" =>
				seg <= "1101000"; -- H
			WHEN "01001001" =>
				seg <= "0111011"; -- I
			WHEN "01001010" =>
				seg <= "0100111"; -- J
			WHEN "01001011" =>
				seg <= "0101000"; -- K
			WHEN "01001100" =>
				seg <= "1110001"; -- L
			WHEN "01001101" =>
				seg <= "0101010"; -- M
			WHEN "01001110" =>
				seg <= "1101010"; -- N
			WHEN "01001111" =>
				seg <= "1100010"; -- O
			WHEN "01010000" =>
				seg <= "0011000"; -- P
			WHEN "01010001" =>
				seg <= "0001100"; -- Q
			WHEN "01010010" =>
				seg <= "1111010"; -- R
			WHEN "01010011" =>
				seg <= "0100101"; -- S
			WHEN "01010100" =>
				seg <= "1110000"; -- T
			WHEN "01010101" =>
				seg <= "1100011"; -- U
			WHEN "01010110" =>
				seg <= "1010101"; -- V
			WHEN "01010111" =>
				seg <= "1010100"; -- W
			WHEN "01011000" =>
				seg <= "1101011"; -- X
			WHEN "01011001" =>
				seg <= "1000100"; -- Y
			WHEN "01011010" =>
				seg <= "0010011"; -- Z
			WHEN "00110000" =>
				seg <= "0000001"; -- 0
			WHEN "00110001" =>
				seg <= "1001111"; -- 1
			WHEN "00110010" =>
				seg <= "0010010"; -- 2
			WHEN "00110011" =>
				seg <= "0000110"; -- 3
			WHEN "00110100" =>
				seg <= "1001100"; -- 4
			WHEN "00110101" =>
				seg <= "0100100"; -- 5
			WHEN "00110110" =>
				seg <= "0100000"; -- 6
			WHEN "00110111" =>
				seg <= "0001111"; -- 7
			WHEN "00111000" =>
				seg <= "0000000"; -- 8
			WHEN "00111001" =>
				seg <= "0000100"; -- 9

			WHEN OTHERS =>
				seg <= "1111111"; -- blank


		END CASE;
		 end if;
	END PROCESS p_7seg_decoder;
END ARCHITECTURE Behavioral;