library ieee;
use ieee.std_logic_1164.all; 

entity controle is port(
    
    clock, enter, reset: in std_logic;
    end_game, end_sequence, end_round: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic);

end controle;
	
architecture arc_controle of controle is
type STATES is (Init,Setup,SSelect,Result,Sequence,Play,Check);
signal EAtual,Pestado: STATES := init;

begin
  process(clock,reset)
  begin
    if (reset = '1') then
	  EAtual <= init;
	elsif (clock'event AND clock = '1') then 
  	  EAtual <= PEstado;
	end if;
  end process;

process (EAtual,enter,end_game,end_sequence,end_round)
begin
	case EAtual is
		when init =>
			Pestado <= setup;
		when setup =>
			if enter = '1' then Pestado <= Sselect; else Pestado <= setup;
			end if;
			
		when sselect =>
			if enter = '1' then Pestado <= Sequence; else Pestado <= sselect;
			end if;
		when Sequence =>
			if end_sequence = '1' then Pestado <= play; else Pestado <= Sequence;
			end if;

		when Play =>
			if enter = '1' then Pestado <= check;
			elsif end_game = '1' or end_round = '1' then Pestado <= result; else Pestado <= Play;
			end if;
        when CHECK =>
            if end_game = '1' then 
                PEstado <= RESULT;
            else 
                PEstado <= SSELECT;
            end if;
		when Result =>
			if enter = '1' then Pestado <= init; else Pestado <= result;
			end if;

	end case;
	
end process;
    r1<= '1'  when EAtual = init else '0';
    E1 <= '1' when EAtual = Setup else '0';
    E2 <= '1' when EAtual = SSelect else '0';
    E3 <= '1' when EAtual = sequence else '0';
    E4 <= '1' when EAtual = play else '0';
    E5 <= '1' when EAtual = check else '0';
    E6 <= '1' when EAtual = result else '0';

end arc_controle;      