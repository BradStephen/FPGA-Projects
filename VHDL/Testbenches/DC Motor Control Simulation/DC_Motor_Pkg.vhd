----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: DC_Motor_Pkg
-- Project Name: DC_Motor_Control
--
-- Additional Comments:
-- PWM Frequency set to 30Hz
-- 100,000,000/30 = 3_333_333 clock cycles between rising edge of PWM

-- g_PWM_Start_Clks : set to 0 for 0% duty cycle

-- g_PWM_Start_Clks : set to 1,000,000 for 100% duty cycle

-- 1,000,000 - 0 = 1,000,000 (# of clock cycles to get from 0 to 100% duty cycle)
-- 101 values incoming from phone
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package DC_Motor_Pkg is

    constant c_System_Clk    : integer := 100_000_000;
    constant c_PWM_Frequency : integer := 30;
    constant c_Num_Of_Values : integer := 101;

    constant c_PWM_Freq_Clks  : integer := c_System_Clk/c_PWM_Frequency;
    constant c_PWM_Start_Clks : integer := 0;
    constant c_Control_Range  : integer := c_PWM_Freq_Clks;
    constant c_Multiply_By    : integer := c_Control_Range/c_Num_Of_Values;

end DC_Motor_Pkg;