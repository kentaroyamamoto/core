library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity top is
  port(MCLK1       : in    std_logic;
       RS_RX       : in    std_logic;
       RS_TX       : out   std_logic;
       XWA         : out   std_logic;
       ZA          : out   std_logic_vector(19 downto 0);
       ZD          : inout std_logic_vector(31 downto 0);
       XE1,E2A,XE3 : out   std_logic;
       XGA         : out   std_logic;
       XZCKE       : out   std_logic;
       ADVA        : out   std_logic;
       XLBO        : out   std_logic;
       ZZA         : out   std_logic;
       XFT         : out   std_logic;
       XZBE        : out   std_logic_vector(3 downto 0);
       ZCLKMA      : out   std_logic_vector(1 downto 0));       
end top;
architecture top of top is
  component core
    port (
      clk      : in  std_logic;
      IROMData : in  std_logic_vector(31 downto 0);
      IROMAddr : out std_logic_vector(21 downto 0);
      SRAMData : inout std_logic_vector(31 downto 0);
      SRAMXWA : out std_logic;
      SRAMAddr : out std_logic_vector(19 downto 0);
      serial_in  : in  std_logic;
      serial_out  : out std_logic);
  end component;
  component iRom
    port (
      clka  : in  std_logic;
      addra : in  std_logic_vector(31 downto 0);
      douta : out std_logic_vector(31 downto 0));
  end component;
  
  signal clk,iclk : std_logic;
  signal addr,IROMData : std_logic_vector(31 downto 0) := (others => '0');
  signal IROMAddr : std_logic_vector(21 downto 0);
begin
  ib: IBUFG port map (
    i=>MCLK1,
    o=>iclk);        
  bg: BUFG port map (
    i=>iclk,
    o=>clk);

  addr <= "00000000"&IROMAddr&"00";

  mycore  : core
    port map (
      clk      => clk,
      serial_in  => rs_rx,
      serial_out  => rs_tx,
      SRAMData => ZD,
      SRAMXWA => XWA,
      SRAMAddr => ZA,
      IROMData => IROMData,
      IROMAddr => IROMAddr);
  
  myirom : iRom
    port map (
      clka  => clk,
      douta => IROMData,
      addra => addr);
  
  ZCLKMA(0) <= clk;
  ZCLKMA(1) <= clk;
  XE1  <= '0'; E2A   <= '1';
  XE3  <= '0'; XZCKE <= '0';
  XLBO <= '1'; ZZA   <= '0';
  XFT  <= '1'; XZBE  <= "0000";
  XGA  <= '0'; ADVA  <= '0';  
end top;
