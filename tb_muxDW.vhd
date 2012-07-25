LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_muxDW IS
END tb_muxDW;
 
ARCHITECTURE behavior OF tb_muxDW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT muxDW
    PORT(
         rd : IN  std_logic_vector(31 downto 0);
         ALU_result : IN  std_logic_vector(31 downto 0);
         dw_sel : IN  std_logic;
         dw : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic_vector(31 downto 0) := (others => '0');
   signal ALU_result : std_logic_vector(31 downto 0) := (others => '0');
   signal dw_sel : std_logic := '0';

 	--Outputs
   signal dw : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: muxDW PORT MAP (
          rd => rd,
          ALU_result => ALU_result,
          dw_sel => dw_sel,
          dw => dw
        );
		  
   -- Stimulus process
   stim_proc: process
   begin
		 rd 		<= "01010101010101010101010101010101";
		 ALU_result <= "11111111111111111101010101010101";
		 dw_sel <= '1';
      wait;
   end process;

END;
