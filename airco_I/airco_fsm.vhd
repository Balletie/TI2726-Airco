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
begin
-- ??
-- ??
end behaviour;




