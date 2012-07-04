--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:32:10 07/03/2012
-- Design Name:   
-- Module Name:   F:/safeBox ok/monociclo/tb_ControlUnit.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit
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
use ieee.std_logic_arith.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
 ENTITY tb_ControlUnit IS
 END tb_ControlUnit;
 
 ARCHITECTURE behavior OF tb_ControlUnit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit
    PORT(
         Op : IN  std_logic_vector(5 downto 0);
         Funct : IN  std_logic_vector(5 downto 0);
         rf_wr : OUT  std_logic;
         dw_sel : OUT  std_logic;
         dm_wr : OUT  std_logic;
         ALUOperation : OUT  std_logic_vector(2 downto 0);
         alu_src_b : OUT  std_logic;
         rw_sel : OUT  std_logic_vector(1 downto 0);
         Branch : OUT  std_logic;
         Jump : OUT  std_logic;
         Jal : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(5 downto 0) := (others => '0');
   signal Funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal rf_wr : std_logic;
   signal dw_sel : std_logic;
   signal dm_wr : std_logic;
   signal ALUOperation : std_logic_vector(2 downto 0);
   signal alu_src_b : std_logic;
   signal rw_sel : std_logic_vector(1 downto 0);
   signal Branch : std_logic;
   signal Jump : std_logic;
   signal Jal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit PORT MAP (
          Op => Op,
          Funct => Funct,
          rf_wr => rf_wr,
          dw_sel => dw_sel,
          dm_wr => dm_wr,
          ALUOperation => ALUOperation,
          alu_src_b => alu_src_b,
          rw_sel => rw_sel,
          Branch => Branch,
          Jump => Jump,
          Jal => Jal
        );

   -- Stimulus process
   stim_proc: process
   begin		
     
        Op <= "101011";
		  Funct <="100000";
		  
           wait;
   end process;

END;
