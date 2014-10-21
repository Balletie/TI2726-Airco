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
	type airco_fsm_state is (OFF_STATE, HEAT_STATE, COOL_STATE, SERVICE_STATE);
	signal state, new_state: airco_fsm_state;
	signal unit_ok: std_logic;
begin
	lb0: process(Z, E, W, G)
	begin
		unit_ok <= Z and E and W and G;
	end process;
	lb1: process(clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= OFF_STATE;
			else
				state <= new_state;
			end if;
		end if;
	end process;
	lb2: process(unit_ok, c0, c1)
	begin
		if(unit_ok = '1') then
			if(c0 = '0') then
				new_state <= OFF_STATE;
				cool	<= '0';
				heat	<= '0';
				off	<= '1';
				service <= '0';
			else
				if(c1 = '1') then
					new_state <= COOL_STATE;
					cool	<= '1';
					heat	<= '0';
					off	<= '0';
					service <= '0';
				else
					new_state <= HEAT_STATE;
					cool	<= '0';
					heat	<= '1';
					off	<= '0';
					service <= '0';
				end if;
			end if;
		else
			new_state <= SERVICE_STATE;
			cool	<= '0';
			heat	<= '0';
			off	<= '1';
			service <= '1';
		end if;
	end process;
end behaviour;
