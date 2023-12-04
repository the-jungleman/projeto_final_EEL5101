library IEEE;
use IEEE.Std_Logic_1164.all;

entity  mux4_1x8    is
port (
    S           :   in  std_logic_vector(1  downto  0);
    L0,L1,L2,L3 :   in  std_logic_vector(7  downto  0);
    D           :   out std_logic_vector(7  downto  0)
    );
end mux4_1x8;

architecture    Mult    of  mux4_1x8    is
begin 
    with    S   select  D<=L0   when    "00",
	    L1 when "01",
	    L2 when "10",
	    L3 when others;
end Mult;