------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2023 20:47:03
-- Design Name: 
-- Module Name: ascii_to_morse - Behavioral
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
USE ieee.numeric_std.ALL;

ENTITY ascii_to_morse IS
	PORT
	(
		ascii   : IN std_logic_vector(7 DOWNTO 0);
		morse   : OUT std_logic_vector(5 DOWNTO 0);
		size : OUT std_logic_vector(5 DOWNTO 0)

	);
END ENTITY ascii_to_morse;
ARCHITECTURE Behavioral OF ascii_to_morse IS
BEGIN
size <= "110000" WHEN (ascii = "01000001") ELSE --A
	            "111100" WHEN (ascii = "01000010") ELSE --B
	            "111100" WHEN (ascii = "01000011") ELSE --C
	            "111000" WHEN (ascii = "01000100") ELSE --D
	            "100000" WHEN (ascii = "01000101") ELSE --E
	            "111100" WHEN (ascii = "01000110") ELSE --F
	            "111000" WHEN (ascii = "01000111") ELSE --G
	            "111100" WHEN (ascii = "01001000") ELSE --H
	            "110000" WHEN (ascii = "01001001") ELSE --I
	            "111100" WHEN (ascii = "01001010") ELSE --J
	            "111000" WHEN (ascii = "01001011") ELSE --K
	            "111100" WHEN (ascii = "01001100") ELSE --L
	            "110000" WHEN (ascii = "01001101") ELSE --M
	            "110000" WHEN (ascii = "01001110") ELSE --N
	            "111000" WHEN (ascii = "01001111") ELSE --O
	            "111100" WHEN (ascii = "01010000") ELSE --P
	            "111100" WHEN (ascii = "01010001") ELSE --Q
	            "111000" WHEN (ascii = "01010010") ELSE --R
	            "111000" WHEN (ascii = "01010011") ELSE --S
	            "100000" WHEN (ascii = "01010100") ELSE --T
	            "111000" WHEN (ascii = "01010101") ELSE --U
	            "111100" WHEN (ascii = "01010110") ELSE --V
	            "111000" WHEN (ascii = "01010111") ELSE --W
	            "111100" WHEN (ascii = "01011000") ELSE --X
	            "111100" WHEN (ascii = "01011001") ELSE --Y
	            "111100" WHEN (ascii = "01011010") ELSE --Z
	            "111110" WHEN (ascii = "00110000") ELSE --0
	            "111110" WHEN (ascii = "00110001") ELSE --1
	            "111110" WHEN (ascii = "00110010") ELSE --2
	            "111110" WHEN (ascii = "00110011") ELSE --3
	            "111110" WHEN (ascii = "00110100") ELSE --4
	            "111110" WHEN (ascii = "00110101") ELSE --5
	            "111110" WHEN (ascii = "00110110") ELSE --6
	            "111110" WHEN (ascii = "00110111") ELSE --7
	            "111110" WHEN (ascii = "00111000") ELSE --8
	            "111110" WHEN (ascii = "00111001") ELSE --9
	            "000000";


	morse <= "100000" WHEN (ascii = "01000001") ELSE  --A
	          "011100" WHEN (ascii = "01000010") ELSE --B
	          "010100" WHEN (ascii = "01000011") ELSE --C
	          "011000" WHEN (ascii = "01000100") ELSE --D
	          "100000" WHEN (ascii = "01000101") ELSE --E
	          "110100" WHEN (ascii = "01000110") ELSE --F
	          "001000" WHEN (ascii = "01000111") ELSE --G
	          "111100" WHEN (ascii = "01001000") ELSE --H
	          "110000" WHEN (ascii = "01001001") ELSE --I
	          "100000" WHEN (ascii = "01001010") ELSE --J
	          "010000" WHEN (ascii = "01001011") ELSE --K
	          "101100" WHEN (ascii = "01001100") ELSE --L
	          "000000" WHEN (ascii = "01001101") ELSE --M
	          "010000" WHEN (ascii = "01001110") ELSE --N
	          "000000" WHEN (ascii = "01001111") ELSE --O
	          "100100" WHEN (ascii = "01010000") ELSE --P
	          "001000" WHEN (ascii = "01010001") ELSE --Q
	          "101000" WHEN (ascii = "01010010") ELSE --R
	          "111000" WHEN (ascii = "01010011") ELSE --S
	          "000000" WHEN (ascii = "01010100") ELSE --T
	          "110000" WHEN (ascii = "01010101") ELSE --U
	          "111000" WHEN (ascii = "01010110") ELSE --V
	          "100000" WHEN (ascii = "01010111") ELSE --W
	          "011000" WHEN (ascii = "01011000") ELSE --X
	          "010000" WHEN (ascii = "01011001") ELSE --Y
	          "001100" WHEN (ascii = "01011010") ELSE --Z
	          "000000" WHEN (ascii = "00110000") ELSE --0
	          "100000" WHEN (ascii = "00110001") ELSE --1
	          "110000" WHEN (ascii = "00110010") ELSE --2
	          "111000" WHEN (ascii = "00110011") ELSE --3
	          "111100" WHEN (ascii = "00110100") ELSE --4
	          "111110" WHEN (ascii = "00110101") ELSE --5
	          "011110" WHEN (ascii = "00110110") ELSE --6
	          "001110" WHEN (ascii = "00110111") ELSE --7
	          "000110" WHEN (ascii = "00111000") ELSE --8
	          "000010" WHEN (ascii = "00111001") ELSE --9
	          "000000";
	          
	          
END ARCHITECTURE Behavioral;