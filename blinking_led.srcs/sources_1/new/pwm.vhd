----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/10/2019 06:00:00 PM
-- Design Name: 
-- Module Name: pwm - Behavioral
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

entity pwm is
    Port ( clock : in STD_LOGIC;
           R : in INTEGER;
           G : in INTEGER;
           B : in INTEGER;
           R_MOD : out STD_LOGIC;
           G_MOD : out STD_LOGIC;
           B_MOD : out STD_LOGIC);
end pwm;

architecture Behavioral of pwm is

begin
    pwd : process (clock, R, G, B)
        variable counter : integer := 0;
        variable red,blue,green : integer;
        
        function get_output_led(number_value : INTEGER; counter : INTEGER )  return std_logic is
        begin
         if (counter < number_value) then
               return '1';
           else
               return '0';
           end if; 
           
        end get_output_led;
    begin
         if(rising_edge(clock)) then
            
            if counter = 255 then
                counter := 0;
            end if;

            R_MOD <= get_output_led(R,counter);
            G_MOD <= get_output_led(G,counter);
            B_MOD <= get_output_led(B,counter);
            
            counter := counter + 1;
         end if;
    end process;

end Behavioral;
