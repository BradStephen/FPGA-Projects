----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Servo_Control
-- Project Name: servo_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.Servo_Pkg.all;

entity Servo_Control is
    port (
        i_Clk           : in std_logic;
        i_Control_Range : in integer range 0 to c_Control_Range - 1 := 0;
        o_Servo         : out std_logic
    );
end Servo_Control;

architecture RTL of Servo_Control is

    signal r_Counter : integer range 0 to c_PWM_Freq_Clks - 1 := 0;
    signal r_PWM     : std_logic                              := '0';

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            if (r_Counter < c_PWM_Freq_Clks - 1) then
                r_Counter <= r_Counter + 1;

            elsif (r_Counter = c_PWM_Freq_Clks - 1) then
                r_Counter <= 0;
            end if;

            if (r_Counter < (c_PWM_Start_Clks + i_Control_Range)) then
                r_PWM <= '1';
            else
                r_PWM <= '0';
            end if;
        end if;
    end process;

    o_Servo <= r_PWM;

end RTL;