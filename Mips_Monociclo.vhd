----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:40:36 07/25/2012 
-- Design Name: 
-- Module Name:    Mips_Monociclo - MonocicloCompleto 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mips_Monociclo is
		 Port ( clk : in  STD_LOGIC;
				  enable: in  STD_LOGIC);
end Mips_Monociclo;

architecture MonocicloCompleto of Mips_Monociclo is
----------------- <COMPONENTES> -----------------
	COMPONENT InstructionMemory
	PORT(
		Leer_Direccion : IN std_logic_vector(31 downto 0);          
		Instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT SEU
	PORT(
		inmediato : IN std_logic_vector(15 downto 0);          
		inm_ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT muxRW
	PORT(
		rt : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		ra : IN std_logic_vector(4 downto 0);
		rw_sel : IN std_logic_vector(1 downto 0);          
		rw : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	PORT(
		clk : IN std_logic;
		reg_escritura : IN std_logic;
		leer_RF1 : IN std_logic_vector(4 downto 0);
		leer_RF2 : IN std_logic_vector(4 downto 0);
		escribir_RD : IN std_logic_vector(4 downto 0);
		escribir_D : IN std_logic_vector(31 downto 0);          
		DL1 : OUT std_logic_vector(31 downto 0);
		DL2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT muxALU
	PORT(
		DL2 : IN std_logic_vector(31 downto 0);
		inm_ext : IN std_logic_vector(31 downto 0);
		alu_src_b : IN std_logic;          
		d2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT ALU
	PORT(
		d1 : IN std_logic_vector(31 downto 0);
		d2 : IN std_logic_vector(31 downto 0);
		ctrlALU : IN std_logic_vector(2 downto 0);          
		zero : OUT std_logic;
		resultadoALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT DataMemory
	PORT(
		Clk : IN std_logic;
		Mem_Escritura : IN std_logic;
		Mem_Lectura : IN std_logic;
		Direccion : IN std_logic_vector(31 downto 0);
		Escribir_Dato : IN std_logic_vector(31 downto 0);          
		Leer_Dato : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT muxDW
	PORT(
		rd : IN std_logic_vector(31 downto 0);
		ALU_result : IN std_logic_vector(31 downto 0);
		dw_sel : IN std_logic;          
		dw : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT ControlUnit
	PORT(
		Op : IN std_logic_vector(5 downto 0);
		Funct : IN std_logic_vector(5 downto 0);          
		rf_wr : OUT std_logic;
		dw_sel : OUT std_logic;
		dm_wr : OUT std_logic;
		ALUOperation : OUT std_logic_vector(2 downto 0);
		alu_src_b : OUT std_logic;
		rw_sel : OUT std_logic_vector(1 downto 0);
		Branch : OUT std_logic;
		Jump : OUT std_logic;
		Jal : OUT std_logic
		);
	END COMPONENT;
	COMPONENT PC
	PORT(
		pc_in : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		en : IN std_logic;          
		pc_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
----------------- </COMPONENTES> ----------------
----------------- <SENALES> -----------------
signal read_addr:std_logic_vector(31 downto 0);--
signal instruction:std_logic_vector(31 downto 0);--instruccion cpmpleta
signal inm_extented:std_logic_vector(31 downto 0);--inm_ext
signal rw_selector:std_logic_vector(1 downto 0);--rw_sel
signal dw_selector:std_logic;--dw_sel
signal register_write:std_logic_vector(4 downto 0);--rw
signal rw_write_selector:std_logic;--rw_wr
signal data_write:std_logic_vector(31 downto 0);--dw
signal alu_selector_b:std_logic;--alu_src_b
signal dm_write_enable:std_logic;--dm_wr
signal dm_read_enable:std_logic;--dm_rd
signal cu_branch:std_logic;--branch
signal cu_jump:std_logic;--jump
signal cu_jal:std_logic;--jal
signal alu_zero:std_logic;--zero
signal alu_op:STD_LOGIC_VECTOR (2 downto 0);
signal read_data1:std_logic_vector(31 downto 0);--contenido rs DL1
signal read_data2:std_logic_vector(31 downto 0);--contenido rt DL2
signal data_alu2:std_logic_vector(31 downto 0);--
signal alu_result:std_logic_vector(31 downto 0);--
signal dm_read_data:std_logic_vector(31 downto 0);--
signal PC_incremented:std_logic_vector(31 downto 0);--


----------------- </SENALES> ---------------

begin
----------------- <INSTANCIAS> -----------------
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Leer_Direccion => read_addr,
		Instruccion => instruction
	);
	Inst_SEU: SEU PORT MAP(
		inmediato => instruction(15 downto 0),
		inm_ext => inm_extented
	);
	Inst_muxRW: muxRW PORT MAP(
		rt => instruction(20 downto 16),
		rd => instruction(15 downto 11),
		ra => "11111",
		rw_sel => rw_selector,
		rw => register_write
	);
	Inst_RegisterFile: RegisterFile PORT MAP(
		clk => clk,
		reg_escritura => rw_write_selector,
		leer_RF1 => instruction(25 downto 21),
		leer_RF2 => instruction(20 downto 16),
		escribir_RD => register_write,
		escribir_D => data_write,
		DL1 => read_data1,
		DL2 => read_data2
	);
	Inst_muxALU: muxALU PORT MAP(
		DL2 => read_data2,
		inm_ext => inm_extented,
		alu_src_b => alu_selector_b,
		d2 => data_alu2
	);
	Inst_ALU: ALU PORT MAP(
		d1 => read_data1,
		d2 => data_alu2,
		zero => alu_zero,
		ctrlALU => alu_op,
		resultadoALU => alu_result
	);
	Inst_DataMemory: DataMemory PORT MAP(
		Clk => clk,
		Mem_Escritura => dm_write_enable,
		Mem_Lectura => dm_read_enable,
		Direccion => alu_result,
		Escribir_Dato => read_data2,
		Leer_Dato => dm_read_data
	);
	Inst_muxDW: muxDW PORT MAP(
		rd => dm_read_data,
		ALU_result => alu_result,
		dw_sel => dw_selector,
		dw => data_write
	);
	Inst_ControlUnit: ControlUnit PORT MAP(
		Op => instruction(31 downto 26),
		Funct => instruction(5 downto 0),
		rf_wr => rw_write_selector,
		dw_sel => dw_selector,
		dm_wr => dm_write_enable,
		ALUOperation => alu_op,
		alu_src_b => alu_selector_b,
		rw_sel => rw_selector,
		Branch => cu_branch,
		Jump => cu_jump,
		Jal => cu_jal
	);
	Inst_PC: PC PORT MAP(
		pc_in => PC_incremented,
		pc_out => read_addr,
		clk => clk,
		en => enable
	);

----------------- </INSTANCIAS> ----------------
end MonocicloCompleto;

