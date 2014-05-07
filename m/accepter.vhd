library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity accepter_m is
  generic (
    wtime : std_logic_vector(15 downto 0) := x"1b16");
  port (
    clk          : in  std_logic;
    serial_data  : in  std_logic;
    filled_flag  : out std_logic;
    pararel_data : out std_logic_vector(7 downto 0));
end accepter_m;

architecture structure of accepter_m is
  signal countdown : std_logic_vector(15 downto 0) := wtime;
  signal databuf : std_logic_vector(7 downto 0);
  signal state : std_logic_vector(3 downto 0) := "1111";
  signal ib,ibb : std_logic := '1';

begin  -- structure
  statemachine: process (clk)
  begin  -- process statemachine
    if rising_edge(clk) then
      ib <= serial_data;
      ibb <= ib;
      if state = "1000" then
        filled_flag <= '1';
        state <= state + 1;
        pararel_data <= databuf;
        countdown <= wtime;        
      elsif state = "1001" then
        filled_flag <= '0';
        if ibb = '1' then
          state <= state + 1;                    
        end if;
      elsif state < "1000" then
        filled_flag <= '0';
        if countdown = "0000" then
          databuf(conv_integer(state(2 downto 0))) <= ibb;
          countdown <= wtime;
          state <= state + 1;
        else
          countdown <= countdown - 1;
        end if;
      else
        -- sleep state
        filled_flag <= '0';
        if ibb = '0' then
          state <= "0000";
          countdown <= wtime + wtime(15 downto 1);
        end if;
      end if;
    end if;
  end process statemachine;
end structure;


