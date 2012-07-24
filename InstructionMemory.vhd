library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InstructionMemory is
    Port ( Leer_Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruccion : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

type rom is array (0 to 511) of std_logic_vector (31 downto 0);


constant memoria: rom:=(
			X"3c011001",
			X"34300000",
			X"3c011001",
			X"34350018",
			X"8eb50000",
			X"24180004",
			X"24120005",
			X"ae120000",
			X"24120004",
			X"ae120004",
			X"24120008",
			X"ae120008",
			X"24120001",
			X"ae12000c",
			X"2412000a",
			X"ae120010",
			X"24120002",
			X"ae120014",
			X"24130001",
			X"0275482a",
			X"11200018",
			X"0013a020",
			X"72985002",
			X"020a5820",
			X"8d710000",
			X"0014602a",
			X"1180000d",
			X"20010001",
			X"02817022",
			X"71d85002",
			X"020a6820",
			X"8dad0000",
			X"022d602a",
			X"11800006",
			X"72985002",
			X"020a5820",
			X"ad6d0000",
			X"20010001",
			X"0281a022",
			X"08100019",
			X"72985002",
			X"020a5820",
			X"ad710000",
			X"22730001",
			X"08100013",
			X"014b4820",

	others => X"00000000");

begin

		Instruccion <= memoria(conv_integer(Leer_Direccion));


end Behavioral;












