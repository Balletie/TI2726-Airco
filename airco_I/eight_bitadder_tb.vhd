library IEEE;
use IEEE.std_logic_1164.ALL;

entity eight_bitadder_tb is
end eight_bitadder_tb;

architecture behaviour of eight_bitadder_tb is
	component eight_bitadder
	port (
		A, B: in std_logic_vector(7 downto 0);
		f: in std_logic;
		C: inout std_logic_vector(7 downto 0);
		o, z: out std_logic
		);
	end component;
	signal sel, o, z: std_logic;
	signal A, B, C : std_logic_vector(7 downto 0);
begin
	A <= "00000000", -- 0
	"00000001" after 200 ns, -- 1
	"00001000" after 400 ns, -- 8
	"00001001" after 600 ns, -- 9
	"00001101" after 800 ns, -- 13
	"00001110" after 1000 ns, -- 14
	"01111111" after 1200 ns, -- 127
	"10000000" after 1400 ns, -- -128
	"00000000" after 1600 ns, -- 0
	"10000000" after 1800 ns; -- -128
	B <= "00000000", -- 0
	"00000001" after 400 ns, -- 1
	"00000110" after 800 ns, -- 6
	"01111111" after 1200 ns, -- 127
	"01111110" after 1600 ns; -- 126
	sel <= '0',
	'1' after 1600 ns;
	lbl0: eight_bitadder port map (A => A, B => B, f => sel, C => C, o => o, z => z);
end behaviour;
