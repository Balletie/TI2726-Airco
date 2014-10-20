library IEEE;
use IEEE.std_logic_1164.ALL;
-- use IEEE.std_logic_arith.ALL;
-- use IEEE.std_logic_signed.ALL;

library WORK;
use WORK.ALL;

entity acvII_tb is
end acvII_tb;

architecture behaviour of acvII_tb is
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
			c1		: out std_logic
		);
	end component;

 signal	c0, c1          : std_logic;
 signal Td              : std_logic_vector(7 downto 0);
 signal	Tin		:  std_logic_vector(7 downto 0) ;
 signal	Tref		:  std_logic_vector(7 downto 0);
 signal clk             :  std_logic := '0';
 signal  reset	        :  std_logic := '0';
 signal  Z		:  std_logic := '1';
 signal	 E		:  std_logic := '1';
 signal	 W		:  std_logic := '1';
 signal	 G		:  std_logic := '1';
 signal	 heat		:  std_logic := '0';
 signal	 cool		:  std_logic := '0';
 signal	 off		:  std_logic := '0';
 signal	 service	:  std_logic := '0';

begin 

  Td   <= "00000100";
  Tref <= "01010000"; -- 20 C 
  Tin  <= "01000000" after 0 ns,  -- 16 C
	  "01001100" after 300 ns,   -- 19 C
	  "01011100" after 600 ns; -- 23 C




  lbl1: airco_comp port map (Tin=>Tin, Tref=>Tref, Td=>Td, c0=>c0, c1=>c1);
  lbl2: airco_fsm  port map (clk=>clk, reset=>reset, Z=>Z, E=>E, W=>W, G=>G, c0=>c0, c1=>c1, heat=>heat,
			    cool=>cool, off=>off, service=>service); 
 
  clk <= '1' after 10 ns when clk /= '1' else
       '0' after 20  ns;
  reset <= '0' after 0 ns,
	 '1' after 40 ns;

end behaviour;


