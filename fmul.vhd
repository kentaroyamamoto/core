library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FMUL is
  port (
    CLK : in std_logic;
    F1 : in std_logic_vector (31 downto 0);
    F2 : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end FMUL;

architecture FMUL of FMUL is
  signal HH,HL,LH,HH2,HL2,LH2 : std_logic_vector (25 downto 0);
  signal EXP,EXP2,EXP3 : std_logic_vector (9 downto 0);
  signal EXP_PLUS,EXP_PLUS2 : std_logic_vector (9 downto 0);
  signal SIGN,SIGN2,SIGN3,ZERO,ZERO1,ZERO2,INF,INF1,INF2,I,I_P,Z,Z_P,I1,I_P1,Z1,Z_P1 : std_logic;
  signal FR,FR2 : std_logic_vector (25 downto 0);

begin
  HH <= ('1'&F1(22 downto 11)) * ('1'&F2(22 downto 11));
  HL <= ('1'&F1(22 downto 11)) * ("00"&F2(10 downto 0));
  LH <= ('1'&F2(22 downto 11)) * ("00"&F1(10 downto 0));
  EXP <= ("00"&F1(30 downto 23)) + ("00"&F2(30 downto 23)) + 129;
  SIGN <= F1(31) xor F2(31);
  ZERO <= '1' when F1(30 downto 23) = x"00" or F2(30 downto 23) = x"00" else '0';
  INF <= '1' when F1(30 downto 23) = x"ff" or F2(30 downto 23) = x"ff" else '0';
  

  FR <= HH2 + ("00000000000" & HL2(25 downto 11)) + ("00000000000" & LH2(25 downto 11)) + 2;
  EXP_PLUS <= EXP2 + 1;
  I_P <= '1' when EXP_PLUS >= "01"&x"ff" else '0';
  I <= '1' when EXP2 >= "01"&x"ff" else '0';
  Z <= '1' when  EXP2 <= "01"&x"00" else '0';
  Z_P <= '1' when  EXP_PLUS <= "01"&"00" else '0';

  ANS <= SIGN3 & x"0000000" & "000" when ZERO2 = '1' or (FR2(25) = '1' and Z_P1 = '1') or (FR2(25) = '0' and Z1 = '1') else
         SIGN3 & x"ff" & x"00000" & "000" when INF2 = '1' or (FR2(25) = '1' and I_P1 = '1') or (FR2(25) = '0' and I_P1 = '1') else
         SIGN3 & EXP_PLUS2(7 downto 0) & FR2(24 downto 2) when FR2(25) = '1' else
         SIGN3 & EXP3(7 downto 0) & FR2(23 downto 1);
  
  P1 : process(CLK,F1,F2)
  begin
    if rising_edge(CLK) then
      HH2 <= HH;
      HL2 <= HL;
      LH2 <= LH;
      EXP2 <= EXP;
      SIGN2 <= SIGN;
      ZERO1 <= ZERO;
      INF1 <= INF;
      
      I_P1 <= I_P;
      I1 <= I;
      Z_P1 <= Z_P;
      Z1 <= Z;
      ZERO2 <= ZERO1;
      INF2 <= INF1;
      SIGN3 <= SIGN2;
      FR2 <= FR;
      EXP3 <= EXP2;
      EXP_PLUS2 <= EXP_PLUS;
    end if;
  end process;
end FMUL;
