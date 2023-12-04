library ieee;
use ieee.std_logic_1164.all;

entity  reg16b	is	port(
    d   :   in  std_logic_vector(15  downto  0);
    Enable,CLOCK,Reset :   in  std_Logic;
    q   :   out std_logic_vector(15  downto  0)
);
end reg16b;

architecture	reg	of	reg16b	is

begin
	process(CLOCK,Reset)
	begin
        if  Reset='1' then
	        q   <=  "0000000000000000";
        elsif	Enable='1'	and	CLOCK	'event	and	CLOCK='1'	then
		    q	<=	d;
	    end	if;
	end	process;
end reg;