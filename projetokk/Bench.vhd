library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bench is
end bench;

architecture tb of bench is
    signal CLK:     std_logic := '0';
    signal LED:     std_logic_vector (15 downto 0);
    signal KEY:     std_logic_vector(1 downto 0):="11";
    signal SW:      std_logic_vector(17 downto 0);
    signal HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: std_logic_vector(6 downto 0);
component usertop is port (
	SW: in std_logic_vector(17 downto 0);
	KEY: in std_logic_vector(1 downto 0);
	CLOCK_50: in std_logic;
	LEDR: out std_logic_vector(15 downto 0); -- alterei estava (17 downto 0)
	HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0: out std_logic_vector(6 downto 0));
end component;
    
begin
    DUT : usertop  port map (SW,KEY,CLK,LED,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
    CLK <=  not  CLK   after   1 ns;
    KEY(1) <= not (key(1)) after 3 ns;
    --KEY(1) <= '0', '1' after 3 ns,'0' after 7 ns,'1' after 10 ns,'0' after 13 ns,'1' after 16 ns;
    SW<="000000000000010111";
end tb;

