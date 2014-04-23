library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity recv_min is
  generic (
    wtime: std_logic_vector(15 downto 0) := x"1B16";
    hwtime: std_logic_vector(11 downto 0) := x"800");
  port (
    clk : in std_logic;
    dout : out std_logic_vector(7 downto 0);
    rx : in std_logic;
    ready : out std_logic);
end recv_min;

architecture recv_min of recv_min is
  signal state : std_logic_vector(3 downto 0) := "1110";
  signal rx_buf: std_logic := '1';
  signal hf_count : std_logic_vector(11 downto 0);
  signal countdown : std_logic_vector(15 downto 0);
  signal data : std_logic_vector(7 downto 0);
  signal ready_o : std_logic := '0';
  
begin
  ready <= ready_o;
  p1 : process(clk)
  begin
    if rising_edge(clk) then
      rx_buf <= rx;
      case state is
        when "1110" =>
          ready_o <= '0';
          if rx_buf = '0' then
            state <= state + 1;
            hf_count <= hwtime;
          end if;
        when "1111" =>
          if hf_count = 0 then
            if rx_buf = '0' then
              state <= state + 1;
              countdown <= wtime;
            else
              state <= "1110";
            end if;
          else
            hf_count <= hf_count - 1;
          end if;
        when "1000" =>
          ready_o <= '1';
          state <= state + 1;
          countdown <= wtime;
          dout <= data;
        when "1001" =>
          ready_o <= '0';
          if countdown = 0 then
            state <= "1110";
          else
            countdown <= countdown - 1;
          end if;
        when others =>
          if countdown = 0 then
            data(conv_integer(state)) <= rx_buf;
            state <= state + 1;
            countdown <= wtime;
          else
            countdown <= countdown - 1;
          end if;
      end case;
    end if;
  end process;
end recv_min;
