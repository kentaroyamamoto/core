library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FINV is
  port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end FINV;

architecture FINV of FINV is
  component inv_const_t
    PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(22 DOWNTO 0)  );
  end component;

  COMPONENT inv_slope
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
  END COMPONENT;
  
  signal CONST_T : std_logic_vector (22 downto 0);
  signal CONST_T1 : std_logic_vector (22 downto 0);
  signal SLOPE : std_logic_vector (12 downto 0);
  signal S0 : std_logic_vector (31 downto 0);
  signal S1 : std_logic_vector (31 downto 0);
  signal Z0 : std_logic_vector (25 downto 0);
  signal Z1 : std_logic_vector (25 downto 0);
  signal Z2 : std_logic_vector (22 downto 0);
  signal FR1 : std_logic_vector (22 downto 0);
  signal FR2 : std_logic_vector (22 downto 0);
  signal EXP1 : std_logic_vector (7 downto 0); 
  signal EXP2 : std_logic_vector (7 downto 0);
  signal ZERO,ZERO1,INF,INF1,C,C1 : std_logic;

begin 
  T0:inv_const_t port map (CLK, F(22 downto 13), CONST_T);
  T1:inv_slope port map(CLK, F(22 downto 13), SLOPE);
  
  Z0 <= S0(12 downto 0) * SLOPE;
  EXP1 <= 253 - S0(30 downto 23);
  ZERO <= '1' when S0(30 downto 23) = x"00" else '0';
  INF <= '1' when S0(30 downto 23) = x"ff" or S0(30 downto 23) = x"fe" else '0';
  C <= '1' when S0(30 downto 0) = x"fd" & x"00000" & "000" else '0';
  
  Z2 <= "000000000" & Z1(25 downto 12);
  FR1 <= CONST_T1 - Z2;
  FR2 <= FR1(22 downto 0);
  ANS <= S1(31) & x"01" & x"00000" & "000" when C1 = '1' else
         S1(31) & "000" & x"0000000" when EXP2 = x"00" or INF1 = '1' else
         S1(31) & x"ff" & x"00000"&"000" when ZERO1 = '1' else
         S1(31) & EXP2 & FR2;
  
  P : process(CLK)
  begin
    if rising_edge(CLK) then
      S0 <= F;
      S1 <= S0;
      Z1 <= Z0;
      C1 <= C;
      CONST_T1 <= CONST_T;
      EXP2 <= EXP1;
      ZERO1<=ZERO;
      INF1<=INF;
    end if;
  end process;
end FINV;
