library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------

entity hex_7seg is
  port (
    blank : in    std_logic;                    --! Display is clear if blank = 1
    inp   : in    std_logic_vector(7 downto 0); --! Binary representation of one hexadecimal symbol
    seg   : out   std_logic_vector(6 downto 0)  --! Seven active-low segments in the order: a, b, ..., g
  );
end entity hex_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------

architecture behavioral of hex_7seg is

begin

  --------------------------------------------------------
  -- p_7seg_decoder:
  -- A combinational process for 7-segment display (Common
  -- Anode) decoder. Any time "hex" or "blank" is changed,
  -- the process is "executed". Output pin seg(6) controls
  -- segment A, seg(5) segment B, etc.
  --     segment A
  --      | segment B
  --      |  | segment C
  --      +-+|  |   ...   segment G
  --        ||+-+          |
  --        |||            |
  -- seg = "0000001"-------+
  --
  -- Display is clear/blank if signal blank = 1.
  --------------------------------------------------------

  p_7seg_decoder : process (blank, inp) is  

  begin

    if (blank = '1') then
      seg <= "1111111";     -- Blanking display
    else

      case inp is

        when "00110000" =>

          seg <= "0000001"; -- 0

        when "00110001" =>

          seg <= "1001111"; -- 1
       
        when "00110010" =>

          seg <= "0010010"; -- 2
        
        when "00110011" =>

          seg <= "0000110"; -- 3
          
        when "00110100" =>

          seg <= "1001100"; -- 4
          
        when "00110101" =>

          seg <= "0100100"; -- 5
          
        when "00110110" =>

          seg <= "0100000"; -- 6
        
        when "00110111" =>

          seg <= "0001111"; -- 7
       
        when "00111000" =>

          seg <= "0000000"; -- 8
         
        when "00111001" =>

          seg <= "0000100"; -- 9
         
        when "01000001" =>

          seg <= "0001000"; -- A
         
        when "01000010" =>

          seg <= "1100000"; -- b
        
        when "01000011" =>

          seg <= "0110001"; -- C
        
        when "01000100" =>

          seg <= "1000010"; -- d
        
        when "01000101" =>

          seg <= "0110000"; -- E

        when "01000110" =>

          seg <= "0111000"; -- F

        when "01000111" =>

          seg <= "0100001"; -- G
          
        when "01001000" =>

          seg <= "1101000"; -- H

        when "01001001" =>

          seg <= "1111001"; -- I
          
        when "01001010" =>

          seg <= "1000011"; -- J
          
        when "01001011" =>

          seg <= "0101000"; -- K
          
        when "01001100" =>

          seg <= "1110001"; -- L
          
        when "01001101" =>

          seg <= "0101011"; -- M
          
        when "01001110" =>

          seg <= "0001001"; -- N
          
        when "01001111" =>

          seg <= "0000001"; -- O   
          
        when "01010000" =>

          seg <= "0011000"; -- P
          
        when "01010001" =>

          seg <= "0001100"; -- Q
          
        when "01010010" =>

          seg <= "0011001"; -- R
          
        when "01010011" =>

          seg <= "0100100"; -- S 
          
        when "01010100" =>

          seg <= "1110000"; -- T
          
        when "01010101" =>

          seg <= "1000001"; -- U   
          
        when "01010110" =>

          seg <= "1000101"; -- V 
          
        when "01010111" =>

          seg <= "1010101"; -- W
        
        when "01011000" =>

          seg <= "1001000"; -- X  
        
        when "01011001" =>

          seg <= "1000100"; -- Y 
          
        when "01011010" =>

          seg <= "0010110"; -- Z
        
        when others =>

          seg <= "0000000"; -- all                
      end case;

    end if;

  end process p_7seg_decoder;

end architecture behavioral;
