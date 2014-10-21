-- Extended Full Added
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY Ex_fadder IS
   PORT (a, b, sel, ci: in  std_logic;
         sum, co:  out std_logic);
END Ex_fadder;

ARCHITECTURE structural OF Ex_fadder IS

  COMPONENT inver 
   PORT (a: in  std_logic;
   	     y: out std_logic);
  END COMPONENT;

  COMPONENT mux21 
   PORT (a, b, sel: in  std_logic;
   	     y: out std_logic);
  END COMPONENT;
 
  COMPONENT fadder
   PORT (a, b, ci: in  std_logic;
         sum, co:  out std_logic);
  END COMPONENT;

SIGNAL nb, s1: std_logic;
BEGIN
   lbl1: inver  	PORT MAP (a=>b, y=>nb);
   lbl2: mux21	PORT MAP (a=>b, b=>nb, sel=>sel, y=>s1);
   lbl3: fadder PORT MAP (a=>a, b=>s1, ci=>ci, sum=>sum, co=>co);
END structural;

-- 2's complement 8-bit adder/substractor
-- A, B input operands
-- f = 0 compute C = A+B
-- f = 1 compute C = A-B
-- o overflow flag
-- z zero flag
-- the sign flag is C(7)! 

library IEEE;
use IEEE.std_logic_1164.ALL;


ENTITY eight_bitadder IS
   PORT (
		A, B: in std_logic_vector(7 downto 0);
		f: in std_logic;
		C: inout std_logic_vector(7 downto 0);
		o, z: out std_logic
		);
END eight_bitadder;

ARCHITECTURE structural OF eight_bitadder IS
	COMPONENT fadder
		PORT(a, b, ci: in  std_logic;
			 sum, co: out std_logic);
	END COMPONENT;
signal ct: std_logic_vector(7 downto 0);

BEGIN
	lbl1: fadder PORT MAP (A(0)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); 
	lbl1: fadder PORT MAP (A(1)=>a, B(1)=>b, ct(1)=>cin, sum=>C(1), co=>ct(2)); 
	lbl1: fadder PORT MAP (A(2)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); 
	lbl1: fadder PORT MAP (A(3)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); 
	lbl1: fadder PORT MAP (A(4)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); 
	lbl1: fadder PORT MAP (A(5)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); ;
	lbl1: fadder PORT MAP (A(6)=>a, B(0)=>b, ct(0)=>cin, sum=>C(0), co=>ct(1)); 
	lbl1: fadder PORT MAP (A(7)=>a, B(7)=>b, ct(7)=>cin, sum=>C(7), co=>o); 
END structural;

-- A, B, C input operands (8-bit 2's complement!)
-- compute D = A - (B + C)
-- gz = 1 if D > 0
-- o overflow flag
library IEEE;
use IEEE.std_logic_1164.ALL;


ENTITY add_comp IS
   PORT (
		A, B, C: in std_logic_vector(7 downto 0);
		gz, o: out std_logic
		);
END add_comp;

ARCHITECTURE structural OF add_comp IS



BEGIN

-- ??
-- ??
-- ??

END structural;

-- airco_comp at structural level
library IEEE;
use IEEE.std_logic_1164.ALL;

entity airco_comp is
		port (
			Tin		: in std_logic_vector(7 downto 0);
			Tref	        : in std_logic_vector(7 downto 0);
			Td		: in std_logic_vector(7 downto 0);
			c0		: out std_logic;
			c1		: out std_logic
		);
end airco_comp;

architecture structural of airco_comp is



BEGIN

-- ??
-- ??
-- ??
-- ??

END structural;

