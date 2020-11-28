----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Divider
-- Project Name: dc_motor_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider is
    generic (
        g_Width : integer := 11
    );
    port (
        i_Clk      : in std_logic;
        i_Dividend : in integer range 0 to 4095;
        i_Divisor  : in integer range 0 to 4095;
        o_Quotient : out integer range 0 to 4095
    );
end Divider;

architecture RTL of Divider is

    constant c_Count_Limit : integer := g_Width;

    type t_State is (s_1, s_2);
    signal r_State : t_State := s_1;

    signal r_Count : integer range 0 to g_Width        := 1;
    signal r_Index : integer range -g_Width to g_Width := 0;

    signal r_Quotient   : unsigned (g_Width downto 0) := (others => '0');
    signal r_Remainder  : unsigned (g_Width downto 0) := (others => '0');
    signal r_Dividend   : unsigned (g_Width downto 0) := (others => '0');
    
    signal r_Dividend_1 : unsigned (0 to 0)           := "0";
    signal r_Dividend_2 : unsigned (0 to 0)           := "0";
    signal r_Dividend_3 : unsigned (0 to 0)           := "0";

begin

    r_Dividend <= to_unsigned(i_Dividend, r_Dividend'length);

    r_Dividend_1 <= (others => r_Dividend(g_Width));
    r_Dividend_2 <= (others => r_Dividend(g_Width - 1));

    r_Index      <= g_Width - 1 - r_Count;
    r_Dividend_3 <= (others => r_Dividend(r_Index))when(r_Index >= 0)
        else
        (others => '0');

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            case r_State is
                when s_1 =>

                    if (i_Divisor > r_Dividend_1) then
                        r_Quotient(g_Width) <= '0';
                        r_Remainder         <= resize(((((r_Dividend_1 - 0) & '0') + r_Dividend_2)), 12);
                    else
                        r_Quotient(g_Width) <= '1';
                        r_Remainder         <= resize(((((r_Dividend_1 - i_Divisor) & '0') + r_Dividend_2)), 12);
                    end if;

                    r_State <= s_2;

                when s_2 =>

                    if (i_Divisor > r_Remainder) then
                        r_Quotient(g_Width - r_Count) <= '0';
                        if (r_Index >= 0) then
                            r_Remainder <= resize(((((r_Remainder - 0) & '0') + r_Dividend_3)), 12);
                        else
                            r_Remainder <= (others => 'X');
                        end if;
                    else
                        r_Quotient(g_Width - r_Count) <= '1';
                        if (r_Index >= 0) then
                            r_Remainder <= resize(((((r_Remainder - i_Divisor) & '0') + r_Dividend_3)), 12);
                        else
                            r_Remainder <= (others => 'X');
                        end if;
                    end if;

                    if (r_Count < c_Count_Limit) then
                        r_Count <= r_Count + 1;
                        r_State <= s_2;

                    else
                        r_Count <= 1;
                        r_State <= s_1;
                    end if;

            end case;
        end if;
    end process;

    o_Quotient <= to_integer(unsigned(r_Quotient));

end RTL;