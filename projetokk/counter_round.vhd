library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
entity counter_round  is port ( 
    Set, Enable, Clock: in  std_logic;
    end_round           : out std_logic;
    X                   : out std_logic_vector(3 downto 0));
end counter_round ;

architecture behv of counter_round  is
  signal cnt: std_logic_vector(3 downto 0) := "0000";
begin
	process(Clock, set)
    begin
    if (set = '1') then
        cnt <= "1111";
        end_round <= '0';
    elsif (Enable = '1' and rising_edge(Clock)) then
        if (cnt > "0000") then
            cnt <= cnt - '1';
            if (cnt = "0001") then
                end_round <= '1';  -- Alteração aqui
            end if;
        end if;
    end if;
end process;
  X <= cnt;
end behv;