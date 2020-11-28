----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Hex_To_Decimal
-- Project Name: Hex_To_Decimal
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Hex_To_Decimal is
    port (
        i_Clk        : in std_logic;
        i_Input_Hex  : in std_logic_vector (7 downto 0);
        o_Output_Dec : out std_logic_vector (11 downto 0)
    );
end Hex_To_Decimal;

architecture RTL of Hex_To_Decimal is

    signal r_Output_Dec       : unsigned (11 downto 0) := (others => '0');
    signal r_Int              : integer range 0 to 180 := 0;
    signal r_Input_Hex_Resize : unsigned (11 downto 0) := (others => '0');

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            r_Input_Hex_Resize <= unsigned(resize(unsigned(i_Input_Hex), r_Input_Hex_Resize'length));
            r_Int              <= to_integer(unsigned(i_Input_Hex));

            if (r_Int > 9) and (r_Int < 20) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 1);

            elsif (r_Int > 19) and (r_Int < 30) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 2);

            elsif (r_Int > 29) and (r_Int < 40) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 3);

            elsif (r_Int > 39) and (r_Int < 50) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 4);

            elsif (r_Int > 49) and (r_Int < 60) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 5);

            elsif (r_Int > 59) and (r_Int < 70) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 6);

            elsif (r_Int > 69) and (r_Int < 80) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 7);

            elsif (r_Int > 79) and (r_Int < 90) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 8);

            elsif (r_Int > 89) and (r_Int < 100) then
                r_Output_Dec <= r_Input_Hex_Resize + (6 * 9);

            elsif (r_Int > 99) and (r_Int < 110) then
                r_Output_Dec <= r_Input_Hex_Resize + (156);

            elsif (r_Int > 109) and (r_Int < 120) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 1);

            elsif (r_Int > 119) and (r_Int < 130) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 2);

            elsif (r_Int > 129) and (r_Int < 140) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 3);

            elsif (r_Int > 139) and (r_Int < 150) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 4);

            elsif (r_Int > 149) and (r_Int < 160) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 5);

            elsif (r_Int > 159) and (r_Int < 170) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 6);

            elsif (r_Int > 169) and (r_Int < 180) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 7);

            elsif (r_Int > 179) and (r_Int < 190) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 8);

            elsif (r_Int > 189) and (r_Int < 200) then
                r_Output_Dec <= r_Input_Hex_Resize + (156 + 6 * 9);

            else
                r_Output_Dec <= r_Input_Hex_Resize;

            end if;
        end if;
    end process;

    o_Output_Dec <= std_logic_vector(r_Output_Dec);

end RTL;