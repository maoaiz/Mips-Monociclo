--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:09:44 06/20/2012
-- Design Name:   
-- Module Name:   F:/safeBox ok/monociclo/tb_registro.vhd
-- Project Name:  monociclo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registros
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
 
ENTITY tb_registro IS
END tb_registro;
 
ARCHITECTURE behavior OF tb_registro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registros
    PORT(
         clk : IN  std_logic;
         reg_escritura : IN  std_logic;
         leer_RF1 : IN  std_logic_vector(4 downto 0);
         leer_RF2 : IN  std_logic_vector(4 downto 0);
         escribir_RD : IN  std_logic_vector(4 downto 0);
         escribir_D : IN  std_logic_vector(31 downto 0);
         DL1 : OUT  std_logic_vector(31 downto 0);
         DL2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reg_escritura : std_logic := '0';
   signal leer_RF1 : std_logic_vector(4 downto 0) := (others => '0');
   signal leer_RF2 : std_logic_vector(4 downto 0) := (others => '0');
   signal escribir_RD : std_logic_vector(4 downto 0) := (others => '0');
   signal escribir_D : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DL1 : std_logic_vector(31 downto 0);
   signal DL2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registros PORT MAP (
          clk => clk,
          reg_escritura => reg_escritura,
          leer_RF1 => leer_RF1,
          leer_RF2 => leer_RF2,
          escribir_RD => escribir_RD,
          escribir_D => escribir_D,
          DL1 => DL1,
          DL2 => DL2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 20 ns;
		clk <= '1';
		wait for 20 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
	wait for 20 ns;
	
		reg_escritura<='1';
      leer_RF1<="00010";
		leer_RF2<="00011";
		escribir_RD<="01001";
		escribir_D<="00000000000000000000000000011111";
		
      wait for  20 ns;
		
		reg_escritura<='0';
      leer_RF1<="00000";
		leer_RF2<="01001";
      wait;
   end process;

END;
