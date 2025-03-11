----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 04:54:20 PM
-- Design Name: 
-- Module Name: top - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is

    Port ( clk_i : in STD_LOGIC;

           rst_i : in STD_LOGIC;

           led_o : out STD_LOGIC_VECTOR (2 downto 0));

end top;

architecture Behavioral of top is

signal b: STD_LOGIC_VECTOR(2 downto 0);


begin
process(clk_i, rst_i,b)
begin
if(rst_i='1') then b<="000";
    elsif(rising_edge(clk_i))then
        b<=b+1;
end if;


led_o(2)<=b(2);
led_o(1)<=b(1) xor b(2);
led_o(0)<=b(1) xor b(0);


end process;
end Behavioral;
