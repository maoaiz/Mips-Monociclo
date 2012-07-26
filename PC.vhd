
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is

begin

	process (clk)
		begin
			if en = '1' then
				if rising_edge (clk) then
					pc_out <= pc_in;
				end if;
			end if;
		end process;


end Behavioral;

