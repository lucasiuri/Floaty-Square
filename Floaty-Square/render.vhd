library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity render is
port(rO, rP, gO, gP, bO, bP : in std_logic_vector(3 downto 0);
		clk: in std_logic;
		r, g, b: out std_logic_vector(3 downto 0);
		collision: out std_logic);
		
end render;

architecture comportamento of render is
begin
	process(clk, gP, gO)
	begin
		
		if rising_edge(clk) then
			if gP = "0110" or gO = "0110" then
				collision <= '0';
			else
				collision <= '1';
			end if;
		end if;
		if rO = "0110" then
			r <= rP; 
		else
			r <= rO;
		end if;
		
		if gO = "0110" then
			g <= gP; 
		else
			g <= gO;
		end if;
		
		if bO = "0110" then
			b <= bP; 
		else
			b <= bO;
		end if;
		
	
		
	end process;
end architecture;