library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxDW is
    Port ( rd 		: in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_result 	: in  STD_LOGIC_VECTOR (31 downto 0);
           dw_sel 	: in  STD_LOGIC;
           dw 		: out STD_LOGIC_VECTOR (31 downto 0));
end muxDW;

architecture Behavioral of muxDW is

begin
  process(dw_sel,rd,ALU_result)
  begin
	case dw_sel is
		when '0'	=> dw <= (ALU_result);
		when '1'	=> dw <= rd;
		when others	=> dw <= (others => '0');		
	end case;
  end process;
end Behavioral;
