----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Range_Converter_tb
-- Project Name: Range_Converter
--
-- Additional Comments: Testbench for Range_Converter Module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Range_Converter_tb is
end Range_Converter_tb;

architecture RTL of Range_Converter_tb is

    signal r_Clk       : std_logic               := '0';
    signal r_Old_Value : integer range 10 to 100 := 10;
    signal w_New_Value : integer range 0 to 15;

    signal w_Dividend : integer range 0 to 4095;
    signal w_Quotient : integer range 0 to 4095;

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    r_Clk <= not r_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        r_Old_Value <= 70;
        wait for 1 us;

        -- check
        if (w_New_Value = 10) then
            report "Test Passed" severity note;
        else
            report "Test Failed" severity note;
        end if;

        -- stop simulation
        assert false report "Tests Complete" severity failure;
    end process;

    Range_Converter_Inst : entity work.Range_Converter
        generic map(
            g_Old_Max => 100,
            g_Old_Min => 10,
            g_New_Max => 15,
            g_New_Min => 0
        )
        port map(
            i_Clk          => r_Clk,
            i_Old_Value    => r_Old_Value,
            i_From_Divider => w_Quotient,
            o_To_Divider   => w_Dividend,
            o_New_Value    => w_New_Value
        );

    Divider_Inst : entity work.Divider
        generic map(
            g_Width => 11
        )
        port map(
            i_Clk      => r_Clk,
            i_Dividend => w_Dividend,
            i_Divisor  => 90,
            o_Quotient => w_Quotient
        );

end RTL;