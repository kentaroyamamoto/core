library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FTOI is
  port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end FTOI;

architecture FTOI of FTOI is
  signal SIGN,OVER,ZERO,S,SIGN2,S2,OVER2,ZERO2 : std_logic;
  signal EXP : std_logic_vector(7 downto 0);
  signal FR,FR2 : std_logic_vector(23 downto 0);
  signal SHIFT,SHIFT2,SHIFT3 : std_logic_vector(7 downto 0);
  signal ANS0,ANS1,ANS2,ANS3,ANS4,ANS5,ANS6 : std_logic_vector(31 downto 0);

begin
  SIGN <= F(31);
  EXP <= F(30 downto 23);
  FR <= '1'&F(22 downto 0);
  SHIFT <= EXP - 127;
  SHIFT2 <= SHIFT - 23 when SHIFT >= 23 else
            23 - SHIFT;
  S <= '1' when SHIFT < 23 else '0';
  OVER <= '1' when SHIFT > 30 else '0';
  ZERO <= '1' when EXP < 127 else '0';
  ANS0 <= x"000000"&FR(23 downto 16) when SHIFT2(4) = '1' and S = '1' else
          FR(15 downto 0)&x"0000" when SHIFT2(4) = '1' else
          x"00"&FR(23 downto 0);

  
  ANS2 <= x"00"&ANS1(31 downto 8) when SHIFT3(3) = '1' and S2 = '1'  else
          ANS1(23 downto 0)&x"00" when SHIFT3(3) = '1' else
          ANS1;
  ANS3 <= x"0"&ANS2(31 downto 4) when SHIFT3(2) = '1' and S2 = '1' else
          ANS2(27 downto 0)&x"0" when SHIFT3(2) = '1' else
          ANS2;
  ANS4 <= "00"&ANS3(31 downto 2) when SHIFT3(1) = '1' and S2 = '1' else
          ANS3(29 downto 0)&"00" when SHIFT3(1) = '1' else
          ANS3;
  ANS5 <= '0'&ANS4(31 downto 1) when SHIFT3(0) = '1' and S2 = '1' else
          ANS4(30 downto 0)&'0'when SHIFT3(0) = '1' else
          ANS4;
  ANS6 <= x"00000000" when ZERO2 = '1' else
          x"80000000" when OVER2 = '1' else
          ANS5;
  ANS <= ANS6 when SIGN2 = '0' else (not ANS6) + 1;

  P1 : process(CLK)
  begin
    if rising_edge(CLK) then
      SIGN2 <= SIGN;
      S2 <= S;
      FR2 <= FR;
      ZERO2 <= ZERO;
      OVER2 <= OVER;
      SHIFT3 <= SHIFT2;
      ANS1 <= ANS0;
    end if;
  end process;
end FTOI;
