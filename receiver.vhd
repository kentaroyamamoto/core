library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity receiver is
  port (
    clk : in std_logic;
    dout : out std_logic_vector(31 downto 0);
    rd_en : in std_logic;
    empty : out std_logic;
    serial_in : in std_logic);
end receiver;

architecture receiver of receiver is
component fifo32
  PORT (
    clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
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

signal state : std_logic_vector(1 downto 0) := "00";
signal ready : std_logic;
signal data : std_logic_vector(31 downto 0);
signal dbuf : std_logic_vector(7 downto 0) := x"00";
signal wr_en : std_logic := '0';

begin
  recvbuf: fifo32 port map (
    clk => clk,
    din => data,
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
      ready => ready);
      
  p1 : process(clk)
  begin
    if rising_edge(clk) then
      case state is
        when "00" =>
          wr_en <= '0';
          if ready = '1' then
            data(7 downto 0) <= dbuf;
            state <= state + 1;
          end if;
        when "01" =>
          if ready = '1' then
            data(15 downto 8) <= dbuf;
            state <= state + 1;
          end if;
        when "10" =>
          if ready = '1' then
            data(23 downto 16) <= dbuf;
            state <= state + 1;
          end if;
        when "11" =>
          if ready = '1' then
            data(31 downto 24) <= dbuf;
            state <= "00";
            wr_en <= '1';
          end if;
        when others =>
      end case;
    end if;
  end process;
end receiver;
