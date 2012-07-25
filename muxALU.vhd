library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxALU is
    Port ( DL2 		: in  STD_LOGIC_VECTOR (31 downto 0);
           inm_ext 	: in  STD_LOGIC_VECTOR (31 downto 0);
           alu_src_b 	: in  STD_LOGIC;
           dw 		: out STD_LOGIC_VECTOR (31 downto 0));
end muxALU;

architecture Behavioral of muxALU is

begin
  process(alu_src_b,DL2,inm_ext)
  begin
	case alu_src_b is
		when '0'	=> dw <= (DL2);
		when '1'	=> dw <= inm_ext;
		when others	=> dw <= (others => '0');		
	end case;
  end process;
end Behavioral;
