library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity receiver is
  port (
    clk : in std_logic;
    dout : out std_logic_vector(7 downto 0);
    rd_en : in std_logic;
    empty : out std_logic;
    serial_in : in std_logic);
end receiver;

architecture receiver of receiver is
component fifo
  PORT (
    clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC);
end component;

component recv_min is
  generic (
    wtime: std_logic_vector(15 downto 0) := x"1B16";
    hwtime: std_logic_vector(11 downto 0) := x"800");
  port (
    clk : in std_logic;
    dout : out std_logic_vector(7 downto 0);
    rx : in std_logic;
    ready : out std_logic);
end component;

signal dbuf : std_logic_vector(7 downto 0) := x"00";
signal wr_en : std_logic := '0';

begin
  recvbuf: fifo port map (
    clk => clk,
    din => dbuf,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    empty => empty);

  recv_mino: recv_min generic map (
    wtime => x"1B16", hwtime => x"800")
    port map (
      clk => clk,
      dout => dbuf,
      rx => serial_in,
      ready => wr_en);
      
end receiver;
