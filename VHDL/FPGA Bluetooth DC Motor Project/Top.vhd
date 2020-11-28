----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Top
-- Project Name: dc_motor_project
--
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.DC_Motor_Pkg.all;

entity Top is
    port (
        i_RX               : in std_logic;
        i_Clk              : in std_logic;
        o_Clockwise        : out std_logic;
        o_Counterclockwise : out std_logic;
        o_Anode            : out std_logic_vector (3 downto 0);
        o_Segment          : out std_logic_vector (7 downto 0);
        o_LED              : out std_logic_vector (15 downto 0)
    );
end Top;

architecture RTL of Top is

    signal r_Control_Range1 : integer range 0 to c_Control_Range - 1 := 0;
    signal r_Control_Range2 : integer range 0 to c_Control_Range - 1 := 0;
    signal r_Control_Range3 : integer range 0 to c_Control_Range - 1 := 0;

    signal r_RX_DV     : std_logic := '0';
    signal r_Input_Hex : std_logic_vector(7 downto 0);
    signal r_Old_Value : integer range 10 to 100 := 10;

    signal w_RX_Byte   : std_logic_vector(7 downto 0);
    signal w_Ouput_Dec : std_logic_vector (11 downto 0);
    signal w_New_Value : integer range 0 to 15 := 0;

    signal w_Dividend : integer range 0 to 4095;
    signal w_Quotient : integer range 0 to 4095;

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then
            if (r_RX_DV = '1') then

                r_Control_Range1 <= to_integer(unsigned(w_RX_Byte));
                r_Control_Range2 <= c_Multiply_By * r_Control_Range1;
                r_Control_Range3 <= r_Control_Range2;

                if (to_integer(unsigned(w_RX_Byte)) > 9) then
                    r_Old_Value <= to_integer(unsigned(w_RX_Byte));
                    r_Input_Hex <= w_RX_Byte;
                end if;

            end if;
        end if;
    end process;

    DC_Motor_Control_Inst : entity work.DC_Motor_Control
        port map(
            i_Clk              => i_Clk,
            i_Control_Range    => r_Control_Range3,
            o_Clockwise        => o_Clockwise,
            o_Counterclockwise => o_Counterclockwise
        );

    UART_RX_Inst : entity work.UART_RX
        generic map(
            g_System_Clk => 100000000,
            g_Baud_Rate  => 9600
        )
        port map(
            i_Clk     => i_Clk,
            i_RX      => i_RX,
            o_RX_Byte => w_RX_Byte,
            o_RX_DV   => r_RX_DV
        );

    Seven_Seg_Inst : entity work.Seven_Seg
        port map(
            i_Clk     => i_Clk,
            i_Digit_1 => w_Ouput_Dec(3 downto 0),
            i_Digit_2 => w_Ouput_Dec(7 downto 4),
            i_Digit_3 => w_Ouput_Dec(11 downto 8),
            i_Digit_4 => (others => '0'),
            o_Anode   => o_Anode,
            o_Segment => o_Segment
        );

    Hex_To_Decimal_Inst : entity work.Hex_To_Decimal
        port map(
            i_Clk        => i_Clk,
            i_Input_Hex  => r_Input_Hex,
            o_Output_Dec => w_Ouput_Dec
        );

    Range_Converter_Inst : entity work.Range_Converter
        generic map(
            g_Old_Max => 100,
            g_Old_Min => 10,
            g_New_Max => 15,
            g_New_Min => 0
        )
        port map(
            i_Clk          => i_Clk,
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
            i_Clk      => i_Clk,
            i_Dividend => w_Dividend,
            i_Divisor  => 90,
            o_Quotient => w_Quotient
        );

    LED_Inst : entity work.LED
        port map(
            i_Clk       => i_Clk,
            i_LED_Value => w_New_Value,
            o_LED       => o_LED
        );

end RTL;