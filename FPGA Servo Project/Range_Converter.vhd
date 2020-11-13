----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Range_Converter
-- Project Name: servo_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Range_Converter is
    generic (
        g_Old_Max : integer := 180;
        g_Old_Min : integer := 0;
        g_New_Max : integer := 15;
        g_New_Min : integer := 0
    );
    port (
        i_Clk       : in std_logic;
        i_Old_Value : in integer range g_Old_Min to g_Old_Max;
        o_New_Value : out integer range g_New_Min to g_New_Max
    );
end Range_Converter;

architecture RTL of Range_Converter is

    constant c_Old_Range : integer := (g_Old_Max - g_Old_Min);
    constant c_New_Range : integer := (g_New_Max - g_New_Min);
    constant c_Reg_Max   : integer := (g_Old_Max * c_New_Range);

    signal reg1 : integer range 0 to g_Old_Max := 0;
    signal reg2 : integer range 0 to c_Reg_Max := 0;
    signal reg3 : integer range 0 to c_Reg_Max := 0;
    signal reg4 : integer range 0 to c_Reg_Max := 0;
    signal reg5 : integer range 0 to g_Old_Max := 0;

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            reg1 <= i_Old_Value - g_Old_Min;
            reg2 <= reg1 * c_New_Range;
            reg3 <= reg2;
            reg4 <= reg3 / c_Old_Range;
            reg5 <= reg4 + g_New_Min;

        end if;
    end process;

    o_New_Value <= reg5;

end RTL;