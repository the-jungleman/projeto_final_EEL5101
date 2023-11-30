library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity  somador is
port (
    A:  in  std_logic_vector(7  downto  0);
    B:  in  std_logic_vector(7  downto  0);
    S:  out std_logic_vector(7  downto  0)
     );
end somador;

architecture    sum of  somador is
begin
    S<=A+B;
end sum;