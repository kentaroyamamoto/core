library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity io is
  port (
    clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(31 downto 0);
    serial_out : out std_logic;
    serial_in : in std_logic;
    full,empty : out std_logic;
    wr_en, rd_en : in std_logic);
end io;

architecture io of io is
component sender
  port (
    clk : in std_logic;
    din : in std_logic_vector(7 downto 0);
    wr_en : in std_logic;
    full : out std_logic;
    serial_out : out std_logic);
end component;

component receiver
  port (
    clk : in std_logic;
    dout : out std_logic_vector(31 downto 0);
    rd_en : in std_logic;
    empty : out std_logic;
    serial_in : in std_logic);
end component;

begin
  send : sender port map (
    clk => clk,
    din => din,
    wr_en => wr_en,
    full => full,
    serial_out => serial_out);
  
  recv : receiver port map (
    clk => clk,
    dout => dout,
    rd_en => rd_en,
    empty => empty,
    serial_in => serial_in);
end io;
