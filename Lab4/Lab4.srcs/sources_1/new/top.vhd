-- Top-Level Module: RS232 Receiver with 7-Segment Display
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Top is
    Port (
        clk_i : in STD_LOGIC;              
        rst_i : in STD_LOGIC;              
        RXD_i : in STD_LOGIC;              
        led7_an_o : out STD_LOGIC_VECTOR(3 downto 0); 
        led7_seg_o : out STD_LOGIC_VECTOR(7 downto 0) 
    );
end Top;

architecture Behavioral of Top is
    component RS232_Receiver is
        Port (
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            RXD_i : in STD_LOGIC;
            data_o : out STD_LOGIC_VECTOR(7 downto 0);
            data_ready_o : out STD_LOGIC
        );
    end component;

    component Display_Controller is
        Port (
            clk_i : in STD_LOGIC;
            rst_i : in STD_LOGIC;
            data_i : in STD_LOGIC_VECTOR(7 downto 0);
            led7_an_o : out STD_LOGIC_VECTOR(3 downto 0);
            led7_seg_o : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Signals
    signal data_ready : STD_LOGIC;
    signal data_reg : STD_LOGIC_VECTOR(7 downto 0);

begin
    
    RS232_Receiver_Inst : RS232_Receiver
        Port map (
            clk_i => clk_i,
            rst_i => rst_i,
            RXD_i => RXD_i,
            data_o => data_reg,
            data_ready_o => data_ready
        );

    
    Display_Controller_Inst : Display_Controller
        Port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => data_reg,
            led7_an_o => led7_an_o,
            led7_seg_o => led7_seg_o
        );

end Behavioral;
