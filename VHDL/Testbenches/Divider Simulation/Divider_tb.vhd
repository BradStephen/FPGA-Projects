----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Divider_tb
-- Project Name: Divider
--
-- Additional Comments: Testbench for Divider Module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider_tb is
end Divider_tb;

architecture RTL of Divider_tb is

    constant g_Width : integer := 11;

    signal i_Clk      : std_logic                   := '0';
    signal i_Dividend : integer range 0 to 4095 := 0;
    signal i_Divisor  : integer range 0 to 4095 := 0;
    signal o_Quotient : integer range 0 to 4095;

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        i_Dividend <= 1500;
        i_Divisor  <= 90;
        wait for 1 us;

        -- check
        if (o_Quotient = 16) then
            report "Test Passed" severity note;
        else
            report "Test Failed" severity note;
        end if;

        -- stop simulation
        assert false report "Tests Complete" severity failure;
    end process;

    Divider_Inst : entity work.Divider
        generic map(
            g_Width => 11
        )
        port map(
            i_Clk      => i_Clk,
            i_Dividend => i_Dividend,
            i_Divisor  => i_Divisor,
            o_Quotient => o_Quotient
        );

end RTL;