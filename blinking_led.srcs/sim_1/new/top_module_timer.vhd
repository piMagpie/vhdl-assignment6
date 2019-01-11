library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module_timer is
    Port ( 
            sysclk : in STD_LOGIC;
            led5_r : out STD_LOGIC;
            led5_g : out STD_LOGIC;
            led5_b : out STD_LOGIC
    );
end top_module_timer;

architecture Behavioral of top_module_timer is
     -- component declaration
   component timer is
       Port ( clock : in STD_LOGIC;
              tick_number : in INTEGER;
              reset : in STD_LOGIC;
              done : out STD_LOGIC);    
   end component;
   
   component pwm is
        Port ( clock : in STD_LOGIC;
             R : in INTEGER;
             G : in INTEGER;
             B : in INTEGER;
             R_MOD : out STD_LOGIC;
             G_MOD : out STD_LOGIC;
             B_MOD : out STD_LOGIC);
   end component;
   
   signal tick_number : INTEGER := 125000000;
   signal reset : std_logic := '0';
   
   -- timer
   signal done : STD_LOGIC := '0';
   
   -- RGB signals
   signal R : INTEGER := 128;
   signal G : INTEGER := 128;
   signal B : INTEGER := 128;
   
begin
    dut: timer port map( 
       clock => sysclk,
       tick_number => tick_number, -- 1 second
       reset => reset,
       done => done); -- led5_r
    
     dutt: pwm port map( 
             clock => sysclk,
             R => R,
             G => G,
             B => B,
             R_MOD => led5_r,
             G_MOD => led5_g,
             B_MOD => led5_b);      
    
    process(sysclk,done)
        constant r_orange : INTEGER := 255;
        constant g_orange : INTEGER := 128;
        constant b_orange : INTEGER := 0;
        
        constant r_pink : INTEGER := 255;
        constant g_pink : INTEGER := 64;
        constant b_pink : INTEGER := 128;
        
        variable flag : BOOLEAN := FALSE;
    begin
        if rising_edge(sysclk) then
            if (done = '1') then
                if (flag) then
                    R <= r_orange;
                    G <= g_orange;
                    B <= b_orange;
                else
                     R <= r_pink;
                     G <= g_pink;
                     B <= b_pink;
                end if;
                flag := not flag;
            end if;
        end if;
    end process;
end Behavioral;
