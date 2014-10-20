library IEEE;
use IEEE.std_logic_1164.ALL;


entity airco is
	port (
		clk		: in std_logic;
		reset		: in std_logic;
		Z		: in std_logic;
		E		: in std_logic;
		W		: in std_logic;
		G		: in std_logic;
		Tin		: in std_logic_vector(7 downto 0);
		heat		: out std_logic;
		cool		: out std_logic;
		off		: out std_logic;
		service		: out std_logic);
end airco;

architecture behaviour of airco is
	component airco_fsm
		port (
			clk		: in std_logic;
			reset		: in std_logic;
			Z		: in std_logic;
			E		: in std_logic;
			W		: in std_logic;
			G		: in std_logic;
			c0		: in std_logic;
			c1		: in std_logic;
			heat		: out std_logic;
			cool		: out std_logic;
			off		: out std_logic;
			service		: out std_logic);
	end component;
	component airco_comp
		port (
			Tin    		: in std_logic_vector(7 downto 0);
			Tref		: in std_logic_vector(7 downto 0);
			Td    		: in std_logic_vector(7 downto 0);
			c0		: out std_logic;
			c1		: out std_logic);
	end component;
	signal	c0, c1: std_logic;
	signal Td,Tref: std_logic_vector(7 downto 0);
	begin 
	  Td <= "00000100";
  	  Tref<="01010000";
  	  lbl1: airco_comp port map (Tin=>Tin, Tref=>Tref, Td=>Td, c0=>c0, c1=>c1);
  	  lbl2: airco_fsm  port map (clk=>clk, reset=>reset, Z=>Z, E=>E, W=>W, G=>G, C0=>c0, c1=>c1, heat=>heat,
			    cool=>cool, off=>off, service=>service); 
end behaviour;
	
