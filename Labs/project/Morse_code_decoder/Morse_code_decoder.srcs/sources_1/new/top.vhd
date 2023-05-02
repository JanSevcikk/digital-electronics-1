


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( 
          CLK100MHZ : in std_logic; 
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           JA : in STD_LOGIC
           );
          
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
  
begin

   morse_decodere : entity work.decodere
      port map (
            clk    => CLK100MHZ,
             input => JA,
             rst   => BTNC,
             seg(6) => CA,
             seg(5) => CB,
             seg(4) => CC,
             seg(3) => CD,
             seg(2) => CE,
             seg(1) => CF,
             seg(0) => CG 
          );
           AN <= b"1111_0111";
           

 

end architecture behavioral;