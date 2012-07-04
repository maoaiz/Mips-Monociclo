library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( d1 : in  STD_LOGIC_VECTOR (31 downto 0);
           d2 : in  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC;
           ctrlALU : in  STD_LOGIC_VECTOR (2 downto 0);
           resultadoALU : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is


begin
process(ctrlALU,d1 ,d2)
begin
	case ctrlALU is
      when "000" =>
         resultadoALU <= d1 + d2;    --SUMA
			zero <= '0';
			
      when "001" =>
         resultadoALU<= d1 - d2;     --RESTA
			zero <= '0';
		when "010" =>
			if d1 - d2 = x"00000000" then --BEQ
				zero <= '1';
			else
				zero <= '0';
			end if;
      when "011" =>
         resultadoALU <= d1 AND d2;  --AND
			zero <= '0';
			
      when "100" =>		
         resultadoALU<= d1 OR d2;  --OR
			zero <= '0';
			
      when "101" => --SLT set on less than
			if d1<d2 then 
				resultadoALU<=x"00000001";
				zero <= '0'; 
			else
				resultadoALU<=x"00000000"; 
				zero <= '0';
			end if;
		when others =>
			resultadoALU <= x"00000000";
			
END CASE; 

end process;
end Behavioral;


