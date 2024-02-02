library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity quadrado is
port(clk, flap: in std_logic;
	  linha, coluna: in std_logic_vector(9 downto 0);
	  r, g, b: out std_logic_vector(3 downto 0));
end quadrado;

architecture desenho of quadrado is
shared variable position:  integer := 220;
begin

	process(linha, coluna, clk)
	begin
	if rising_edge(clk) then	
		if not flap then
			if position > 0 then
				position := position - 3;
			else
				position := 0;
			end if;
		elsif position < 440 then
			position := position + 3;
		elsif position > 440 then
			position := 440;
		end if;
	end if;

		
		if to_integer(unsigned(linha)) > position and to_integer(unsigned(linha)) < position + 40 and coluna > 10d"60" and coluna < 10d"100" then
				r <= (others => '1');
				g <= (others=> '0');
				b <= (others=> '1');
		else
			r <= "0110";
			g <= "0110";
			b <= "0110";
		end if;
	
	end process;
	
	
end desenho;
	
	
	