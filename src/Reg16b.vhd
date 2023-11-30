library ieee;
use ieee.std_logic_1164.all;

entity  reg_16bits   is  port(
    d   :   in  std_logic_vector(7  downto  0);
    Enable,CLK,Reset :   in  std_Logic;
    q   :   out std_logic_vector(7  downto  0)
);
end reg_16bits;

architecture reg of reg_16bits is

begin
	process(CLK,rst)
	begin
        if  rst='1' then
	        q   <=  "0000000000000000";
        elsif	Enable='1'	and	CLK	'event	and	CLK='1'	then
		    q	<=	d;
	    end	if;
	end	process;
end reg;