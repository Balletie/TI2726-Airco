library IEEE;
use IEEE.std_logic_1164.ALL;
--use IEEE.std_logic_arith.ALL;
--use IEEE.std_logic_signed.ALL;
use IEEE.numeric_std.ALL;

library WORK;
use WORK.ALL;

entity airco_fsm_tb is
end airco_fsm_tb;

architecture behaviour of airco_fsm_tb is
  component airco_fsm
		port (
			clk		: in std_logic;
			reset	        : in std_logic;
			Z		: in std_logic;
			E		: in std_logic;
			W		: in std_logic;
			G		: in std_logic;
			c0		: in std_logic;
			c1		: in std_logic;
			heat	        : out std_logic;
			cool	        : out std_logic;
			off		: out std_logic;
			service	        : out std_logic);
  end component;
 signal  clk	        :  std_logic := '0';
 signal  reset	        :  std_logic := '0';
 signal  Z		:  std_logic := '1';
 signal	 E		:  std_logic := '1';
 signal	 W		:  std_logic := '1';
 signal	 G		:  std_logic := '1';
 signal	 c0		:  std_logic := '0';
 signal	 c1		:  std_logic := '0';
 signal	 heat		:  std_logic := '0';
 signal	 cool		:  std_logic := '0';
 signal	 off		:  std_logic := '0';
 signal	 service	:  std_logic := '0';

begin
  lbl1: airco_fsm port map (clk=>clk, reset=>reset, Z=>Z, E=>E, W=>W, G=>G, c0=>c0, c1=>c1, heat=>heat,
			    cool=>cool, off=>off, service=>service);
 
clk <= '1' after 10 ns when clk /= '1' else
       '0' after 10 ns;
reset <= '0' after 0 ns,
	 '1' after 20 ns;

c0 <= '1' after 50 ns,
      '0' after 200 ns,
      '1' after 250 ns,
      '0' after 450 ns;
c1 <= '1' after 250 ns,
      '0' after 450 ns;

z <= '0' after 540 ns;

end behaviour;
