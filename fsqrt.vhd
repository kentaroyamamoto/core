library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity FSQRT is
  port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
end FSQRT;

architecture FSQRT of FSQRT is
  component sqrt_const_t
    PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(22 DOWNTO 0)  );
  end component;

  COMPONENT sqrt_slope
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(12 DOWNTO 0));
  END COMPONENT;
  
  signal CONST_T : std_logic_vector (22 downto 0);
  signal CONST_T1 : std_logic_vector (22 downto 0);
  signal SLOPE : std_logic_vector (12 downto 0);
  signal ZERO,ZERO1 : std_logic;
  signal INF,INF1 : std_logic;
  signal S0 : std_logic_vector (31 downto 0);
  signal S1 : std_logic_vector (31 downto 0);
  signal Z0 : std_logic_vector (26 downto 0);
  signal Z1 : std_logic_vector (26 downto 0);
  signal Z2 : std_logic_vector (22 downto 0);
  signal FR1 : std_logic_vector (22 downto 0);
  signal EXP1 : std_logic_vector (7 downto 0); 
  signal EXP2 : std_logic_vector (7 downto 0);

begin 
  T0:sqrt_const_t port map (CLK, F(23 downto 14), CONST_T);
  T1:sqrt_slope port map(CLK, F(23 downto 14), SLOPE);
  
  Z0 <= S0(13 downto 0) * SLOPE;
  EXP1 <= '0' & S0(30 downto 24) + 63 when S0(25) = '0' else '0' & S0(30 downto 24) + 64;
  ZERO <= '1' when S0(30 downto 23) = x"00" else '0';
  INF <= '1' when S0(30 downto 23) = x"ff" else '0';

  Z2 <= "0000000000" & Z1(26 downto 14) when S1(25) = '1' else "000000000" & Z1(26 downto 13);
  FR1 <= CONST_T1 + Z2; 
  ANS <= S1(31) & x"0000000" & "000" when ZERO1 = '1' else
         S1(31) & x"ff" & x"00000" & "000" when INF1 = '1' else
         S1(31) & EXP2 & FR1;
  
  P : process(CLK)
  begin
    if rising_edge(CLK) then
      S0 <= F;
      S1 <= S0;
      Z1 <= Z0;
      ZERO1<=ZERO;
      INF1<=INF;
      CONST_T1 <= CONST_T;
      EXP2 <= EXP1;
    end if;
  end process;
end FSQRT;
