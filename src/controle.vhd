-- vsg_off
library ieee;
use ieee.std_logic_1164.all; 

entity controle is port(
    
    clock, enter, reset: in std_logic;
    end_game, end_sequence, end_round: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: out std_logic);

end controle;

architecture arc_controle of controle is
    type    states  is(
        check,
        init,
        play,
        result,
        select0,
        sequence,
        setup
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

process(estado_atual,enter,end_game,end_sequence,end_round)
begin
    case estado_atual   is
        when    init    =>
            proximo_estado  <=  setup;
        when    setup   =>
            if  enter='1' then  proximo_estado  <=  select0;
            else    proximo_estado  <=  setup;
            end if;
        when    select0 =>
            if  enter='1' then proximo_estado   <=  sequence;
            else    proximo_estado <= select0;
            end if;
        when    sequence =>
            if  end_sequence='1' then proximo_estado    <= play;
            else    proximo_estado <= sequence;
            end if;
        when play =>
            if  enter='1' then proximo_estado <= check;
            elsif   end_game='1'    or  end_round='1' then proximo_estado <= proximo_estado;
            else    proximo_estado  <=  play;
            end if;
        when    check  =>
            if  end_game='1' then proximo_estado    <= result;
            else    proximo_estado <= select0;
            end if;
        when    result =>
            if  enter='1' then proximo_estado <= init;
            else    proximo_estado <= result;
            end if;
    end case;
end process;

R1<='1' when    estado_atual    =   init   else    '0';
E1<='1' when    estado_atual    =   setup  else    '0';     
E2<='1' when    estado_atual    =   select0 else    '0';
E3<='1' when    estado_atual    =   sequence   else    '0';
E4<='1' when    estado_atual    =   play   else    '0';
E5<='1' when    estado_atual    =   check  else    '0';
E6<='1' when    estado_atual    =   init else    '0';
        
end arc_controle;               
