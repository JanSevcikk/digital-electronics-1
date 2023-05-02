------------------------------------------------------------
--
-- Testbench for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_top is
-- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_top is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
  -- Testbench local signals
  signal sig_CLK100MHZ : std_logic;
  signal sig_rst : std_logic;
  signal sig_inp   : std_logic;
  signal sig_CA : STD_LOGIC;
  signal sig_CB : STD_LOGIC;
  signal sig_CC : STD_LOGIC;
  signal sig_CD : STD_LOGIC;
  signal sig_CE : STD_LOGIC;
  signal sig_CF : STD_LOGIC;
  signal sig_CG : STD_LOGIC;
  

begin

  -- Connecting testbench signals with decoder entity
  -- (Unit Under Test)
  uut_top : entity work.top
    port map (
      CLk100MHZ => sig_CLK100MHZ,
      BTNC => sig_rst,
      JA   => sig_inp,
      CA => sig_CA,
      CB => sig_CB,
      CC => sig_CC,
      CD => sig_CD,
      CE => sig_CE,
      CF => sig_CF,
      CG => sig_CG
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
 p_clk_gen : process is
    begin
        while now < 100000 ns loop -- 30 periods of 100MHz clock
            sig_CLK100MHZ <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            sig_CLK100MHZ <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                -- Process is suspended forever
    end process p_clk_gen;
 
  p_reset_gen : process is
    begin
         wait for 10 ns;
        sig_rst <= '1';
         wait for 10 ns;
        sig_rst <= '0';
         
        wait;
    end process p_reset_gen;
 
 p_stimulus : process is
    begin
        report "Stimulus process started";
        sig_inp <='0'; wait for 6000 ns;
        sig_inp <='1'; wait for 1750 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 1750 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 1750 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 5000 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 5000 ns;
        sig_inp <='0'; wait for 7000 ns;
        sig_inp <='1'; wait for 1750 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 1750 ns;
        sig_inp <='0'; wait for 1750 ns;
        sig_inp <='1'; wait for 5000 ns;
        sig_inp <='0'; wait for 7000 ns;

        report "Stimulus process finished";
        wait;
    end process p_stimulus;
end architecture testbench;
