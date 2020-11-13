----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: LED
-- Project Name: dc_motor_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity LED is
    port (
        i_Clk       : in std_logic;
        i_LED_Value : in integer range 0 to 15;
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

        end if;
    end process;

end RTL;

