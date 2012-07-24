LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_DataMemory IS
END tb_DataMemory;
 
ARCHITECTURE behavior OF tb_DataMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         Clk : IN  std_logic;
         Mem_Escritura : IN  std_logic;
         Mem_Lectura : IN  std_logic;
         Direccion : IN  std_logic_vector(31 downto 0);
         Escribir_Dato : IN  std_logic_vector(31 downto 0);
         Leer_Dato : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Mem_Escritura : std_logic := '0';
   signal Mem_Lectura : std_logic := '0';
   signal Direccion : std_logic_vector(31 downto 0) := (others => '0');
   signal Escribir_Dato : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Leer_Dato : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          Clk => Clk,
          Mem_Escritura => Mem_Escritura,
          Mem_Lectura => Mem_Lectura,
          Direccion => Direccion,
          Escribir_Dato => Escribir_Dato,
          Leer_Dato => Leer_Dato
        );


   -- Stimulus process
   stim_proc: process
   begin
	 Mem_Escritura <= '1';
         Mem_Lectura <= '0';
         Direccion <= "00000000000000000000000000000011";
         Escribir_Dato <= "00000000000000000000000000011111";

      wait;
   end process;

END;
