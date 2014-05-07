library ieee;   
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.types.all;

entity serial_module is
  port (
    clk         : in  std_logic;
    serialI     : in  std_logic;
    serialO     : out std_logic);
end serial_module;
architecture rs232C of serial_module is
  component serialif_tb
    port (
      serialI    : in  std_logic;
      serialO    : out std_logic;
      acpt: in  std_logic;
      dout       : out std_logic_vector(7 downto 0);
      din        : in  std_logic_vector(7 downto 0);
      empty,full : out std_logic;
      send,clk   : in  std_logic);
  end component;
  signal din,dout : std_logic_vector(7 downto 0) := (others => '0');
  signal sempty,sfull : std_logic;
  signal acpt,send : std_logic := '0';

  type bin is file of character;
  file OUTPUT_FILE : bin open write_mode is "output.txt";
  file INPUT_FILE  : bin open read_mode is "input.txt";  
begin  -- serial_module
  acpt <= (not sempty);
  writeToFile: process(clk,dout)
    variable fwriteChar : character;
  begin  -- process writeToFile
    if rising_edge(clk) then
      if sempty = '0' then
        fwriteChar := character'val(conv_integer(dout));
        write(OUTPUT_FILE,fwriteChar);
      end if;
    end if;
  end process writeToFile;

  readFrmFile: process
    variable freadChar : character;
  begin
    wait until rising_edge(clk) and sfull = '0';
    if endfile(INPUT_FILE) then
      send <= '0';
      wait;
    else
      read(INPUT_FILE,freadChar);
      din <= conv_std_logic_vector(character'pos(freadChar),8);      
      send <= '1';
    end if;
  end process;
  serialPort : serialif_tb
    port map (
      clk     => clk,
      serialI => serialI,
      serialO => serialO,
      acpt    => acpt,
      send    => send,
      dout    => dout,
      din     => din,
      empty   => sempty,
      full    => sfull);
end rs232C;
