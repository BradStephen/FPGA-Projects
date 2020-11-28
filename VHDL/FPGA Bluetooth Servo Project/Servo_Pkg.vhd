----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Servo_Pkg
-- Project Name: servo_project
--
-- Additional Comments:
-- PWM Frequency from servo datasheet = 330Hz
-- 100,000,000/330 = 303,030 clock cycles between rising edge of PWM

-- 1/500us = 2000Hz   
-- 100,000,000/2000 = 50,000 clock cycles till falling edge (0 degrees)

-- 1/2000us = 537Hz
-- 100,000,000/537 = 186220 clock cycles till falling edge (180 degrees)

-- 186220 - 50,000 = 136220 (# of clock cycles to get from 0 to 180 degrees)

-- 181 positions incoming from phone
-- 150,000/181 = 829
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Servo_Pkg is

    constant c_System_Clk      : integer := 100_000_000;
    constant c_PWM_Frequency   : integer := 330;
    constant c_Start_Frequency : integer := 2000;
    constant c_End_Frequency   : integer := 537;
    constant c_Num_Of_Values   : integer := 181;

    constant c_PWM_Freq_Clks  : integer := c_System_Clk/c_PWM_Frequency;
    constant c_PWM_Start_Clks : integer := c_System_Clk/c_Start_Frequency;
    constant c_PWM_End_Clks   : integer := c_System_Clk/c_End_Frequency;
    constant c_Control_Range  : integer := c_PWM_End_Clks - c_PWM_Start_Clks;
    constant c_Multiply_By    : integer := c_Control_Range/c_Num_Of_Values;

end Servo_Pkg;