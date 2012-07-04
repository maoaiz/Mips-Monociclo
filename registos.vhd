----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:02:09 06/18/2012 
-- Design Name: 
-- Module Name:    registos - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;



entity registros is

 Port ( clk : in  STD_LOGIC;
           reg_escritura : in  STD_LOGIC;
           leer_RF1 : in  STD_LOGIC_VECTOR (4 downto 0);
           leer_RF2 : in  STD_LOGIC_VECTOR (4 downto 0);
           escribir_RD : in  STD_LOGIC_VECTOR (4 downto 0);
           escribir_D : in  STD_LOGIC_VECTOR (31 downto 0);
           DL1 : out  STD_LOGIC_VECTOR (31 downto 0);
           DL2 : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end registros;

architecture Behavioral of registros is

type rom is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

	signal memoria: rom := (	x"00000000",
									   x"00000001",
									   x"00000002",
									   x"00000003",
									   x"00000004",
									   x"00000005",
									   x"00000006",
									   x"00000007",
									   x"00000008",
									   x"00000009",
									   x"0000000A",
									   x"0000000B",
									   x"0000000C",
									   x"0000000D",
									   x"0000000E",
									   x"0000000F",
									   x"0000000F",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
									   x"00000001",
	                          others=>X"00000000"
									  );
begin
   DL1 <= memoria(conv_integer (leer_RF1)) ;
	DL2 <= memoria(conv_integer (leer_RF2)) ;
	
	process (clk)
	begin
		if (rising_edge (clk)) then 
			if reg_escritura = '1' and escribir_RD /= "00000" then  
				memoria(conv_integer (escribir_RD)) <= escribir_D ;
end if;
		end if;
end process;

end Behavioral;