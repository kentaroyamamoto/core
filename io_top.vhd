library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity top is
  port ( MCLK1 : in std_logic;
         RS_RX : in std_logic;
         RS_TX : out std_logic);
end top;

architecture top of top is
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
  signal clk,iclk : std_logic;
  signal din : std_logic_vector(7 downto 0);
  signal dout : std_logic_vector(31 downto 0);
  signal full,empty,rd_en,wr_en : std_logic;
begin
  ib: IBUFG port map (
    i => MCLK1,
    o => iclk);

  bg: BUFG port map (
    i => iclk,
    o => clk);

  myio: io port map (
    clk => clk,
    din => din,
    dout => dout,
    serial_out => RS_TX,
    serial_in => RS_RX,
    full => full,
    empty => empty,
    wr_en => wr_en,
    rd_en => rd_en);

  rd_en <= not empty;
  wr_en <= not empty;
  din <= dout(7 downto 0);
  
end top;
