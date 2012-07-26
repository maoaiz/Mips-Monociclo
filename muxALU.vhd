library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxALU is
    Port ( DL2 		: in  STD_LOGIC_VECTOR (31 downto 0);
           inm_ext 	: in  STD_LOGIC_VECTOR (31 downto 0);
           alu_src_b 	: in  STD_LOGIC;
           d2 		: out STD_LOGIC_VECTOR (31 downto 0));
end muxALU;

architecture Behavioral of muxALU is

begin
  process(alu_src_b,DL2,inm_ext)
  begin
	case alu_src_b is
		when '0'	=> d2 <= (DL2);
		when '1'	=> d2 <= inm_ext;
		when others	=> d2 <= (others => '0');		
	end case;
  end process;
end Behavioral;
