----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2023 10:48:58 AM
-- Design Name: 
-- Module Name: decodere - Behavioral
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

entity decodere is
    Port ( clk : in STD_LOGIC;
           input: in STD_LOGIC;
           rst : in std_logic;
           seg   : out   std_logic_vector(6 downto 0);
          space_out : out std_logic
           );
           
end decodere;

architecture Behavioral of decodere is
signal sig_clk : std_logic;   
signal sig_reising_edge : std_logic; 
signal sig_falling_edge : std_logic; 
signal sig_rst : std_logic;
signal sig_dot : std_logic;
signal sig_line : std_logic;
signal sig_space : std_logic;
signal sig_latch_clk : std_logic;
signal sig_cnt_out: STD_LOGIC_VECTOR (7 downto 0);
signal sig_dot_out : STD_LOGIC_VECTOR (4 downto 0);
signal sig_line_out : STD_LOGIC_VECTOR (4 downto 0);
signal sig_cnt_out_space: STD_LOGIC_VECTOR (7 downto 0); 
signal sig_asci: STD_LOGIC_VECTOR (7 downto 0);
signal sig_latch: STD_LOGIC_VECTOR (7 downto 0); 
begin
clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 2
      )
      port map(
          clk => clk,
          rst => rst,
          ce  => sig_clk
      );
 bin_cnt0 : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 8
      )
      port map(
          clk => sig_clk,
         rst => sig_rst,
         cnt_up=>'1',
         en=>sig_reising_edge,
         cnt=>sig_cnt_out
      );
      edge0: entity work.edge
      port map(
      clk=> sig_clk,
      rst=>rst,
      sig_in=>input,
      r_out=>sig_reising_edge,
      f_out=>sig_falling_edge
      
      );
      dot_line_detector0: entity work.dot_line_detector
      port map(
      
      cnt_i=>sig_cnt_out,
      dot=>sig_dot,
      line=>sig_line
      
      );
      bin_cnt1 : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 8
      )
      port map(
          clk => sig_clk,
         rst => sig_reising_edge,
         cnt_up=>'1',
         en=>sig_falling_edge,
         cnt=>sig_cnt_out_space
      );
      Space_rst0: entity work.Space_rst
      port map(
      
      cnt_i=>sig_cnt_out_space,
     rst=>sig_rst,
     line=> sig_space,
     ch_end => sig_latch_clk
      );
       Shift_reg0: entity work.shift_register
      port map(
      
      clk100MHz=> sig_rst,      
     rst=> sig_space,
     dot_lin=> sig_dot,
     morse=>sig_dot_out
      );
      Shift_reg1: entity work.shift_register
      port map(
      
      clk100MHz=> sig_rst,      
     rst=> sig_space,
     dot_lin=> sig_line,
     morse=>sig_line_out
      );
      Morse_asci: entity work.morse_asci
      port map(
     blank=>sig_latch_clk,
     morse_in(1)=> sig_dot_out(0),
     morse_in(0)=> sig_line_out(0),
     morse_in(3)=> sig_dot_out(1),
     morse_in(2)=> sig_line_out(1),
     morse_in(5)=> sig_dot_out(2),
     morse_in(4)=> sig_line_out(2),
     morse_in(7)=> sig_dot_out(3),
     morse_in(6)=> sig_line_out(3),
     morse_in(9)=> sig_dot_out(4),
     morse_in(8)=> sig_line_out(4),
     Asci=> sig_latch
      );
      segment_display: entity work.hex_7seg
      port map(
     blank=>rst,
     inp=> sig_asci,
     seg=> seg
     
      );
       latch_display: entity work.display_latch
      port map(
     rst=>rst,
     asci_in=> sig_latch,
     asci_out=> sig_asci,
     latch_in => sig_latch_clk
      );
      
end Behavioral;
