----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2023 10:40:06 AM
-- Design Name: 
-- Module Name: Space_rst - Behavioral
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

entity Space_rst is
    Port (cnt_i : in STD_LOGIC_VECTOR (7 downto 0);
           rst : out STD_LOGIC;
           line : out STD_LOGIC;
           ch_end : out STD_LOGIC
           );
end Space_rst;

architecture Behavioral of Space_rst is
begin
 p_space_rst : process(cnt_i)
    begin
        case cnt_i is
            when "01010101" =>
                rst <= '1';
                line <= '0';     
            when "11110000" =>
                rst <= '1';
                line <= '1';
                when "10110100" =>
                ch_end <= '1';     
            when others =>
            rst <= '0';
             line <= '0';   
             ch_end <= '0';
                 
        end case;
    end process p_space_rst;
end Behavioral;
