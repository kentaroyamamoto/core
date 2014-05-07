library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity tb is
end tb;

architecture tb of tb is
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

  signal simclk : std_logic;
  signal countdown : std_logic_vector(15 downto 0) := x"1B16";
  signal serial_in,serial_out : std_logic := '1';
  signal rd_en, wr_en, full, empty : std_logic := '0';
  signal din : std_logic_vector(7 downto 0);
  signal dout : std_logic_vector(31 downto 0);
  
  begin
    myio : io port map (
      clk => simclk,
      din => din,
      dout => dout,
      serial_out => serial_out,
      serial_in => serial_in,
      full => full,
      empty => empty,
      wr_en => wr_en,
      rd_en => rd_en
    );

    p1 : process(simclk)
    begin
      if rising_edge(simclk) then
        if countdown = 0 then
          serial_in <= not serial_in;
          countdown <= x"1B16";
        else
          countdown <= countdown - 1;
        end if;
      end if;
    end process;

    rd_en <= not empty;
    wr_en <= not empty;
    din <= dout(7 downto 0);
    
    clockgen : process
    begin
      simclk <= '0';
      wait for 5 ns;
      simclk <= '1';
      wait for 5 ns;
    end process;
end tb;
