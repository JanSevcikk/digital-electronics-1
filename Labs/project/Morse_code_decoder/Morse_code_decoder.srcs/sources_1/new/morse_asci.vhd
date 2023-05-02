----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 02:14:24 PM
-- Design Name: 
-- Module Name: morse_asci - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_asci is
    Port ( morse_in : in STD_LOGIC_VECTOR (9 downto 0);
           blank : in std_logic;
           Asci : out STD_LOGIC_VECTOR (7 downto 0)
            
           );
end morse_asci;

architecture Behavioral of morse_asci is

begin

p_morse_asc : process (blank, morse_in) is   --ak ma za sebou zavorku takteda sa spusta signal
  --tak je to sensitivilis a teda ak aspon jeden zmeni hodnotu tak sa proces vykona,je to sekvencni signal
  --je tu sktiktura a blank je rovne 1 tak sa nahra 1 

  begin

    if (blank = '1') then
      Asci <= "00000000";     -- Blanking display
    else

      case morse_in is

        when "1001000000" =>

          Asci <= "01000001"; -- A
          
        when "0110101000" =>

          Asci <= "01000010"; -- B

        when "0110011000" =>

          Asci <= "01000011"; -- C

        when "0110100000" =>

          Asci <= "01000100"; -- D
           
         when "1000000000" =>

          Asci <= "01000101"; -- E

         when "1010011000" =>

          Asci <= "01000110"; -- F
          
         when "0101100000" =>

          Asci <= "01000111"; -- G
  
         when "1010101000" =>

          Asci <= "01001000"; -- H
         
          when "1010000000" =>

          Asci <= "01001001"; -- I
          
          when "1001010100" =>

          Asci <= "01001010"; -- J
          
           when "0110010000" =>

          Asci <= "01001011"; -- K
         
          when "1001101000" =>

          Asci <= "01001100"; -- L 
        
          when "0101000000" =>

          Asci <= "01001101"; -- M  
          
          when "0110000000" =>

          Asci <= "01001110"; -- N 
          
          when "0101010000" =>

          Asci <= "01001111"; -- O
          
          when "1001011000" =>

          Asci <= "01010000"; -- P
          
          when "0101100100" =>

          Asci <= "01010001"; -- Q
          
          when "1001100000" =>

          Asci <= "01010010"; -- R
          
          when "1010100000" =>

          Asci <= "01010011"; -- S
          
          when "0100000000" =>

          Asci <= "01010100"; -- T
          
          when "1010010000" =>

          Asci <= "01010101"; -- U
          
          when "1010100100" =>

          Asci <= "01010110"; -- V
          
          when "1001010000" =>

          Asci <= "01010111"; -- W
          
          when "0110100100" =>

          Asci <= "01011000"; -- X
          
          when "0110010100" =>

          Asci <= "01011001"; -- Y
          
          when "0101101000" =>

          Asci <= "01011010"; -- Z
          
          when "1001010101" =>

          Asci <= "00110001"; -- 1
          
          when "1010010101" =>

          Asci <= "00110010"; -- 2
          
          when "1010100101" =>

          Asci <= "00110011"; -- 3
          
          when "1010101001" =>

          Asci <= "00110100"; -- 4
          
          when "1010101010" =>

          Asci <= "00110101"; -- 5
          
          when "0110101010" =>

          Asci <= "00110110"; -- 6
          
          when "0101101010" =>

          Asci <= "00110111"; -- 7
          
          when "0101011010" =>

          Asci <= "00111000"; -- 8
          
          when "0101010110" =>

          Asci <= "00111001"; -- 9
          
          when "0101010101" =>

          Asci <= "00110000"; -- 0

        when others =>

          Asci <= "00000000";  
        
end case;

    end if;

  end process p_morse_asc;

end Behavioral;
