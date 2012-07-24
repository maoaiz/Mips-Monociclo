--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:37:10 07/23/2012
-- Design Name:   
-- Module Name:   F:/safeBox ok/monociclo/tb_muxRW.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: muxRW
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_muxRW IS
END tb_muxRW;
 
ARCHITECTURE behavior OF tb_muxRW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxRW
    PORT(
         rt : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         ra : IN  std_logic_vector(4 downto 0);
         rw_sel : IN  std_logic_vector(1 downto 0);
         rw : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rt : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal ra : std_logic_vector(4 downto 0) := (others => '0');
   signal rw_sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal rw : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxRW PORT MAP (
          rt => rt,
          rd => rd,
          ra => ra,
          rw_sel => rw_sel,
          rw => rw
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
		rw_sel <= "00";
		rd <= "11110";
      rt <= "01000";
		ra <= "11011";
      wait;
   end process;

END;
