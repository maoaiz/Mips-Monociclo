----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:09 07/23/2012 
-- Design Name: 
-- Module Name:    muxRW - Behavioral 
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

entity muxRW is
    Port ( rt : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           ra : in  STD_LOGIC_VECTOR (4 downto 0);
           rw_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           rw : out  STD_LOGIC_VECTOR (4 downto 0));
end muxRW;

architecture Behavioral of muxRW is

begin
	--rw <= "00011";
  process(rw_sel,rt,rd,ra)
  begin
		case rw_sel is
			when "01" => --rt
				rw <= rt;
         when "10" => --ra
				rw <= ra;
			when "00" => --rd
				rw <= (rd);
			when others => rw <="11111";		
		end case;
			
  
  end process;


end Behavioral;




