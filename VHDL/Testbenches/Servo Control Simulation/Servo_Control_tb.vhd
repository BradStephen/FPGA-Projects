----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Servo_Control_tb
-- Project Name: Servo_Control
--
-- Additional Comments: Testbench for Servo_Control Module
-- Run simulation for 10 ms.
-- o_Servo signal should display PWM with 50% duty cycle.  
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Servo_Control_tb is
end Servo_Control_tb;

library work;
use work.Servo_Pkg.all;

architecture RTL of Servo_Control_tb is

    signal i_Clk           : std_logic                              := '1';
    signal i_Control_Range : integer range 0 to c_Control_Range - 1 := 0;
    signal o_Servo         : std_logic                              := '0';

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        i_Control_Range <= c_Multiply_By * 133;
        wait for 1000 ns;

    end process;

    Servo_Control_Inst : entity work.Servo_Control
        port map(
            i_Clk           => i_Clk,
            i_Control_Range => i_Control_Range,
            o_Servo         => o_Servo
        );

end RTL;