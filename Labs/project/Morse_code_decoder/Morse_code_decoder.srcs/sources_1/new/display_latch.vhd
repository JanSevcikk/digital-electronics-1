----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2023 04:14:12 PM
-- Design Name: 
-- Module Name: display_latch - Behavioral
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

entity display_latch is
Port ( latch_in : in STD_LOGIC;
           rst : in STD_LOGIC;
           asci_in : in std_logic_vector(7 downto 0);
           asci_out : out STD_LOGIC_VECTOR (7 downto 0));
end display_latch;

architecture Behavioral of display_latch is

    begin

 d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => latch_in,
          rst   => rst,
          d => asci_in(0),
          q => asci_out(0)
      );

  d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => latch_in,
          rst   => rst,
          d => asci_in(1),
          q => asci_out(1)
      );
    d_ff_2 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(2),
              q => asci_out(2)
          );
          
    d_ff_3 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(3),
              q => asci_out(3)
          );
          d_ff_4 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(4),
              q => asci_out(4)
          );
           d_ff_5 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(5),
              q => asci_out(5)
          );
          d_ff_6 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(6),
              q => asci_out(6)
          );
          d_ff_7 : entity work.d_ff_rst
          port map(
              clk   => latch_in,
              rst   => rst,
              d => asci_in(7),
              q => asci_out(7)
          );
  
    
end Behavioral;
