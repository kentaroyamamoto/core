library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity top is
  Port ( MCLK1 : in  STD_LOGIC;
         RS_TX : out  STD_LOGIC;
         RS_RX : in STD_LOGIC);
end top;

architecture top of top is
  component io
    port (
    clk : in std_logic;
    din : in std_logic_vector(31 downto 0);
    dout : out std_logic_vector(31 downto 0);
    serial_out : out std_logic;
    serial_in : in std_logic;
    full,empty : out std_logic;
    wr_en, rd_en : in std_logic);
  end component;
  
  signal clk, iclk : std_logic;
  signal sendbuf,recvbuf : std_logic_vector(31 downto 0);
  signal full,empty : std_logic := '0';
  signal wr_en,rd_en : std_logic := '0';
begin
  myio: io port map(
    clk => clk,
    din => sendbuf,
    dout => recvbuf,
    serial_out => RS_TX,
    serial_in => RS_RX,
    full => full,
    empty => empty,
    wr_en => wr_en,
    rd_en => rd_en);
  
  ib: IBUFG port map (
    i=>MCLK1,
    o=>iclk);
        
  bg: BUFG port map (
    i=>iclk,
    o=>clk);

  sendbuf <= recvbuf;
  p1 : process(clk)
  begin
    if rising_edge(clk) then
      if empty = '0' and rd_en = '0' then
        rd_en <= '1';
        wr_en <= '1';
      else
        wr_en <= '0';
        rd_en <= '0';
      end if;
    end if;
  end process;
end top;
