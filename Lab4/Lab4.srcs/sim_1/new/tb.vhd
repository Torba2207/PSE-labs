-- Testbench for Top-Level Module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb is
end tb;

architecture Behavioral of tb is
    component Top is
        Port (
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            RXD_i : in STD_LOGIC;
            led7_an_o : out STD_LOGIC_VECTOR(3 downto 0);
            led7_seg_o : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal clk_i : STD_LOGIC := '0';
    signal rst_i : STD_LOGIC := '1';
    signal RXD_i : STD_LOGIC := '1';
    signal led7_an_o : STD_LOGIC_VECTOR(3 downto 0);
    signal led7_seg_o : STD_LOGIC_VECTOR(7 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT : Top
        Port map (
            clk_i => clk_i,
            rst_i => rst_i,
            RXD_i => RXD_i,
            led7_an_o => led7_an_o,
            led7_seg_o => led7_seg_o
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk_i <= '0';
            wait for CLK_PERIOD / 2;
            clk_i <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;


    stimulus_process : process
    begin

        rst_i <= '1';
        wait for 100 ns;
        rst_i <= '0';

        -- Send start bit
        RXD_i <= '0';
        wait for 104.1667 us; -- 1 bit for 9600 

        RXD_i <= '1'; -- Bit 0
        wait for 104.1667 us;
        RXD_i <= '1'; -- Bit 1
        wait for 104.1667 us;
        RXD_i <= '0'; -- Bit 2
        wait for 104.1667 us;
        RXD_i <= '0'; -- Bit 3
        wait for 104.1667 us;
        RXD_i <= '1'; -- Bit 4
        wait for 104.1667 us;
        RXD_i <= '0'; -- Bit 5
        wait for 104.1667 us;
        RXD_i <= '1'; -- Bit 6
        wait for 104.1667 us;
        RXD_i <= '0'; -- Bit 7
        wait for 104.1667 us;

        -- Send stop bit
        RXD_i <= '1';
        wait for 104.1667 us;

        wait for 1 ms;
        
        
        -- Send start bit
        RXD_i <= '0';
        wait for 100us; -- 1 bit for 9600

        -- Send data bits 
        RXD_i <= '1'; -- Bit 0
        wait for 100us;
        RXD_i <= '1'; -- Bit 1
        wait for 100us;
        RXD_i <= '0'; -- Bit 2
        wait for 100us;
        RXD_i <= '0'; -- Bit 3
        wait for 100us;
        RXD_i <= '1'; -- Bit 4
        wait for 100us;
        RXD_i <= '0'; -- Bit 5
        wait for 100us;
        RXD_i <= '1'; -- Bit 6
        wait for 100us;
        RXD_i <= '0'; -- Bit 7
        wait for 100us;

        -- Send stop bit 
        RXD_i <= '1';
        wait for 100us;

        -- Wait for data to be displayed
        wait for 1 ms;
        
        
                -- Send start bit
        RXD_i <= '0';
        wait for 108.3333 us; -- 1 bit for 9600

        -- Send data bits
        RXD_i <= '1'; -- Bit 0
        wait for 108.3333 us;
        RXD_i <= '1'; -- Bit 1
        wait for 108.3333 us;
        RXD_i <= '0'; -- Bit 2
        wait for 108.3333 us;
        RXD_i <= '0'; -- Bit 3
        wait for 108.3333 us;
        RXD_i <= '1'; -- Bit 4
        wait for 108.3333 us;
        RXD_i <= '0'; -- Bit 5
        wait for 108.3333 us;
        RXD_i <= '1'; -- Bit 6
        wait for 108.3333 us;
        RXD_i <= '0'; -- Bit 7
        wait for 108.3333 us;

        -- Send stop bit
        RXD_i <= '1';
        wait for 108.3333 us;

        -- Wait for data to be displayed
        wait for 1 ms;

        
        wait;
    end process;

end Behavioral;
