------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.04.2023 22:24:15
-- Design Name: 
-- Module Name: top - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top IS
	PORT
	(
		CLK100MHZ : IN STD_LOGIC;                    
		SW        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		LED       : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		CA        : OUT STD_LOGIC;                    
		CB        : OUT STD_LOGIC;
		CC        : OUT STD_LOGIC;
		CD        : OUT STD_LOGIC;
		CE        : OUT STD_LOGIC;
		CF        : OUT STD_LOGIC;
		CG        : OUT STD_LOGIC;
		AN        : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); 
        BTNL      : IN STD_LOGIC; 
	    BTNC      : IN STD_LOGIC 
	);
END top;

ARCHITECTURE Behavioral of top is
BEGIN
	
	morse_transmitter : ENTITY work.morse_transmitter
		PORT MAP
		(
			clk              => CLK100MHZ,
			reset            => BTNC,

            ascii(7)         => SW(7),
            ascii(6)         => SW(6),
			ascii(5)         => SW(5),
			ascii(4)         => SW(4),
			ascii(3)         => SW(3),
			ascii(2)         => SW(2),
			ascii(1)         => SW(1),
			ascii(0)         => SW(0),
			start_b          => BTNL,
			transmit_out     => LED(1),
			position         => LED(0)
			
		);

ascii2seg : ENTITY work.ascii_7seg
    PORT MAP
    ( 
        reset             => BTNC,
        ascii(7)         => SW(7),
        ascii(6)         => SW(6),
        ascii(5)         => SW(5),
        ascii(4)         => SW(4),
        ascii(3)         => SW(3),
        ascii(2)         => SW(2),
        ascii(1)         => SW(1),
        ascii(0)         => SW(0),
        seg(6)          => CA,
        seg(5)          => CB,
        seg(4)          => CC,
        seg(3)          => CD,
        seg(2)          => CE,
        seg(1)          => CF,
        seg(0)          => CG
 );
    
      AN <= b"1111_1110";
    
				
END Behavioral;