----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: UART_RX_tb
-- Project Name: UART_RX
--
-- Additional Comments: Testbench for UART_RX Module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_RX_tb is
end UART_RX_tb;

architecture RTL of UART_RX_tb is

    signal i_Clk     : std_logic                    := '1';
    signal i_RX      : std_logic                    := '0';
    signal o_RX_DV   : std_logic                    := '0';
    signal o_RX_Byte : std_logic_vector(7 downto 0) := (others => '0');

    constant c_RX_Test     : std_logic_vector(7 downto 0) := X"AA";
    -- 1/100,000,000
    constant c_Clk_Period  : time                         := 10 ns;
    -- 1/9600
    --constant c_Baud_Period : time                         := 104.17 us;
    constant c_Baud_Period : time                         := 104170 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;

    -- input stimulus
    process
    begin
        -- start bit
        i_RX <= '0';
        wait for c_Baud_Period;
        -- data bits
        for i in 0 to 7 loop
            i_RX <= c_RX_Test(i);
            wait for c_Baud_Period;
        end loop;
        -- stop bit
        i_RX <= '1';
        wait for c_Baud_Period;

        -- check
        if (o_RX_Byte = X"AA") then
            report "Test Passed" severity note;
        else
            report "Test Failed" severity note;
        end if;

        -- stop simulation
        assert false report "Tests Complete" severity failure;
    end process;

    UART_RX_Inst : entity work.UART_RX
        generic map(
            g_System_Clk => 100_000_000,
            g_Baud_Rate  => 9600
        )
        port map(
            i_Clk     => i_Clk,
            i_RX      => i_RX,
            o_RX_DV   => o_RX_DV,
            o_RX_Byte => o_RX_Byte
        );
        
end RTL;



