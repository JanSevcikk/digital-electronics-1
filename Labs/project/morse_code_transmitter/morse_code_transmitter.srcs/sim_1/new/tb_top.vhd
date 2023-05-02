----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 21:08:03
-- Design Name: 
-- Module Name: tb_top - Behavioral
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
library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
	-- Entity of testbench is always empty
end entity tb_top;


architecture testbench of tb_top is
	constant c_CLK_100MHZ_PERIOD : time := 10 ns;
	signal s_clk_100MHz : std_logic;
	signal s_reset      : std_logic;
	signal s_morse       : std_logic_vector(7 downto 0);
	signal s_seg        : std_logic_vector(6 downto 0);
	signal s_start      : std_logic;
	signal s_pos       : std_logic;
	signal s_transmit      : std_logic;

begin
	-- UUT instantiation
	uut_dri : entity work.top
		port map (
			CLK100MHZ => s_clk_100MHz,
			BTNC      => s_reset,
			SW        => s_morse,
			CA        => s_seg(6),
			CB        => s_seg(5),
			CC        => s_seg(4),
			CD        => s_seg(3),
			CE        => s_seg(2),
			CF        => s_seg(1),
			CG        => s_seg(0),
		    BTNL      => s_start,
			LED(0)   => s_pos,
			LED(1)   => s_transmit 
		);

	-- Clock generation process
	p_clk_gen : process
	begin
		while now < 300000 ns loop -- 250 usec of simulation
			s_clk_100MHz <= '0';
			wait for c_CLK_100MHZ_PERIOD / 2;
			s_clk_100MHz <= '1';
			wait for c_CLK_100MHZ_PERIOD / 2;
		end loop;
		wait;
	end process p_clk_gen;

	-- Reset generation process
	p_reset_gen : process
	begin
		s_reset <= '1';
		wait for 70 ns;
		s_reset <= '0';
		wait;
	end process p_reset_gen;

	-- Start transmitting process
	p_start : process
	begin
		s_start <= '0';
		wait for 100 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		s_start <= '1';
		wait for 15 ns;
		s_start <= '0';
		wait for 805 ns;
		
		
		
				
		
	end process p_start;

	-- Data generation process
	p_stimulus : process
	begin
	s_morse <= "00000000"; -- empty
		wait for 75 ns;
	   s_morse <= "01000001"; -- a
		wait for 820 ns;
		s_morse <= "01000010"; -- b
		wait for 820 ns;
		s_morse <= "01000011"; -- c
		wait for 820 ns;
	    s_morse <= "01000100"; -- d
		wait for 820 ns;
	    s_morse <= "01000101"; -- e
		wait for 820 ns;
	   s_morse <= "01000110"; -- f
		wait for 820 ns;
		s_morse <= "01000111"; -- g
		wait for 820 ns;
		s_morse <= "01001000"; -- h
		wait for 820 ns;
		s_morse <= "01001001"; -- i
		wait for 820 ns;
		s_morse <= "01001010"; -- j
		wait for 820 ns;
		s_morse <= "01001011"; -- k
		wait for 820 ns;
		s_morse <= "01001100"; -- l
		wait for 820 ns;
		s_morse <= "01001101"; -- m
		wait for 820 ns;
		s_morse <= "01001110"; -- n
		wait for 820 ns;
		s_morse <= "01001111"; -- o
		wait for 820 ns;
		s_morse <= "01010000"; -- p
		wait for 820 ns;
		s_morse <= "01010001"; -- q
		wait for 820 ns;
		s_morse <= "01010010"; -- r
		wait for 820 ns;
		s_morse <= "01010011"; -- s
		wait for 820 ns;
		s_morse <= "01010100"; -- t
		wait for 820 ns;
		s_morse <= "01010101"; -- u
		wait for 820 ns;
		s_morse <= "01010110"; -- v
		wait for 820 ns;
		s_morse <= "01010111"; -- w
		wait for 820 ns;
		s_morse <= "01011000"; -- x
		wait for 820 ns;
		s_morse <= "01011001"; -- y
		wait for 820 ns;
		s_morse <= "01011010"; -- z
		wait for 820 ns;
		s_morse <= "00110000"; -- 0
		wait for 820 ns;
		s_morse <= "00110001"; -- 1
		wait for 820 ns;
		s_morse <= "00110010"; -- 2
		wait for 820 ns;
		s_morse <= "00110011"; -- 3
		wait for 820 ns;
		s_morse <= "00110100"; -- 4
		wait for 820 ns;
		s_morse <= "00110101"; -- 5
		wait for 820 ns;
		s_morse <= "00110110"; -- 6
		wait for 820 ns;
		s_morse <= "00110111"; -- 7
		wait for 820 ns;
		s_morse <= "00111000"; -- 8
		wait for 820 ns;
		s_morse <= "00111001"; -- 9
		wait for 820 ns;
		s_morse <= "00000000"; -- blank
		wait for 820 ns;
		
		wait;
	end process p_stimulus;
end architecture testbench;
