----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/27/2018 07:37:34 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( 
            sysclk : in STD_LOGIC;
            led5_r : out STD_LOGIC;
            led5_g : out STD_LOGIC;
            led5_b : out STD_LOGIC
    );
end top_module;

architecture Behavioral of top_module is
    COMPONENT led
    Port ( 
        refclk : in  std_logic;
        led : out std_logic);
    END COMPONENT;
    
begin
    dut: led PORT MAP(
        refclk => sysclk,
        led => led5_r
   );
end Behavioral;
