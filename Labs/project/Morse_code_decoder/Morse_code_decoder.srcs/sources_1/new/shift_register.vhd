---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2023 15:59:04
-- Design Name: 
-- Module Name: shift_register - Behavioral
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

entity shift_register is
  Port ( CLK100MHZ : in STD_LOGIC;
           rst : in STD_LOGIC;
           dot_lin : in STD_LOGIC;
           morse : out STD_LOGIC_VECTOR (4 downto 0));
end shift_register;

architecture Behavioral of shift_register is
 signal s_ff0 : std_logic;
  signal s_ff1 : std_logic;
  signal s_ff2 : std_logic;
  signal s_ff3 : std_logic;
  signal s_ff4 : std_logic;
  
begin

 d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => rst,
          d => dot_lin,
          q => s_ff0
      );

  d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => rst,
          d => s_ff0,
          q => s_ff1
      );
    d_ff_2 : entity work.d_ff_rst
          port map(
              clk   => CLK100MHZ,
              rst   => rst,
              d => s_ff1,
              q => s_ff2
          );
          
    d_ff_3 : entity work.d_ff_rst
          port map(
              clk   => CLK100MHZ,
              rst   => rst,
              d => s_ff2,
              q => s_ff3
          );
          d_ff_4 : entity work.d_ff_rst
          port map(
              clk   => CLK100MHZ,
              rst   => rst,
              d => s_ff3,
              q => s_ff4
          );
     
          
   morse(0) <= s_ff0;
     morse(1) <= s_ff1;
     morse(2) <= s_ff2;
     morse(3) <= s_ff3;
     morse(4) <= s_ff4;
  
    
    
    
end Behavioral;