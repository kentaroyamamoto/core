library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sender_m is
  generic (
    wtime : std_logic_vector(15 downto 0) := x"1B16");
  port (  
    clk, start : in std_logic;
    data       : in std_logic_vector(7 downto 0);
    send, busy : out std_logic);
end sender_m;

architecture structure of sender_m is 
  signal countdown : std_logic_vector(15 downto 0) := (others=>'0');
  signal sendbuf : std_logic_vector(8 downto 0) := (others=>'1');
  signal state : std_logic_vector(3 downto 0) := "1111";

begin  -- structure
  send <= sendbuf(0);
  busy <= start when state > "1001" else '1';
  stetemachine: process (clk)
  begin  -- process stetemachine
    if rising_edge(clk) then
      if state > "1001" then
        if start = '1' then
          sendbuf <= data&'0';
          state <= "0000";
          countdown <= wtime;
        end if;
      else
        if countdown = 0 then
          sendbuf <= '1'&sendbuf(8 downto 1);
          countdown <= wtime;
          state <= state + 1;
        else
          countdown <= countdown - 1;
        end if;
      end if;
    end if;
  end process stetemachine;
end structure;
