library ieee;
use ieee.std_logic_1164.all;

entity  reg8b	is	port(
    D   :   in  std_logic_vector(7  downto  0);
    Enable,CLOCK,Reset :   in  std_Logic;
    Q   :   out std_logic_vector(7  downto  0)
);
end reg8b;

architecture	reg	of	reg8b	is

begin
	process(CLOCK,Reset)
	begin
        if  Reset='1' then
	        Q   <=  "00000000";
        elsif	Enable='1'	and	CLOCK	'event	and	CLOCK='1'	then
		    Q	<=	D;
	    end	if;
	end	process;
end reg;