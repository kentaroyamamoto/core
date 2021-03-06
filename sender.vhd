library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sender is
  port (
    clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    wr_en : in std_logic;
    full : out std_logic;
    serial_out : out std_logic);
end sender;

architecture sender of sender is
component fifo8
  PORT (
    clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC);
end component;

component u232c
  generic (wtime: std_logic_vector(15 downto 0) := x"1B16");
  Port ( clk  : in  STD_LOGIC;
         data : in  STD_LOGIC_VECTOR (7 downto 0);
         go   : in  STD_LOGIC;
         busy : out STD_LOGIC;
         tx   : out STD_LOGIC);
end component;

signal dout : std_logic_vector(7 downto 0);
signal rd_en : std_logic := '0';
signal data : std_logic_vector(7 downto 0) := (others=>'1');
signal empty : std_logic := '1';
signal go,busy : std_logic := '0';


begin
  sendf: fifo8 port map (
    clk => clk,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty);

  rs232c: u232c generic map (wtime => x"1B16")
    port map(
      clk => clk,
      data => data,
      go => go,
      busy => busy,
      tx => serial_out);
       
  main : process(clk)
  begin
    if rising_edge(clk) then
      if empty = '0' and busy = '0' and go = '0' then
        go <= '1';
        data <= dout;
        rd_en <= '1';
      else
        rd_en <= '0';
        go <= '0';
      end if;
    end if;
  end process; 
end sender;
