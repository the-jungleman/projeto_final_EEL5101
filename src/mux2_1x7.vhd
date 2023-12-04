library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux2_1x7 is
port (
    S       :   in  std_logic;
    L0,L1   :   in  std_logic_vector(6  downto  0);
    D       :   out std_logic_vector(6  downto  0)
    );
end mux2_1x7;

architecture    mux of  mux2_1x7    is
begin 
    with    S   select  D<=L0   when    '0',
	    L1 when others;
end mux;