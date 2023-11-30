library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_time is
    port( 
        Set,Enable,Clock:   in  std_logic;
        Load: in  std_logic_vector(7    downto  0);
        end_time: out std_logic;
        t_out: out std_logic_vector(7   downto  0)
    );
end counter_time;

architecture behv of counter_time is
    signal set_load: std_logic_vector(7 downto 0);

begin
    process(Clock, Set)
    begin
        if (Set = '1') then
            set_load <= "01100011";
            end_time <= '0';
        elsif (Enable = '1' and rising_edge(Clock)) then
            if (set_load > "00000000") then
                set_load <= set_load + Load; 
            end if;
            if (set_load <= "00000001" or set_load > "01100011") then
                end_time <= '1';
  
            end if;
        end if;
    end process;

    t_out <= set_load;

end behv;