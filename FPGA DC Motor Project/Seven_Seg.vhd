----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Seven_Seg
-- Project Name: de_motor_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Seven_Seg is
    port (
        i_Clk     : in std_logic;
        i_Digit_1 : in std_logic_vector (3 downto 0);
        i_Digit_2 : in std_logic_vector (3 downto 0);
        i_Digit_3 : in std_logic_vector (3 downto 0);
        i_Digit_4 : in std_logic_vector (3 downto 0);
        o_Anode   : out std_logic_vector (3 downto 0);
        o_Segment : out std_logic_vector (7 downto 0)
    );
end Seven_Seg;

architecture RTL of Seven_Seg is

    constant c_Refresh_Limit : integer                            := 5000;
    signal r_Refresh_Counter : integer range 0 to c_Refresh_Limit := 0;
    signal r_Refresh         : unsigned (1 downto 0)              := "00";
    signal r_Digit           : std_logic_vector (3 downto 0)      := (others => '0');

begin

    process (i_Clk)
    begin
        if (rising_edge(i_Clk)) then

            case r_Digit is

                when "0000" => o_Segment <= "11000000"; -- "0" 
                when "0001" => o_Segment <= "11111001"; -- "1"
                when "0010" => o_Segment <= "10100100"; -- "2"
                when "0011" => o_Segment <= "10110000"; -- "3"
                when "0100" => o_Segment <= "10011001"; -- "4"
                when "0101" => o_Segment <= "10010010"; -- "5"
                when "0110" => o_Segment <= "10000010"; -- "6"
                when "0111" => o_Segment <= "11111000"; -- "7"
                when "1000" => o_Segment <= "10000000"; -- "8" 
                when "1001" => o_Segment <= "10010000"; -- "9"

                when "1010" => o_Segment <= "10100000"; -- a
                when "1011" => o_Segment <= "10000011"; -- b
                when "1100" => o_Segment <= "11000110"; -- C
                when "1101" => o_Segment <= "10100001"; -- d
                when "1110" => o_Segment <= "10000110"; -- E
                when "1111" => o_Segment <= "10001110"; -- F

                when others => o_Segment <= "11000000";

            end case;

            if (r_Refresh_Counter < c_Refresh_Limit) then
                r_Refresh_Counter <= r_Refresh_Counter + 1;

            elsif (r_Refresh_Counter = c_Refresh_Limit) then
                r_Refresh_Counter <= 0;

                case r_Refresh is

                    when "00" =>
                        o_Anode <= "1110";
                        r_Digit <= i_Digit_1;

                    when "01" =>
                        o_Anode <= "1101";
                        r_Digit <= i_Digit_2;

                    when "10" =>
                        o_Anode <= "1011";
                        r_Digit <= i_Digit_3;

                    when "11" =>
                        o_Anode <= "0111";
                        r_Digit <= i_Digit_4;

                end case;

                r_Refresh <= r_Refresh + "01";

            end if;
        end if;
    end process;
end RTL;