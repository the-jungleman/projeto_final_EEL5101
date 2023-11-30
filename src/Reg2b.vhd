library ieee;
use ieee.std_logic_1164.all;

entity  reg_2bits   is  port(
    D   :   in  std_logic_vector(1  downto  0);
    Enable,CLOCK,Reset :   in  std_Logic;
    Q   :   out std_logic_vector(1  downto  0)
);
end reg_2bits;

architecture reg of reg_2bits is

begin
	process(CLK,Reset)
	begin
        if  Reset='1' then
	        Q   <=  "00";
        elsif	Enable='1'	and	CLK	'event	and	CLK='1'	then
		    Q	<=	D;
	    end	if;
	end	process;
end reg;