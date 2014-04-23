--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:56:33 04/21/2014
-- Design Name:   
-- Module Name:   /home/kentaro/core/core/tb.vhd
-- Project Name:  core
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
use ieee.STD_LOGIC_ARITH.all;
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         MCLK1 : IN  std_logic;
         RS_TX : OUT  std_logic;
         RS_RX : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal MCLK1 : std_logic := '0';
   signal RS_RX : std_logic := '1';
    signal countdown : std_logic_vector(15 downto 0) := x"1B16";
 	--Outputs
   signal RS_TX : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          MCLK1 => MCLK1,
          RS_TX => RS_TX,
          RS_RX => RS_RX
        );

   -- Clock process definitions
   clk_process :process
   begin
		MCLK1 <= '0';
		wait for 5 ns;
		MCLK1 <= '1';
		wait for 5 ns;
   end process;
   rsrxgen : process(MCLK1)
   begin
     if rising_edge(MCLK1) then
       if countdown = 0 then
         RS_RX <= not RS_RX;
         countdown <= x"1B16";
       else
         countdown <= countdown - 1;
       end if;
     end if;
   end process;
END;
