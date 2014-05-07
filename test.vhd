library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity TEST is
end TEST;

architecture TEST of TEST is
    component FMUL 
        port ( CLK: in std_logic;
               F1, F2 : in std_logic_vector (31 downto 0);
               ANS : out std_logic_vector (31 downto 0 ) );
    end component;
    signal CLK : std_logic := '1';
    signal state : std_logic_vector(2 downto 0) := "000";
    type rom_t is array (0 to 7) of std_logic_vector(31 downto 0);
    constant strrom1 : rom_t := (x"3fc00000", x"00000000", x"3fc00000", x"00000000", x"3fc00000",x"00000000",x"3fc00000",x"00000000");
    constant strrom2 : rom_t := (x"3fc00000", x"00000000", x"3fc00000", x"00000000", x"3fc00000",x"00000000",x"3fc00000",x"00000000");
    constant strrom3 : rom_t := (x"3fe1081c", x"3fe1081d", x"3fe1081e", x"3fe1081f", x"3fe10820", x"3fe10820", x"3fe10821", x"3f310822");
    signal F1 : std_logic_vector (31 downto 0);
    signal F2 : std_logic_vector (31 downto 0);
    signal F3 : std_logic_vector (31 downto 0);
    signal OUTPUT  : std_logic_vector ( 31 downto 0 );
begin
    U0:FMUL port map ( CLK, F1, F2, OUTPUT );

    THIS_LOOPS_FOREVER: process (CLK)
    begin
        if rising_edge(CLK) then
            F1 <= strrom1(conv_integer(state));
            F2 <= strrom2(conv_integer(state));
            F3 <= strrom3(conv_integer(state - 3)); 
            state <= state + 1;
        end if;
    end process;

    CLOCKGEN: process
    begin
        CLK <= '0';
        wait for 5 ns;
        CLK <= '1';
        wait for 5 ns;
    end process;
end;
