library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( Clk : in  STD_LOGIC;
           Mem_Escritura : in  STD_LOGIC;
           Mem_Lectura : in  STD_LOGIC;
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Escribir_Dato : in  STD_LOGIC_VECTOR (31 downto 0);
           Leer_Dato : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end DataMemory;

architecture Behavioral of DataMemory is

type ram is array (0 to 511) of STD_LOGIC_VECTOR(31 downto 0);
signal memoria: ram :=	(
			x"00000000",
			x"00000001",
			x"00000002",
			x"00000003",
			x"00000004",
			x"00000005",
			x"00000008",
			x"00000007",
			x"00000008",
			x"00000009",
			x"0000000A",
			x"0000000B",
			x"0000000C",
			x"0000000D",
			x"0000000E",
			x"0000000F",
			-----------
			x"00000010",
			x"00000011",
			x"00000012",
			x"00000013",
			x"00000014",
			x"00000015",
			x"00000016",
			x"00000017",
			x"00000018",
			x"00000019",
			x"0000001A",
			others=>X"00000000");

begin
		Leer_Dato <= memoria(conv_integer(Direccion(7 downto 2)));

		process(clk)
		begin
			if (rising_edge(clk)) then
				if (Mem_Escritura = '1')then  
					memoria(conv_integer(Direccion(7 downto 2)))<=  Escribir_Dato;
				end if;
			end if;
		end process;


end Behavioral;
