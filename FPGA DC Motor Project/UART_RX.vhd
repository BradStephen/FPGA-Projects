----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: UART_RX
-- Project Name: dc_motor_project
--
-- Additional Comments: Based on nandland.com framework
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_RX is
    generic (
        g_System_Clk : integer := 100_000_000;
        g_Baud_Rate  : integer := 9600
    );
    port (
        i_Clk     : in std_logic;
        i_RX      : in std_logic;
        o_RX_DV   : out std_logic;
        o_RX_Byte : out std_logic_vector(7 downto 0)
    );
end UART_RX;

architecture RTL of UART_RX is

    constant c_Sampling_Limit : integer := ((g_System_Clk/g_Baud_Rate) - 1);
    type t_State is (s_Idle, s_Start, s_Read_Data, s_Stop);

    signal r_State            : t_State                             := s_Idle;
    signal r_Sampling_Counter : integer range 0 to c_Sampling_Limit := 0;
    signal r_Byte_Index       : integer range 0 to 7                := 0;
    signal r_RX_Byte          : std_logic_vector(7 downto 0)        := (others => '0');
    signal r_RX_DV            : std_logic                           := '0';

begin

    process (i_Clk)
    begin
        if rising_edge(i_Clk) then

            case r_State is

                when s_Idle =>
                    r_Byte_Index       <= 0;
                    r_Sampling_Counter <= 0;
                    r_RX_DV            <= '0';

                    if (i_RX = '0') then
                        r_State <= s_Start;
                    else
                        r_State <= s_Idle;
                    end if;

                when s_Start =>
                    if (r_Sampling_Counter < (c_Sampling_Limit/2)) then
                        r_Sampling_Counter <= r_Sampling_Counter + 1;
                        r_State            <= s_Start;
                    elsif (r_Sampling_Counter = (c_Sampling_Limit/2)) then
                        if (i_RX = '0') then
                            r_Sampling_Counter <= 0;
                            r_State            <= s_Read_Data;
                        else
                            r_State <= s_Idle;
                        end if;
                    end if;

                when s_Read_Data =>
                    if (r_Sampling_Counter < c_Sampling_Limit) then
                        r_Sampling_Counter <= r_Sampling_Counter + 1;
                        r_State            <= s_Read_Data;
                    elsif (r_Sampling_Counter = c_Sampling_Limit) then
                        r_Sampling_Counter      <= 0;
                        r_RX_Byte(r_Byte_Index) <= i_RX;
                        if (r_Byte_Index < 7) then
                            r_Byte_Index <= r_Byte_Index + 1;
                            r_State      <= s_Read_Data;
                        else
                            r_Byte_Index <= 0;
                            r_State      <= s_Stop;
                        end if;
                    end if;

                when s_Stop =>
                    if r_Sampling_Counter < c_Sampling_Limit then
                        r_Sampling_Counter <= r_Sampling_Counter + 1;
                        r_State            <= s_Stop;
                        r_RX_DV            <= '1';
                    else
                        r_State <= s_Idle;
                    end if;

                when others =>
                    r_State <= s_Idle;

            end case;
        end if;
    end process;

    o_RX_DV   <= r_RX_DV;
    o_RX_Byte <= r_RX_Byte;

end RTL;