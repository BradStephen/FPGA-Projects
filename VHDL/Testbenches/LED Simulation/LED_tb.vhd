----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: LED_tb
-- Project Name: LED
--
-- Additional Comments: Testbench for LED Module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LED_tb is
end LED_tb;

architecture RTL of LED_tb is

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

    signal i_Clk       : std_logic                      := '0';
    signal i_LED_Value : integer range 0 to 15          := 0;
    signal o_LED       : std_logic_vector (15 downto 0) := (others => '0');

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin

        i_LED_Value <= 7;
        wait for 20 ns;

        -- check
        if (o_LED = X"0080") then
            report "Test Passed" severity note;
        else
            report "Test Failed" severity note;
        end if;

        -- stop simulation
        assert false report "Tests Complete" severity failure;
    end process;

    LED_Inst : entity work.LED
        port map(
            i_Clk       => i_Clk,
            i_LED_Value => i_LED_Value,
            o_LED       => o_LED
        );

end RTL;