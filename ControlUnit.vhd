library ieee; 
use ieee.std_logic_1164.all;

entity ControlUnit is
	port(
		Op		: in std_logic_vector(5 downto 0);
		Funct		: in std_logic_vector(5 downto 0);
		rf_wr		: out std_logic;--habilita la escritura en un registro			//RegWrite
		dw_sel		: out std_logic;--habilita cual dato se enviara a escribir 		//MemtoReg
		dm_wr		: out std_logic;--habilita la escritura en memoria 			//MemWrite
		dm_rd		: out std_logic;--habilita la lectura en memoria 			//MemRead
		ALUOperation	: out std_logic_vector(2 downto 0);--operacion a realizar en la ALU 	//ALUOp
		alu_src_b	: out std_logic;--habilita el Rt o el Inm_extendido 			//alu_src_b
		rw_sel		: out std_logic_vector(1 downto 0);--habilita en cual registro se va a escribir //RegDst
		Branch		: out std_logic;--
		Jump		: out std_logic;
		Jal		: out std_logic
	);
end ControlUnit;

architecture ControlUnit_arc of ControlUnit is 

begin

process (Op, Funct)
begin
	case Op is
		-- Instructiones Tipo R
		when "000000" =>
			rf_wr		<= '1';	--siempre habilitamos la escritura para un registro en los Tipo R
			rw_sel		<= "01";--seleccionamos el registro en el multiplexor
			alu_src_b	<= '0'; --seleccionamos el dato que esta en Rt
			dm_wr		<= '0'; --no se va a escribir en memoria
			dm_rd		<= '0';
			dw_sel		<= '0'; --se toma el resultado de la ALU (0) (1 para el resultado de la Memoria)
			Jump		<= '0'; --
			Jal		<= '0'; --
			Branch 		<= '0'; --

			case Funct is
				when "100000"=>	ALUOperation <= "000";-- add
				
				when "100010"=>	ALUOperation <= "001";-- sub
				
				when "100100"=>	ALUOperation <= "011";-- and
				
				when "100101"=>	ALUOperation <= "100";-- or
				
				when "101010"=>	ALUOperation <= "101";-- slt
				
				when others => null;-- para el resto
			end case;
		-- lw
		when "100011" =>
			rf_wr		<= '1';
			rw_sel		<= "00";
			alu_src_b	<= '1';
			Branch 		<= '0';
			dm_wr		<= '0';
			dm_rd		<= '1';
			dw_sel		<= '1';
			Jump		<= '0';
			Jal		<= '0';
			ALUOperation 	<= "010"; 
		-- sw
		when "101011" =>
			rf_wr		<= '0';
			rw_sel		<= "00";
			alu_src_b	<= '1';
			Branch 		<= '0';
			dm_wr		<= '1';
			dm_rd		<= '0';
			dw_sel		<= '0';
			Jump		<= '0';
			Jal		<= '0';
			ALUOperation 	<= "010"; 
		-- addi
		when "001000" =>
			rf_wr		<= '1';
			rw_sel		<= "00";
			alu_src_b	<= '1';
			Branch 		<= '0';
			dm_wr		<= '0';
			dm_rd		<= '0';
			dw_sel		<= '0';
			Jump		<= '0';
			Jal		<= '0';
			ALUOperation 	<= "010"; 
		-- j
		when "000010" =>
			rf_wr		<= '0';
			rw_sel		<= "00"; 
			alu_src_b	<= '0'; 
			Branch 		<= '0'; 
			dm_wr		<= '0'; 
			dm_rd		<= '0';
			dw_sel		<= '0';	
			Jump		<= '1';
			Jal		<= '0';
			ALUOperation 	<= "010"; 
		-- jal
		when "000011" =>
			rf_wr		<= '1';
			rw_sel		<= "10"; 
			alu_src_b	<= '0';
			Branch 		<= '0';
			dm_wr		<= '0';
			dm_rd		<= '0';
			dw_sel		<= '0';
			Jump		<= '1';
			Jal		<= '1';
		-- beq
		when "000100" =>
			rf_wr		<= '0';
			rw_sel		<= "00";
			alu_src_b	<= '0';
			Branch 		<= '1';
			dm_wr		<= '0';
			dm_rd		<= '0';
			dw_sel		<= '0';
			Jump		<= '0';
			Jal		<= '0';
			ALUOperation 	<= "101";
		-- bnq
		when "000101" =>
			rf_wr		<= '0';
			rw_sel		<= "00";
			alu_src_b	<= '0';
			Branch 		<= '1';
			dm_wr		<= '0';
			dm_rd		<= '0';
			dw_sel		<= '0';
			Jump		<= '0';
			Jal		<= '0';
			ALUOperation 	<= "110";
		
		when others => null;

	end case;

end process;

end;
