library ieee;
use ieee.std_logic_1164.all;

entity  reg_8bits   is  port(
    D   :   in  std_logic_vector(7  downto  0);
    Enable,CLK,Reset :   in  std_Logic;
    Q   :   out std_logic_vector(7  downto  0)
);
end reg_8bits;

architecture reg of reg_8bits is

begin
	process(CLK,Reset)
	begin
        if  Reset='1' then
	        Q   <=  "00000000";
        elsif	Enable='1'	and	CLK	'event	and	CLK='1'	then
		    Q	<=	D;
	    end	if;
	end	process;
end reg;