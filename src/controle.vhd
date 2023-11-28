library ieee;
use ieee.std_logic_1164.all; 

entity controle is port(
    
    clock, enter, reset: in std_logic;
    end_game, end_sequence, end_round: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic);

end controle;

architecture arc_controle of controle is
    type    states  is(
        _check,
        _init,
        _play,
        _result,
        _select,
        _sequence,
        _setup,
    );
    signal estado_atual,proximo_estado: states:=init;

begin
    process(clock,reset)
    begin
        if(reset='1')then
            estado_atual    <=  init;
        elsif(clock'event   and clock='1')then
            estado_atual<=proximo_estado;
        end if;
    end process;

process(estado_atual,enter,end_game_end_sequence,end_round)
begin
    case estado_atual   is
        when    init    =>
            proximo_estado  <=  _setup;
        when    setup   =>
            if  enter='1' then  proximo_estado  <=  _select;
            else    proximo_estado  <=  _setup;
            end if;
        when    _select =>
            if  enter='1' then proximo_estado   <=  _sequence;
            else    proximo_estado <= _select;
            end if;
        when    _sequence =>
            if  end_sequence='1' then proximo_estado    <= _play;
            else    proximo_estado <= _sequence;
            end if;
        when _play =>
            if  enter='1' then proximo_estado <= _check;
            elsif   end_game='1'    or  end_round='1' then proximo_estado <= proximo_estado;
            else    proximo_estado  <=  _play;
        when    _check  =>
            if  end_game='1' then proximo_estado    <= _result;
            else    proximo_estado <= _select;
            end if;
        when    _result =>
            if  enter='1' then proximo_estado <= _init;
            else    proximo_estado <= _result;
            end if;
    end case;
end process

R1<='1' when    estado_atual    =   _init   else    '0';
E1<='1' when    estado_atual    =   _setup  else    '0';     
E2<='1' when    estado_atual    =   _select else    '0';
E3<='1' when    estado_atual    =   _sequence   else    '0';
E4<='1' when    estado_atual    =   _play   else    '0';
E5<='1' when    estado_atual    =   _check  else    '0';
E6<='1' when    estado_atual    =   _result else    '0';
        
end arc_controle;               
