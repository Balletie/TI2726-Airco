library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity airco_fsm is
   port (clk:     in  std_logic;
         reset:   in  std_logic;
         Z:       in  std_logic;
         E:       in  std_logic;
         W:       in  std_logic;
         G:       in  std_logic;
         c0:      in  std_logic;
         c1:      in  std_logic;
         heat:    out std_logic;
         cool:    out std_logic;
         off:     out std_logic;
         service: out std_logic);
end airco_fsm;

architecture behaviour of airco_fsm is
	type airco_fsm_state is (OFF, HEAT, COOL, SERVICE);
	signal state, new_state: airco_fsm_state;
begin
	lb1: process(clk)
	begin
		if (clk'event and clk = '1') then
			state <= new_state;
		end if;
	end process;
	
	
	//define ZEWG as a single signal?
	//reset should show in the FSM diagram?
	lb2: process(state, Z, E, W, G, c0, c1, reset?)
	begin
		case state is
		when OFF = >
			if() then
			else
			end if;
			
		when HEAT = >
			if() then
			else
			end if;
			
		when COOL = >
			if() then
			else
			end if;
			
		when SERVICE = >
			if() then
			else
			end if;
		
			state <= new_state;
		end case;
	end process;
end behaviour;




