--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:59:07 06/20/2012
-- Design Name:   
-- Module Name:   F:/safeBox ok/monociclo/tb_ALU.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         d1 : IN  std_logic_vector(31 downto 0);
         d2 : IN  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         ctrlALU : IN  std_logic_vector(2 downto 0);
         resultadoALU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d1 : std_logic_vector(31 downto 0) := (others => '0');
   signal d2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ctrlALU : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal zero : std_logic;
   signal resultadoALU : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          d1 => d1,
          d2 => d2,
          zero => zero,
          ctrlALU => ctrlALU,
          resultadoALU => resultadoALU
        );

   -- Stimulus process
   stim_proc: process
   begin		
		d1<= "00000000000000000000000000000010";
		d2<= "00000000000000000000000000000101";
		ctrlALU <= "101";
      wait;
   end process;

END;
