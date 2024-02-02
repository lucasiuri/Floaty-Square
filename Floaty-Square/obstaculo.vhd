library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity obstaculo is
port(clk: in std_logic;
	  linha, coluna: in std_logic_vector(9 downto 0);
	  rnd1, rnd2, rnd3: in std_logic_vector(3 downto 0);
	  r, g, b: out std_logic_vector(3 downto 0));
end obstaculo;

architecture desenho of obstaculo is
signal positionLinha1, positionLinha2, positionLinha3 : integer;
shared variable positionColuna1, positionColuna2, positionColuna3:  integer;
begin
	
	
	process(linha, coluna, clk)
	begin

		if rising_edge(clk) then
			
			if positionColuna3 <= -40 then
				positionColuna1 := 640;
				positionColuna2 := 940;
				positionColuna3 := 1240;
				positionLinha1 <= to_integer(unsigned(rnd1)) * 30;
				positionLinha2 <= to_integer(unsigned(rnd2)) * 30;
				positionLinha3 <= to_integer(unsigned(rnd3)) * 30;

			else
				positionColuna1 := positionColuna1 - 1;
				positionColuna2 := positionColuna2 - 1;
				positionColuna3 := positionColuna3 - 1;
				
			end if;
			
		end if;
			
		if (to_integer(unsigned(coluna)) > positionColuna1 and to_integer(unsigned(coluna)) < positionColuna1 + 40 and to_integer(unsigned(linha)) > positionLinha1 and to_integer(unsigned(linha)) < positionLinha1 + 140) or (to_integer(unsigned(coluna)) > positionColuna2 and to_integer(unsigned(coluna)) < positionColuna2 + 40 and to_integer(unsigned(linha)) > positionLinha2 and to_integer(unsigned(linha)) < positionLinha2 + 140) or (to_integer(unsigned(coluna)) > positionColuna3 and to_integer(unsigned(coluna)) < positionColuna3 + 40 and to_integer(unsigned(linha)) > positionLinha3 and to_integer(unsigned(linha)) < positionLinha3 + 140) then
			r <= "0110";
			g <= "0110";
			b <= "0110";
		elsif (to_integer(unsigned(coluna)) > positionColuna1 and to_integer(unsigned(coluna)) < positionColuna1 + 40) or (to_integer(unsigned(coluna)) > positionColuna2 and to_integer(unsigned(coluna)) < positionColuna2 + 40) or (to_integer(unsigned(coluna)) > positionColuna3 and to_integer(unsigned(coluna)) < positionColuna3 + 40) then
			r <= "0000";
			g <= "1111";
			b <= "0000";
		else
			r <= "0110";
			g <= "0110";
			b <= "0110";
		end if;
		
		
	end process;
	
end desenho;
	
	
	