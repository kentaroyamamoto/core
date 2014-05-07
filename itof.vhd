library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity ITOF is
  port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end ITOF;

architecture ITOF of ITOF is
  signal SIGN,OVER,S,SIGN2,OVER2,S2,SIGN3,OVER3,S3 : std_logic;
  signal I,I2 : std_logic_vector(31 downto 0);
  signal SHIFT,SHIFT2 : std_logic_vector(4 downto 0);
  signal FR,FR2 : std_logic_vector(22 downto 0);
  signal EXP : std_logic_vector(7 downto 0);

begin
  SIGN <= F(31);
  I <= F when SIGN = '0'else
       (not F) + 1;
  OVER <= '1' when I = x"00000000" else '0';
  S <= '1' when I(31) = '1' else '0';

  
  SHIFT <= "11110" when I2(30) = '1' else
           "11101" when I2(29) = '1' else
           "11100" when I2(28) = '1' else
           "11011" when I2(27) = '1' else
           "11010" when I2(26) = '1' else
           "11001" when I2(25) = '1' else
           "11000" when I2(24) = '1' else
           "10111" when I2(23) = '1' else
           "10110" when I2(22) = '1' else
           "10101" when I2(21) = '1' else
           "10100" when I2(20) = '1' else
           "10011" when I2(19) = '1' else
           "10010" when I2(18) = '1' else
           "10001" when I2(17) = '1' else
           "10000" when I2(16) = '1' else
           "01111" when I2(15) = '1' else
           "01110" when I2(14) = '1' else
           "01101" when I2(13) = '1' else
           "01100" when I2(12) = '1' else
           "01011" when I2(11) = '1' else
           "01010" when I2(10) = '1' else
           "01001" when I2(9) = '1' else
           "01000" when I2(8) = '1' else
           "00111" when I2(7) = '1' else
           "00110" when I2(6) = '1' else
           "00101" when I2(5) = '1' else
           "00100" when I2(4) = '1' else
           "00011" when I2(3) = '1' else
           "00010" when I2(2) = '1' else
           "00001" when I2(1) = '1' else
           "00000";
  FR <= I2(29 downto 7) when I2(30) = '1' else
           I2(28 downto 6) when I2(29) = '1' else
           I2(27 downto 5) when I2(28) = '1' else
           I2(26 downto 4) when I2(27) = '1' else
           I2(25 downto 3) when I2(26) = '1' else
           I2(24 downto 2) when I2(25) = '1' else
           I2(23 downto 1) when I2(24) = '1' else
           I2(22 downto 0) when I2(23) = '1' else
           I2(21 downto 0)&'0' when I2(22) = '1' else
           I2(20 downto 0)&"00"when I2(21) = '1' else
           I2(19 downto 0)&"000" when I2(20) = '1' else
           I2(18 downto 0)&x"0" when I2(19) = '1' else
           I2(17 downto 0)&x"0"&'0' when I2(18) = '1' else
           I2(16 downto 0)&x"0"&"00" when I2(17) = '1' else
           I2(15 downto 0)&x"0"&"000" when I2(16) = '1' else
           I2(14 downto 0)&x"00" when I2(15) = '1' else
           I2(13 downto 0)&x"00"&'0' when I2(14) = '1' else
           I2(12 downto 0)&x"00"&"00" when I2(13) = '1' else
           I2(11 downto 0)&x"00"&"000" when I2(12) = '1' else
           I2(10 downto 0)&x"000" when I2(11) = '1' else
           I2(9 downto 0)&x"000"&'0' when I2(10) = '1' else
           I2(8 downto 0)&x"000"&"00" when I2(9) = '1' else
           I2(7 downto 0)&x"000"&"000" when I2(8) = '1' else
           I2(6 downto 0)&x"0000" when I2(7) = '1' else
           I2(5 downto 0)&x"0000"&'0' when I2(6) = '1' else
           I2(4 downto 0)&x"0000"&"00" when I2(5) = '1' else
           I2(3 downto 0)&x"0000"&"000" when I2(4) = '1' else
           I2(2 downto 0)&x"00000" when I2(3) = '1' else
           I2(1 downto 0)&x"00000"&'0' when I2(2) = '1' else
           I2(0)&x"00000"&"00" when I2(1) = '1' else
           x"00000"&"000";

  
  EXP <= "000"&SHIFT2 + 127;
  ANS <= x"cf000000" when S3 = '1' else
         x"00000000" when OVER3 = '1' else
         SIGN3 & EXP & FR2;

  
  P1 : process(CLK)
  begin
    if rising_edge(CLK) then
      SIGN2 <= SIGN;
      I2 <= I;
      OVER2 <= OVER;
      S2 <= S;

      OVER3 <= OVER2;
      SHIFT2 <= SHIFT;
      FR2 <= FR;
      S3 <= S2;
      SIGN3 <= SIGN2;
    end if;
  end process;
end ITOF;
