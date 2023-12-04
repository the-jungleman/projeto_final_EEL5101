library IEEE;
use IEEE.Std_Logic_1164.all;

entity  mux2_1x8    is
port (
    S       :   in  std_logic;
    L0,L1   :   in  std_logic_vector(7  downto  0);
    D       :   out std_logic_vector(7  downto  0)
    );
end mux2_1x8;

architecture    mux of  mux2_1x8    is
begin
    with    S   select  D<=L0   when    '0', -- quando o E6 for igual a 0 a chave muda para apenas mostrar o Pisca
	    L1 when others;
end mux;