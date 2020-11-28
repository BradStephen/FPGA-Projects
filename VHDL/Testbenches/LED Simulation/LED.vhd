----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: LED
-- Project Name: LED
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED is
    port (
        i_Clk       : in std_logic;
        i_LED_Value : in integer range 0 to 15;
        --i_LED_Value : in std_logic_vector (0 to 3);
        o_LED       : out std_logic_vector (15 downto 0)
    );
end LED;

architecture RTL of LED is

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            o_LED              <= (others => '0');
            o_LED(i_LED_Value) <= '1';
            --o_LED(to_integer(unsigned(i_LED_Value))) <= '1';

        end if;
    end process;

end RTL;


