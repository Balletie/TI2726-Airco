library IEEE;
use IEEE.std_logic_1164.ALL;


entity airco_comp_tb is
end airco_comp_tb;

architecture behaviour of airco_comp_tb is
  component airco_comp
	port (
		Tin    		: in std_logic_vector(7 downto 0);
		Tref		: in std_logic_vector(7 downto 0);
		Td    		: in std_logic_vector(7 downto 0);
		c0		: out std_logic;
		c1		: out std_logic
	);
  end component;
 signal	c0, c1: std_logic;
 signal Td, Tin, Tref: std_logic_vector(7 downto 0);
begin 
  Td   <= "00000100";
  Tref <= "01010000"; -- 20 C 
  Tin  <= "01000000" after 0 ns,  -- 16 C
	  "01001100" after 300 ns,   -- 19 C
	  "01011100" after 600 ns; -- 23 C
  lbl1: airco_comp port map (Tin=>Tin, Tref=>Tref, Td=>Td, c0=>c0, c1=>c1);

end behaviour;



