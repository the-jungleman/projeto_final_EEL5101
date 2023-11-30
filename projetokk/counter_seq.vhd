
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;
entity counter_seq is port ( 
    Reset, Enable, Clock: in  std_logic;
    end_sequence        : out std_logic;
    seq                 : out std_logic_vector(2 downto 0)
    );
end counter_seq;

architecture behv of counter_seq is
  signal cnt: std_logic_vector(2 downto 0) := "000";
begin
	process(Clock, Reset)
    begin
    if (Reset = '1') then
        cnt <= "000";
        end_sequence <= '0';
    elsif (Enable = '1' and rising_edge(Clock)) then
        if (cnt < "100") then 
            cnt <= cnt + '1';
            if (cnt ="011") then 
                end_sequence <= '1'; 
            end if;
        end if;
    end if;
end process;
  seq <= cnt;
end behv;


