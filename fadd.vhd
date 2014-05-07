
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FADD is
  port (
    CLK : in std_logic;
    F1 : in std_logic_vector (31 downto 0);
    F2 : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end FADD;

architecture FADD of FADD is
  signal FW,FW2,FW3,FL : std_logic_vector(31 downto 0);
  signal SHIFT,SHIFT2,EXP,EXP2,EXP3,EXP4,EXP5,EXP6,EXP7 : std_logic_vector(7 downto 0);
  signal SIGN,SIGN2,SIGN3,ZERO,ZERO2,ZERO3,INF,INF2,INF3,S,S2,OVER,OVER2,OVER3,UP,UP2,ST,ST2,ST3,ST3_2,ST4,ST5,ST5_2,FLAG_1,FLAG_2,FLAG2_1,FLAG2_2 : std_logic;
  signal FRW,FRW2,FRL,FRL2,FRL3,FRL4,FRL4_2,FRL5,FRL5_2,FRL6,FRL7 : std_logic_vector(25 downto 0);
  signal FR,FR_2 : std_logic_vector(26 downto 0);
  signal FR2,FR3,FR4 : std_logic_vector(22 downto 0);
begin
  FW <= F1 when F1(30 downto 23) > F2(30 downto 23) else F2;
  FL <= F2 when F2(30 downto 23) <= F1(30 downto 23) else F1;
  SHIFT <= FW(30 downto 23) - FL(30 downto 23);
  OVER <= '1' when SHIFT > x"1f" else '0';
  SIGN <= FW(31);
  ZERO <= '1' when FL(30 downto 23) = x"00" else '0';
  INF <= '1' when FW(30 downto 23) = x"ff" else '0';
  EXP <= FW(30 downto 23);
  S <= '1' when FW(31) = FL(31) else '0';
  FRW <= '1'&FW(22 downto 0)&"00";
  FRL <= '1'&FL(22 downto 0)&"00" when S = '1' else ((not('1'&FL(22 downto 0))) + 1)&"00";
  FRL2 <= x"0000"&FRL(25 downto 16) when SHIFT(4) = '1' and S = '1' else
          x"ffff"&FRL(25 downto 16) when SHIFT(4) = '1' else
          FRL;
  FRL3 <= x"00"&FRL2(25 downto 8) when SHIFT(3) = '1' and S = '1' else
          x"ff"&FRL2(25 downto 8) when SHIFT(3) = '1' else
          FRL2;
  FRL4 <= x"0"&FRL3(25 downto 4) when SHIFT(2) = '1' and S = '1' else
          x"f"&FRL3(25 downto 4) when SHIFT(2) = '1'else
          FRL3;
  FRL5 <= "00"&FRL4(25 downto 2) when SHIFT(1) = '1' and S= '1' else
          "11"&FRL4(25 downto 2) when SHIFT(1) = '1'else
          FRL4;
  FRL6 <= '0'&FRL5(25 downto 1) when SHIFT(0) = '1' and S = '1' else
          '1'&FRL5(25 downto 1) when SHIFT(0) = '1' else
          FRL5;
  ST <= FRL(15) or FRL(14) or FRL(13) or FRL(12) or FRL(11) or FRL(10) or FRL(9) or FRL(8) or FRL(7) or FRL(6) or FRL(5) or FRL(4) or FRL(3) or FRL(2) or FRL(1) or FRL(0) when SHIFT(4) = '1' else '0';
  ST2 <= FRL2(7) or FRL2(6) or FRL2(5) or FRL2(4) or FRL2(3) or FRL2(2) or FRL2(1) or FRL2(0) or ST when SHIFT(3) = '1' else ST;
  ST3 <= FRL3(3) or FRL3(2) or FRL3(1) or FRL3(0) or ST2 when SHIFT(2) = '1' else ST2;

  
  ST4 <= FRL4_2(1) or FRL4_2(0) or ST3_2 when SHIFT2(1) = '1' else ST3_2;  
  ST5 <= FRL5_2(0) or ST4 when SHIFT2(0) = '1' else ST4;
  FR <= ('0'&FRW2) + ('0'&FRL7) when S2 = '1' else
        '0'&(FRW2 + FRL7);
  FR2 <= FR(25 downto 3) when FR(26) = '1' else
         FR(24 downto 2) when FR(25) = '1' else
         FR(23 downto 1) when FR(24) = '1' else
         FR(22 downto 0) when FR(23) = '1' else
         FR(21 downto 0)&'0' when FR(22) = '1' else
         FR(20 downto 0)&"00" when FR(21) = '1' else
         FR(19 downto 0)&"000" when FR(20) = '1' else
         FR(18 downto 0)&x"0" when FR(19) = '1' else
         FR(17 downto 0)&x"0"&'0'when FR(18) = '1' else
         FR(16 downto 0)&x"0"&"00" when FR(17) = '1' else
         FR(15 downto 0)&x"0"&"000" when FR(16) = '1' else
         FR(14 downto 0)&x"00" when FR(15) = '1' else
         FR(13 downto 0)&x"00"&'0' when FR(14) = '1' else
         FR(12 downto 0)&x"00"&"00"when FR(13) = '1' else
         FR(11 downto 0)&x"00"&"000" when FR(12) = '1' else
         FR(10 downto 0)&x"000" when FR(11) = '1' else
         FR(9 downto 0)&x"000"&'0' when FR(10) = '1' else
         FR(8 downto 0)&x"000"&"00" when FR(9) = '1' else
         FR(7 downto 0)&x"000"&"000" when FR(8) = '1' else
         FR(6 downto 0)&x"0000" when FR(7) = '1' else
         FR(5 downto 0)&x"0000"&'0' when FR(6) = '1' else
         FR(4 downto 0)&x"0000"&"00" when FR(5) = '1' else
         FR(3 downto 0)&x"0000"&"000" when FR(4) = '1' else
         FR(2 downto 0)&x"00000" when FR(3) = '1' else
         FR(1 downto 0)&x"00000"&'0' when FR(2) = '1' else
         FR(0)&x"00000"&"00";
  EXP3 <= EXP2 + 1 when FR(26) = '1' else
          EXP2 when FR(25) = '1' else
          EXP2 - 1 when FR(24) = '1' else
          EXP2 - 2 when FR(23) = '1' else
          EXP2 - 3 when FR(22) = '1' else
          EXP2 - 4 when FR(21) = '1' else
          EXP2 - 5 when FR(20) = '1' else
          EXP2 - 6 when FR(19) = '1' else
          EXP2 - 7 when FR(18) = '1' else
          EXP2 - 8 when FR(17) = '1' else
          EXP2 - 9 when FR(16) = '1' else
          EXP2 - 10 when FR(15) = '1' else
          EXP2 - 11 when FR(14) = '1' else
          EXP2 - 12 when FR(13) = '1' else
          EXP2 - 13 when FR(12) = '1' else
          EXP2 - 14 when FR(11) = '1' else
          EXP2 - 15 when FR(10) = '1' else
          EXP2 - 16 when FR(9) = '1' else
          EXP2 - 17 when FR(8) = '1' else
          EXP2 - 18 when FR(7) = '1' else
          EXP2 - 19 when FR(6) = '1' else
          EXP2 - 20 when FR(5) = '1' else
          EXP2 - 21 when FR(4) = '1' else
          EXP2 - 22 when FR(3) = '1' else
          EXP2 - 23 when FR(2) = '1' else
          EXP2 - 24 when FR(1) = '1' else
          EXP2 - 25 when FR(0) = '1' else
          x"00";

  
  UP <=  FR_2(2) and (FR_2(3) or FR_2(1) or FR_2(0) or ST5_2) when FR_2(26) = '1' else
         FR_2(1) and (FR_2(2) or FR_2(0) or ST5_2) when FR_2(25) = '1' else
         FR_2(0) and (FR_2(1) or ST5_2) when FR_2(24) = '1' else
         '0';
  FR4 <= x"00000"&"000" when FR3 = x"fffff"&"111" and UP = '1' else
         FR3 + 1 when UP = '1' else
         FR3;
  EXP6 <= EXP4 + 1 when FR3 = x"fffff"&"111" and UP = '1' else
          EXP4;
  EXP7 <= x"00" when EXP5 + 1 < EXP6 else
          EXP6;

  ANS <= FW3 when ZERO3 = '1' or INF3 = '1' or OVER3 = '1'else          
         SIGN3&x"0000000"&"000" when EXP7 = x"00" else
         SIGN3&x"ff"&x"00000"&"000" when EXP7 = x"ff" else
         SIGN3&EXP7& FR4;
  
  P1 : process(CLK)
  begin
    if rising_edge(CLK) then
      FRW2 <= FRW;
      FRL7 <= FRL6;
      SHIFT2 <= SHIFT;
      S2 <= S;
      EXP2 <= EXP;
      FW2 <= FW;
      ZERO2 <= ZERO;
      INF2 <= INF;
      OVER2 <= OVER;
      SIGN2 <= SIGN;
      ST3_2 <= ST3;
      FRL4_2 <= FRL4;
      FRL5_2 <= FRL5;

      EXP4<= EXP3;
      FR_2 <= FR;
      FR3 <= FR2;
      EXP5 <= EXP2;
      FW3 <= FW2;
      ZERO3 <= ZERO2;
      INF3 <= INF2;
      OVER3 <= OVER2;
      ST5_2 <= ST5;
      SIGN3 <= SIGN2;
    end if;
  end process;
end FADD;
