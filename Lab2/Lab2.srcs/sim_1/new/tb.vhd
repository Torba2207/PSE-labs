----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 06:54:38 PM
-- Design Name: 
-- Module Name: tb - Behavioral
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

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is

component top
    Port (  clk_i : in STD_LOGIC;

           rst_i : in STD_LOGIC;

           led_o : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal clk_i_tb     : STD_LOGIC :='0';
signal rst_i_tb     : STD_LOGIC :='0';
signal led_o_tb     : STD_LOGIC_VECTOR (2 downto 0);
constant period     : TIME := 200ms;
begin
    uut: top PORT MAP (
        clk_i => clk_i_tb,
        rst_i => rst_i_tb,
        led_o => led_o_tb
    );
clk_i_tb <= not clk_i_tb after period/2;
process
begin
    rst_i_tb<='1';
    wait for period;
    rst_i_tb<='0';
    wait for 2*period;
    rst_i_tb<='1';
    wait for period;
    rst_i_tb<='0';
    wait;
end process;
end Behavioral;
