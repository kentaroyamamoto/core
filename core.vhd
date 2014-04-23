library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity core is
  port (
    clk : in std_logic;
    ir : in std_logic_vector(31 downto 0));
end core;

architecture core of core is
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

  type reg is array (integer range <>) of std_logic_vector(31 downto 0);
  signal register : reg(0 to 31);
  signal ir : std_logic_vector(31 downto 0);
  signal cycle : std_logic_vector(2 downto 0);
  signal pc : std_logic_vector(31 downto 0) := x"00000000";
  
begin
  im : imem port map (
    clk =>
    addra =>
    douta => ir;
  );
  
  p1 : process(clk)
  begin
    if rising_edge (clk) then
      case cycle is
        when "000" =>
          state <= state + 1;
        when "001" =>
          state <= state + 1;
        when "010" =>
          state <= state + 1;
        when "011" =>
          state <= state + 1;
        when "100" =>
          pc <= pc + 1;
          state <= state + 1;
        when "101" =>
          state <= "000";
      end case;
    end if;
  end process;
end core;
