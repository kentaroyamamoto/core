library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.types.all;

entity core is
  port (
    clk : in std_logic;
    IROMAddr : out std_logic_vector(21 downto 0);
    IROMData : in std_logic_vector(31 downto 0);
    SRAMData : inout std_logic_vector(31 downto 0);
    SRAMXWA : out std_logic;
    SRAMAddr : out std_logic_vector(19 downto 0);
    serial_in : in std_logic;
    serial_out : out std_logic);
end core;

architecture core of core is
  component io
    port (
    clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    serial_out : out std_logic;
    serial_in : in std_logic;
    full,empty : out std_logic;
    wr_en, rd_en : in std_logic);
  end component;
  component fadd is
    port (
    CLK : in std_logic;
    F1 : in std_logic_vector (31 downto 0);
    F2 : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
  end component;
  component fmul is
    port (
    CLK : in std_logic;
    F1 : in std_logic_vector (31 downto 0);
    F2 : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
  end component;
  component finv is
    port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
  end component;
  component fsqrt is
    port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
  end component;
  component ftoi is
    port (
    CLK : in std_logic;
    F : in std_logic_vector (31 downto 0);
    ANS : out std_logic_vector (31 downto 0));
  end component;

  type reg is array (integer range <>) of std_logic_vector(31 downto 0);
  signal ireg : reg(0 to 31);
  signal freg : reg(0 to 31);
  signal myopcode,myopcode_1,myopcode_2,myopcode_3,myopcode_4 : std_logic_vector(5 downto 0);
  signal state : std_logic_vector(2 downto 0) := "000";
  signal pc,pc_1 : std_logic_vector(21 downto 0) := (others => '0');
  signal r1,r2,r3,r1_1,r2_1,r3_1,r1_2,r1_3,r1_4 : std_logic_vector(4 downto 0);
  signal addr15,addr15_1,addr15_2 : std_logic_vector(14 downto 0);
  signal addr21,addr21_1,addr21_2 : std_logic_vector(20 downto 0);
  signal imd,imd_1,imd_2 : std_logic_vector(15 downto 0);
  signal vr1p,vr1,vr2,vr3,vf1,vf2,vf3,vf3_adsb : std_logic_vector(31 downto 0);
  signal radd,radd_1,radd_2,radd_3,rsub,rsub_1,rsub_2,rsub_3,rfneg,rfneg_1,rfneg_2,rfneg_3,rseti1,rseti1_1,rseti1_2,rseti1_3,rseti2,rseti2_1,rseti2_2,rseti2_3,rsetf1,rsetf1_1,rsetf1_2,rsetf1_3,rsetf2,rsetf2_1,rsetf2_2,rsetf2_3,rsli,rsli_1,rsli_2,rsli_3,rsave,rsave_1,rsave_2,rsave_3,rload,rload_1,rinput,rinput_1,rinput_2,rinput_3,rfadd,rfadd_1,rfmul,rfmul_1,rfinv,rfinv_1,rfsqrt,rfsqrt_1,rftoi,rftoi_1,rftoi_2 : std_logic_vector(31 downto 0);
  signal rblt,rbltf,rbeq,rbeqf : std_logic;
  signal din : std_logic_vector(7 downto 0);
  signal dout : std_logic_vector(31 downto 0);
  signal wr_en,rd_en,full,empty : std_logic := '0';
  signal ireg_o, freg_o : std_logic_vector(31 downto 0);

 begin
  myio : io port map (
    clk => clk,
    din => din,
    dout => dout,
    serial_in => serial_in,
    serial_out => serial_out,
    wr_en => wr_en,
    rd_en => rd_en,
    full => full,
    empty => empty);
  myfadd : fadd port map (
    CLK => clk,
    F1 => vf2,
    F2 => vf3_adsb,
    ANS => rfadd);
  myfmul : fmul port map (
    CLK => clk,
    F1 => vf2,
    F2 => vf3,
    ANS => rfmul);
  myfinv : finv port map (
    CLK => clk,
    F => vf2,
    ANS => rfinv);
  myfsqrt : fsqrt port map (
    CLK => clk,
    F => vf2,
    ANS => rfsqrt);
  myftoi : ftoi port map (
    CLK => clk,
    F => vf2,
    ANS => rftoi);

  vr1p <= ireg(conv_integer(r1));
  vr1 <= ireg(conv_integer(r1_1));
  vr2 <= ireg(conv_integer(r2_1));
  vr3 <= ireg(conv_integer(r3_1));
  vf1 <= freg(conv_integer(r1_1));
  vf2 <= freg(conv_integer(r2_1));
  vf3 <= freg(conv_integer(r3_1));
  vf3_adsb <= vf3 when myopcode_1 = iaddf else
              (not vf3(31)) & vf3(30 downto 0);
  radd <= vr2 + vr3;
  rsub <= vr2 - vr3;
  rfneg <= not vf2(31) & vf2(30 downto 0);
  rseti1 <= imd_1 & vr1(15 downto 0);
  rseti2 <= x"0000" & imd_1;
  rsetf1 <= imd_1 & vf1(15 downto 0);
  rsetf2 <= vf1(31 downto 16) & imd_1;
  rblt <= '1' when vr1 < vr2 else '0';
  rbltf <= '1' when (vf1(31) = '1' and vf2(31) = '0') or (vf1(31) = '0' and  vf2(31) = '0' and vf1(30 downto 0) < vf2(30 downto 0)) or (vf1(31) = '1' and vf2(31) = '1' and vf1(30 downto 0) > vf2(30 downto 0)) else '0';
  rbeq <= '1' when vr1 = vr2 else '0';
  rbeqf <= '1' when vf1 = vf2 else '0';
  SRAMXWA <= '0' when  myopcode_1 = istore or myopcode_1 = istoreb or myopcode_1 = istorebf or myopcode_1 = istoref else '0';
  SRAMAddr <= vr2(19 downto 0) + ("0000"&imd_1) when myopcode_1 = iload or myopcode_1 = istore or myopcode_1 = iloadf or myopcode_1 = istoref else vr2(19 downto 0) - ("0000"&imd_1);
  rsave <= x"00"&"00"&(pc + 2);
  rsli <= std_logic_vector(unsigned(vr2) sll conv_integer(imd_1));
  ireg_o <= radd_3 when myopcode_4 = iadd else
            rsub_3 when myopcode_4 = isub else
            rsave_3 when myopcode_4 = isave else
            rsli_3 when myopcode_4 = isli else
            rseti1_3 when myopcode_4 = iseti1 else
            rseti2_3 when myopcode_4 = iseti2 else
            rload_1 when myopcode_4 = iload or myopcode_4 = iloadb else
            rinput_3 when myopcode_4 = iinput else
            rftoi_2 when myopcode_4 = if2i else
            ireg(conv_integer(r1_4));

  freg_o <= rfneg_3 when myopcode_4 = ifneg else
            rsetf1_3 when myopcode_4 = isetf1 else
            rsetf2_3 when myopcode_4 = isetf2 else
            rload_1 when myopcode_4 = iloadf or myopcode_4 = iloadbf else
            rinput_3 when myopcode_4 = iinputf else
            rfadd_1 when myopcode_4 = iaddf or myopcode_4 = isubf else
            rfmul_1 when myopcode_4 = imulf else
            rfinv_1 when myopcode_4 = iinvf else
            rfsqrt_1 when myopcode_4 = isqrtf else
            freg(conv_integer(r1_4));
       
   pc_1 <= "0000000" & addr15_2 when (myopcode_4 = iblt and rblt = '1') or (myopcode_4 = ibltf and rbltf = '1') or (myopcode_4 = ibeq and rbeq = '1') or (myopcode_4 = ibeqf and rbeqf = '1') else
   	 '0' & addr21_2 when myopcode_4 = ijmp else
   	 vr1(21 downto 0) when myopcode_4 = ijmpr else
   	 pc + 1;
  
  p1 : process(clk)
  begin
    if rising_edge (clk) then
      case state is
        when "000" =>
          IROMAddr <= pc;
          state <= state + 1;
        when "001" =>
          myopcode <= IROMData(31 downto 26);
          r1 <= IROMData(25 downto 21);
          r2 <= IROMData(20 downto 16);
          r3 <= IROMData(15 downto 11);
          addr15 <= IROMData(14 downto 0);
          addr21 <= IROMData(20 downto 0);
          imd <= IROMData(15 downto 0);
          state <= state + 1;
        when "010" =>
          myopcode_1 <= myopcode;
          r1_1 <= r1;
          r2_1 <= r2;
          r3_1 <= r3;
          addr15_1 <= addr15;
          addr21_1 <= addr21;
          imd_1 <= imd;
          if myopcode = iinput or myopcode = iinputf then
            if empty = '0' then
              rinput <= dout;
              rd_en <= '1';
              state <= state + 1;
            end if;
          elsif myopcode = ioutputint then
            if full = '0' then
              din <= vr1p(7 downto 0);
              wr_en <= '1';
              state <= state + 1;
            end if;
          else
            din <= vr1p(7 downto 0);
            wr_en <= '1';
            state <= state + 1;
          end if;
        when "011" =>
          rd_en <= '0';
          wr_en <= '0';
          
          radd_1 <= radd;
          rsub_1 <= rsub;
          rfneg_1 <= rfneg;
          rseti1_1 <= rseti1;
          rseti2_1 <= rseti2;
          rsetf1_1 <= rsetf1;
          rsetf2_1 <= rsetf2;
          rsli_1 <= rsli;
          rsave_1 <= rsave;
          rinput_1 <= rinput;

          myopcode_2 <= myopcode_1;
          r1_2 <= r1_1;
          addr15_2 <= addr15_1;
          addr21_2 <= addr21_1;
          imd_2 <= imd_1;
          
          state <= state + 1;
        when "100" =>
          if myopcode_2 = istore or myopcode_2 = istoreb then
            SRAMData<= ireg(conv_integer(r1_2));
          elsif myopcode_2 = istoref or myopcode_2 = istorebf then
            SRAMData <= freg(conv_integer(r1_2));
          else
            rload <= SRAMData;
          end if;
          radd_2 <= radd_1;
          rsub_2 <= rsub_1;
          rfneg_2 <= rfneg_1;
          rseti1_2 <= rseti1_1;
          rseti2_2 <= rseti2_1;
          rsetf1_2 <= rsetf1_1;
          rsetf2_2 <= rsetf2_1;
          rsli_2 <= rsli_1;
          rsave_2 <= rsave_1;
          rinput_2 <= rinput_1;
          rftoi_1 <= rftoi;

          myopcode_3 <= myopcode_2;
          r1_3 <= r1_2;
          state <= state + 1;
        when "101" =>
          radd_3 <= radd_2;
          rsub_3 <= rsub_2;
          rfneg_3 <= rfneg_2;
          rseti1_3 <= rseti1_2;
          rseti2_3 <= rseti2_2;
          rsetf1_3 <= rsetf1_2;
          rsetf2_3 <= rsetf2_2;
          rsli_3 <= rsli_2;
          rsave_3 <= rsave_2;
          rinput_3 <= rinput_2;
          rload_1 <= rload;
          
          rfadd_1 <= rfadd;
          rfmul_1 <= rfmul;
          rfinv_1 <= rfinv;
          rfsqrt_1 <= rfsqrt;
          rftoi_2 <= rftoi_1;
          
          myopcode_4 <= myopcode_3;
          r1_4 <= r1_3;
          state <= state + 1;
        when "110" =>
          ireg(conv_integer(r1_4)) <= ireg_o;
          freg(conv_integer(r1_4)) <= freg_o;
          pc <= pc_1;
          state <= "000";
        when others =>
      end case;
    end if;
  end process;
end core;
