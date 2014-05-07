library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity serialif_tb is
  port (
    serialI    : in  std_logic;
    serialO    : out std_logic;
    dout       : out std_logic_vector(7 downto 0);
    din        : in  std_logic_vector(7 downto 0);
    empty,full : out std_logic;
    send,acpt  : in  std_logic;
    clk  : in  std_logic;
    spill      : out std_logic);
end serialif_tb;
architecture machine of serialif_tb is
  component sender_m
    generic (
      wtime : std_logic_vector(15 downto 0));
    port (
      clk        : in std_logic;
      data       : in std_logic_vector(7 downto 0);
      start      : in std_logic;
      send, busy : out std_logic);
  end component;
  component accepter_m
    generic (
      wtime : std_logic_vector(15 downto 0));
    port (
      clk          : in  std_logic;
      serial_data  : in  std_logic;
      filled_flag  : out std_logic;
      pararel_data : out std_logic_vector(7 downto 0));  
  end component;
  component fifo8
    port (
      clk   : in  std_logic;	
      wr_en : in  std_logic;
      rd_en : in  std_logic;
      din   : in  std_logic_vector(7 downto 0);
      dout  : out std_logic_vector(7 downto 0);
      full  : out std_logic;
      empty : out std_logic);
  end component;
  signal filled_flag,busy : std_logic;
  signal accData : std_logic_vector(7 downto 0);
  signal accDataB : std_logic_vector(7 downto 0) := (others => '0');
  signal sendData,sendDataB : std_logic_vector(7 downto 0) := (others => '1');
  signal iempty,oempty,ofull : std_logic;
  signal irden,orden,iwren,owren,sendStart : std_logic := '0';
  signal idin,idout,odin,odout : std_logic_vector(7 downto 0);  
  signal sdFlag,sendStartB,ordenB : std_logic := '0';

  type bin is file of character;
  file OUTPUTFILE : bin open write_mode is "output.txt";
  file INPUTFILE : bin open read_mode is "input.txt";
    
begin  -- machine
  empty  <= iempty;
  dout   <= idout;    
  full   <= ofull;
  owren  <= send;
  odin   <= din;
  irden  <= acpt;
  idin   <= accData;
  sdFlag <= (not oempty) and (not busy);
  sendStart <= sdFlag when sendStartB = '0' else '0';
  sendData  <= odout;
  orden   <= sdFlag when ordenB = '0' else '0';
  iwren <= filled_flag;
  machine: process (clk)
  begin  -- process state
    if rising_edge(clk) then
      sendDataB  <= sendData;
      sendStartB <= sendStart;      
      ordenB     <= orden;
      accDataB   <= accData;
    end if;
  end process machine;
  snd  : sender_m
    generic map (
      wtime => x"02fb") --259--29c(2af)--2fb(2ff)--35B(360)--3BA(3C5)--411(41a)
    port map (
      clk   => clk,
      data  => sendDataB,
      start => sendStartB,
      send  => serialO,
      busy  => busy);
  acce : accepter_m
    generic map (
      wtime => x"02fb") --226--29c(290)--2fb(2f0)--35B(350)--3BA(3B0)--411(40a)
    port map (
      clk          => clk,
      serial_data  => serialI,
      filled_flag  => filled_flag,
      pararel_data => accData);
  ibuf : fifo8
    port map (
      clk   => clk,
      wr_en => iwren,
      rd_en => irden,
      din   => idin,
      dout  => idout,
      full  => spill,
      empty => iempty);
  obuf : fifo8
    port map (
      clk   => clk,
      wr_en => owren,
      rd_en => ordenB,
      din   => odin,
      dout  => odout,
      full  => ofull,
      empty => oempty);            
end machine;
