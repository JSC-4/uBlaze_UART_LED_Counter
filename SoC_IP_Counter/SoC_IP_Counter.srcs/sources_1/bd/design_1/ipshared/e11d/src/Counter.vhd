library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter is
    Port ( m_clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR(1 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end Counter;

architecture Behavioral of Counter is
    signal q: std_logic_vector(23 downto 0);
    signal counter: std_logic;
    signal temp_LED: std_logic_vector(15 downto 0);
begin

    process (m_clk,reset)
    begin
        if (reset = '1') then
            q <= (others => '0');
        elsif (rising_edge(m_clk)) then
            q <= std_logic_vector(unsigned(q) + 1);
        end if;
    end process;
    
    counter <= q(23) when (sw = "00") else
               q(22) when (sw = "01") else
               q(21) when (sw = "10") else
               q(20);
     
     process (reset, counter)
     begin
        if (reset = '1') then
            temp_LED <= (others => '0');
        elsif (rising_edge(counter)) then
            temp_LED <= std_logic_vector(unsigned(temp_LED) + 1);
        end if;
     end process;
              
     LED <= temp_LED;
     
end Behavioral;
