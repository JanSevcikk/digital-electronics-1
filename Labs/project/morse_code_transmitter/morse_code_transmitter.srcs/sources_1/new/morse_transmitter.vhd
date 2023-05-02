------------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.04.2023 23:02:46
-- Design Name: 
-- Module Name: morse_transmitter - Behavioral
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


ENTITY morse_transmitter IS
	PORT
	(
		reset : IN std_logic;
		clk   : IN std_logic;
		position       : OUT std_logic;
		transmit_out : OUT std_logic;
		ascii  : IN std_logic_vector (7 DOWNTO 0);
		start_b : IN std_logic	
	);
END ENTITY morse_transmitter;




ARCHITECTURE Behavioral OF morse_transmitter IS
 
	SIGNAL s_en           : std_logic;
	SIGNAL s_morse        : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_size         : std_logic_vector(5 DOWNTO 0);
	SIGNAL s_cnt          : unsigned(4 DOWNTO 0);
	CONSTANT c_DELAY_1SEC : unsigned(4 DOWNTO 0) := b"0_0100";
	CONSTANT c_DELAY_2SEC : unsigned(4 DOWNTO 0) := b"0_1000";
	CONSTANT c_DELAY_3SEC : unsigned(4 DOWNTO 0) := b"0_1000";
	CONSTANT c_DELAY_4SEC : unsigned(4 DOWNTO 0) := b"1_0000";
	CONSTANT c_ZERO       : unsigned(4 DOWNTO 0) := b"0_0000";
	TYPE led_position IS (start, symbol0, symbol1, symbol2, symbol3, symbol4, symbol5, wait0, wait1, wait2, wait3, wait4, wait5);
    TYPE t_position IS (input, transmit);
    SIGNAL s_position    : led_position;
	SIGNAL s_transmit    : t_position;
	
BEGIN
--------------------------------------------------------
-- Instance (copy) of clock_enable entity generates
-- an enable pulse every 250 ms (4 Hz). Remember that
-- the frequency of the clock signal is 100 MHz.
--------------------------------------------------------
clk_en0 : ENTITY work.clock_enable
        GENERIC MAP
        (
        g_MAX => 25000000 -- 1 FOR SIMULATION PURPOSE ONLY !!!
        -- FOR IMPLEMENTATION: g_MAX = 250 ms(25000000) / (1/100 MHz)
        )
        PORT MAP
        (
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );
        
  
ascii_to_morse : ENTITY work.ascii_to_morse
        
PORT MAP
(
 ascii   => ascii,
 size => s_size,
 morse   => s_morse

);
    
    
		

    p_morse_transmitter_FSM : PROCESS (clk)
    BEGIN
    IF rising_edge(clk) THEN
    IF (reset = '1') THEN -- Synchronous reset
    s_transmit   <= input; -- Set initial state
    s_position <= start;
    s_cnt       <= c_ZERO; -- Clear delay counter
    ELSIF (s_en = '1') THEN
    -- Every 250 ms, CASE checks the value of the s_transmit
    -- variable and changes to the next state according
    -- to the delay value.
    CASE s_transmit IS
    -- If the current state is input, then wait for start_b
    -- to become '1' and move to state transmit.
    WHEN input =>
    IF (start_b /= '1') THEN
    ELSE
    s_transmit <= transmit;
    s_cnt     <= c_ZERO;
    END IF;
    WHEN transmit =>
    
    
    -- DOT=1, DASH=0
    CASE s_position IS
    
    WHEN start =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(5) = '1') THEN
    s_position <= symbol0;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    
    --FIRST symbol
    WHEN symbol0 =>
    
    IF (s_morse(5) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(4) = '1') THEN
    s_position <= wait0;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(5) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(4) = '1') THEN
    s_position <= wait0;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    
    
    WHEN wait0 =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(4) = '1') THEN
    
    s_position <= symbol1;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    
    
    --SECOND symbol
    WHEN symbol1 =>
    
    IF (s_morse(4) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    s_position <= wait1;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(4) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    s_position <= wait1;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    WHEN wait1 =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    
    s_position <= symbol2;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    --THIRD symbol
    WHEN symbol2 =>
    
    IF (s_size(3) = '1') THEN
    IF (s_morse(3) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(2) = '1') THEN
    s_position <= wait2;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(3) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(2) = '1') THEN
    s_position <= wait2;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    
    END IF;
    
    
    WHEN wait2 =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    
    s_position <= symbol3;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    --FOURTH symbol
    WHEN symbol3 =>
    
    IF (s_size(2) = '1') THEN
    IF (s_morse(2) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(1) = '1') THEN
    s_position <= wait3;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(2) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(1) = '1') THEN
    s_position <= wait3;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    
    END IF;
    
    WHEN wait3 =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    
    s_position <= symbol4;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
 
    --FIFTH symbol
    WHEN symbol4 =>
    IF (s_size(1) = '1') THEN
    IF (s_morse(1) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(0) = '1') THEN
    s_position <= wait4;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(1) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(0) = '1') THEN
    s_position <= wait4;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    END IF;
   
    
    WHEN wait4 =>
    
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- Move to the next state if next size bit is '1' else end transmission
    IF (s_size(3) = '1') THEN
    
    s_position <= symbol5;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    END IF;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    --SIXTH symbol
    WHEN symbol5 =>
    
    IF (s_size(0) = '1') THEN
    IF (s_morse(0) = '1') THEN
    IF (s_cnt < c_DELAY_1SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    
    ELSIF (s_morse(0) = '0') THEN
    IF (s_cnt < c_DELAY_2SEC) THEN
    s_cnt <= s_cnt + 1;
    ELSE
    -- END OF TRANSMISSION
    s_position <= start;
    s_transmit   <= input;
    -- Reset local counter value
    s_cnt <= c_ZERO;
    END IF;
    END IF;
    END IF;
    

    WHEN OTHERS =>
    s_transmit   <= input;
    s_position <= start;
    s_cnt       <= c_ZERO;
    
    
    END CASE;
    
   
    WHEN OTHERS =>
    s_transmit   <= input;
    s_position <= symbol0;
    s_cnt       <= c_ZERO;
    
    END CASE;
    END IF; 
    END IF; 
    END PROCESS p_morse_transmitter_FSM;
    
    
  
    p_morse_transmitter_output : PROCESS (s_position)
    BEGIN
    CASE s_position IS
    WHEN start =>
    
    transmit_out <= '0';
    
    WHEN symbol0 =>
    
    transmit_out <= '1';
    WHEN symbol1 =>
    
    transmit_out <= '1';
    WHEN symbol2 =>
    
    transmit_out <= '1';
    WHEN symbol3 =>
    
    transmit_out <= '1';
    WHEN symbol4 =>
    
    transmit_out <= '1';
    WHEN symbol5 =>
    
    transmit_out <= '1';
    WHEN OTHERS =>
    
    transmit_out <= '0';
    
    END CASE;
    END PROCESS p_morse_transmitter_output;
    
    
    
    --RLED
    p_morse_gen_position_output : PROCESS (s_transmit)
    BEGIN
    CASE s_transmit IS
    WHEN input => 
    position <= '0';
    
    WHEN transmit =>
     position <= '1';
     
    WHEN OTHERS =>
     position <= '0';
     
    END CASE;
    END PROCESS p_morse_gen_position_output;
    END ARCHITECTURE Behavioral;
