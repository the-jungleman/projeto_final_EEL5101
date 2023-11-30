library ieee;
use ieee.std_logic_1164.all;
entity REG2b is port (
    D     : in  std_logic_vector(1 downto 0);
    Reset : in  std_Logic;
    Enable: in  std_logic;
    CLK   : in  std_logic;
    Q     : out std_logic_vector(1 downto 0));
end REG2b;
architecture behv of REG2b is

begin
	process(CLK,Reset)
	begin
        if (Reset = '1') then
	        Q <= "00";
        elsif (Enable='1' and CLK'event and CLK = '1') then
		      Q<= D;
	    end if;
	end process;
end behv;