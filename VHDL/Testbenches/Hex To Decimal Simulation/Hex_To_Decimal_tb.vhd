----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Hex_To_Decimal_tb
-- Project Name: Hex_To_Decimal
--
-- Additional Comments: Testbench for Hex_To_Decimal Module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Hex_To_Decimal_tb is
end Hex_To_Decimal_tb;

architecture RTL of Hex_To_Decimal_tb is

    signal i_Clk        : std_logic                      := '0';
    signal i_Input_Hex  : std_logic_vector (7 downto 0)  := (others => '0');
    signal o_Output_Dec : std_logic_vector (11 downto 0) := (others => '0');

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        i_Input_Hex <= X"39";
        wait for 20 ns;

        -- check
        if (o_Output_Dec = X"057") then
            report "Test Passed" severity note;
        else
            report "Test Failed" severity note;
        end if;

        -- stop simulation
        assert false report "Tests Complete" severity failure;
    end process;

    Hex_To_Decimal_Inst : entity work.Hex_To_Decimal
        port map(
            i_Clk        => i_Clk,
            i_Input_Hex  => i_Input_Hex,
            o_Output_Dec => o_Output_Dec
        );

end RTL;
