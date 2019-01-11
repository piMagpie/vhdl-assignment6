library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer_test is
-- empty
end timer_test;

architecture Behavioral of timer_test is

    -- component declaration
    component timer is
        Port ( clock : in STD_LOGIC;
               tick_number : in INTEGER;
               reset : in STD_LOGIC;
               done : out STD_LOGIC);    
    end component;
    
    constant CLK_PERIOD : time := 20ns;
    
    signal clock : std_logic := '1';
    signal tick_number : INTEGER := 10;
    signal reset : std_logic := '0';
    signal doneT : std_logic := '1';
begin

    -- clock signal
    -- clock <= not clock after 50 ns;

    -- component instantiation
    dut: timer port map( 
        clock => clock,
        tick_number => tick_number,
        reset => reset,
        done => doneT);
    
    process
    begin
        reset <= '0';
        tick_number <= 3;
        wait for CLK_PERIOD * 10;
    
        tick_number <= 5;
        reset <= '1';
        wait for CLK_PERIOD;
        reset <= '0';
        wait for CLK_PERIOD * 10;
        
    end process;
    
    CLK_generation: process
    begin
        clock <='1';
        wait for CLK_PERIOD/2;
        clock <= '0';
        wait for CLK_PERIOD/2;
    end process CLK_generation;
    
end Behavioral;
