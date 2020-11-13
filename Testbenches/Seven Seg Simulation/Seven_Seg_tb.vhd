----------------------------------------------------------------------------------
-- Engineer: Brad Stephen
-- Module Name: Seven_Seg_tb
-- Project Name: Seven_Seg
--
-- Additional Comments:
-- Run simulation for 1 ms.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Seven_Seg_tb is
end Seven_Seg_tb;

architecture RTL of Seven_Seg_tb is

    signal i_Clk     : std_logic                     := '1';
    signal i_Digit_1 : std_logic_vector (3 downto 0) := (others => '0');
    signal i_Digit_2 : std_logic_vector (3 downto 0) := (others => '0');
    signal i_Digit_3 : std_logic_vector (3 downto 0) := (others => '0');
    signal i_Digit_4 : std_logic_vector (3 downto 0) := (others => '0');
    signal o_Anode   : std_logic_vector (3 downto 0) := (others => '0');
    signal o_Segment : std_logic_vector (7 downto 0) := (others => '0');

    -- 1/100,000,000
    constant c_Clk_Period : time := 10 ns;

begin
    -- create system clock
    i_Clk <= not i_Clk after c_Clk_Period/2;


    -- input stimulus
    process
    begin
        if (i_Digit_1 < "1111") then
            i_Digit_1 <= std_logic_vector(unsigned(i_Digit_1) + "1");
            i_Digit_2 <= std_logic_vector(unsigned(i_Digit_1) + "1");
            i_Digit_3 <= std_logic_vector(unsigned(i_Digit_1) + "1");
            i_Digit_4 <= std_logic_vector(unsigned(i_Digit_1) + "1");
        else
            i_Digit_1 <= (others => '0');
            i_Digit_2 <= (others => '0');
            i_Digit_3 <= (others => '0');
            i_Digit_4 <= (others => '0');
        end if;
        wait for 50us;
    end process;

    Seven_Seg_Inst : entity work.Seven_Seg
        port map(
            i_Clk     => i_Clk,
            i_Digit_1 => i_Digit_1,
            i_Digit_2 => i_Digit_2,
            i_Digit_3 => i_Digit_3,
            i_Digit_4 => i_Digit_4,
            o_Anode   => o_Anode,
            o_Segment => o_Segment
        );

end RTL;

