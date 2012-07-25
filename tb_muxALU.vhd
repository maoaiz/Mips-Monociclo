LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_muxALU IS
END tb_muxALU;
 
ARCHITECTURE behavior OF tb_muxALU IS 
 
    COMPONENT muxALU
    PORT(
         DL2 : IN  std_logic_vector(31 downto 0);
         inm_ext : IN  std_logic_vector(31 downto 0);
         alu_src_b : IN  std_logic;
         dw : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DL2 : std_logic_vector(31 downto 0) := (others => '0');
   signal inm_ext : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_src_b : std_logic := '0';

 	--Outputs
   signal dw : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxALU PORT MAP (
          DL2 => DL2,
          inm_ext => inm_ext,
          alu_src_b => alu_src_b,
          dw => dw
        );

   -- Stimulus process
   stim_proc: process
   begin	
		 DL2 		<= "01010101010101010101010101010101";
		 inm_ext <= "11111111111111111101010101010101";
		 alu_src_b <= '0';
      wait;
   end process;

END;
