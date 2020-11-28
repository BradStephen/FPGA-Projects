----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: DC_Motor_Control_tb
-- Project Name: DC_Motor_Control
--
-- Additional Comments: Testbench for DC_Motor_Control Module
-- Run simulation for 100 ms.
-- Counterclockwise signal should display PWM with 50% duty cycle.  
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DC_Motor_Control_tb is
end DC_Motor_Control_tb;

library work;
use work.DC_Motor_Pkg.all;

architecture RTL of DC_Motor_Control_tb is

    signal i_Clk              : std_logic                              := '1';
    signal i_Control_Range    : integer range 0 to c_Control_Range - 1 := 0;
    signal o_Clockwise        : std_logic                              := '0';
    signal o_Counterclockwise : std_logic                              := '0';

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        i_Control_Range <= c_Multiply_By * 1;
        wait for 100 ns;

        i_Control_Range <= c_Multiply_By * 50;
        wait for 1000 ns;

        -- check waveform for PWM signal on counterclockwise output

    end process;

    DC_Motor_Control_Inst : entity work.DC_Motor_Control
        port map(
            i_Clk              => i_Clk,
            i_Control_Range    => i_Control_Range,
            o_Clockwise        => o_Clockwise,
            o_Counterclockwise => o_Counterclockwise
        );

end RTL;
