--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:55:32 02/15/2014
-- Design Name:   
-- Module Name:   /home/harihitode/CAD/majesty/tb.vhd
-- Project Name:  majesty
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: core
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS
  type imem is array (0 to 33000) of std_logic_vector(31 downto 0);
  type sram is array (0 to 131072) of std_logic_vector(31 downto 0);
  -- Component Declaration for the Unit Under Test (UUT)
  
  COMPONENT core
    port (
      clk      : in    std_logic;
      IROMAddr : out   std_logic_vector(21 downto 0);
      IROMData : in    std_logic_vector(31 downto 0);
      SRAMData : inout std_logic_vector(31 downto 0);
      SRAMXWA : out   std_logic;
      SRAMAddr : out   std_logic_vector(19 downto 0);    
      serial_in  : in    std_logic;
      serial_out  : out   std_logic);    
  END COMPONENT;

  component serial_module
    port (
      clk         : in  std_logic;
      serialI     : in  std_logic;
      serialO     : out std_logic);    
  end component;
  --Inputs
  signal clk : std_logic := '0';
  signal serialI : std_logic := '0';

  --BiDirs
  signal SRAMData : std_logic_vector(31 downto 0);

  --Outputs
  signal SRAMRdEn : std_logic;
  signal SRAMAddr : std_logic_vector(19 downto 0);
  signal SRAMRdEnB,SRAMRdEnBB : std_logic := '1';
  signal SRAMAddrB,SRAMAddrBB : std_logic_vector(19 downto 0) := (others => '0');
  signal serialO : std_logic;

  -- Clock period definitions
  constant clk_period : time := 10 ns;

  signal iRam : imem := (
    x"00000000",
    x"b0100000",
    x"c0100000",
    x"78000000",
    others => x"00000000");
  signal Ram : sram := (others => x"00000000");
  signal IROMData : std_logic_vector(31 downto 0);
  signal IROMAddr : std_logic_vector(21 downto 0);
  signal IROMAddrB : std_logic_vector(21 downto 0) := (others => '0');
BEGIN
  -- Instantiate the Unit Under Test (UUT)
  uut: core PORT MAP (
    clk      => clk,
    IROMData => IROMData,
    IROMAddr => IROMAddr,
    SRAMXWA => SRAMRdEn,
    SRAMData => SRAMData,
    SRAMAddr => SRAMAddr,
    serial_in  => serialI,
    serial_out  => serialO);
  sp : serial_module port map (
    clk     => clk,
    serialI => serialO,
    serialO => serialI);
--  inst <= iRam(conv_integer(ipcB(14 downto 0)));
  IROMData <= iRam(conv_integer(IROMAddrB));  
  clk_sync: process (clk)
  begin  -- process clk_sync
    if rising_edge(clk) then
      IROMAddrB <= IROMAddr;
      SRAMRdEnB <= SRAMRdEn;
      SRAMRdEnBB <= SRAMRdEnB;
      SRAMAddrB <= SRAMAddr;
      SRAMAddrBB <= SRAMAddrB;
    end if;
  end process clk_sync;

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
  SRAMData <= Ram(conv_integer(SRAMAddrBB(16 downto 0))) when SRAMRdEnBB = '1' else
              (others => 'Z');
  sram_process: process (clk)
  begin  -- process sram_process
    if rising_edge(clk) then
      if SRAMRdEnBB = '0' then
        Ram(conv_integer(SRAMAddrBB)) <= SRAMData;   
      end if;
    end if;
  end process sram_process;

  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    wait for 1000 ns;	

    wait for clk_period*10;

    -- insert stimulus here 
    wait;
  end process;
END;
