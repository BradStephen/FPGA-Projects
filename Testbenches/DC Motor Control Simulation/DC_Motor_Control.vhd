----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: DC_Motor_Control
-- Project Name: DC_Motor_Control
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.DC_Motor_Pkg.all;

entity DC_Motor_Control is

    port (
        i_Clk              : in std_logic;
        i_Control_Range    : in integer range 0 to c_Control_Range - 1;
        o_Clockwise        : out std_logic;
        o_Counterclockwise : out std_logic
    );

end DC_Motor_Control;

architecture RTL of DC_Motor_Control is

    signal r_PWM               : std_logic                              := '0';
    signal r_Freq_Counter      : integer range 0 to c_PWM_Freq_Clks - 1 := 0;
    signal r_Select            : integer range 0 to 2                   := 0;
    signal r_Control_Range     : integer range 0 to c_Control_Range - 1 := 10 * c_Multiply_By;
    signal r_Control_Direction : integer range 0 to c_Control_Range - 1 := 0;

begin
    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            if (r_Freq_Counter < c_PWM_Freq_Clks - 1) then
                r_Freq_Counter <= r_Freq_Counter + 1;

            elsif (r_Freq_Counter = c_PWM_Freq_Clks - 1) then
                r_Freq_Counter <= 0;

            end if;

            if (i_Control_Range < 10 * c_Multiply_By) then
                r_Control_Direction <= i_Control_Range;
            else
                r_Control_Range <= i_Control_Range;
            end if;

            if (r_Control_Direction = 0 * c_Multiply_By) then -- 0 OFF
                r_Select <= 0;

            elsif (r_Control_Direction = 1 * c_Multiply_By) then -- 1 Clockwise
                r_Select <= 1;

            elsif (r_Control_Direction = 2 * c_Multiply_By) then -- 2 Counterclockwise
                r_Select <= 2;
            end if;

            if (r_Freq_Counter < (c_PWM_Start_Clks + r_Control_Range)) then
                r_PWM <= '1';
            else
                r_PWM <= '0';
            end if;

        end if;
    end process;

    with r_select select
        o_Clockwise <= '0' when 0,
        '0' when 1,
        r_PWM when 2;

    with r_select select
        o_Counterclockwise <= '0' when 0,
        r_PWM when 1,
        '0' when 2;

end RTL;