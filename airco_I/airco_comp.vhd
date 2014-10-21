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
   lbl1: inver 	PORT MAP (a=>b, y=>nb);
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
   PORT (A, B: in std_logic_vector(7 downto 0);
		f: in std_logic;
		C: inout std_logic_vector(7 downto 0);
		o, z: out std_logic);
END eight_bitadder;

ARCHITECTURE structural OF eight_bitadder IS
	COMPONENT Ex_fadder
		PORT (a, b, sel, ci: in  std_logic;
			sum, co:  out std_logic);
	END COMPONENT;
	COMPONENT nor_2 IS
	   PORT (a, b: in  std_logic;
		 y:    out std_logic);
	END COMPONENT;
	COMPONENT or_4 IS
	   PORT (a, b, c, d: IN  std_logic;
		 y:       OUT std_logic);
	END COMPONENT;

	signal ct: std_logic_vector(6 downto 0);
	signal z0,z1,nz: std_logic;
BEGIN
	lbl0: Ex_fadder PORT MAP (a=>A(0), b=>B(0), sel=>f, ci=>f, sum=>C(0), co=>ct(0));
	lbl1: Ex_fadder PORT MAP (a=>A(1), b=>B(1), sel=>f, ci=>ct(0), sum=>C(1), co=>ct(1));
	lbl2: Ex_fadder PORT MAP (a=>A(2), b=>B(2), sel=>f, ci=>ct(1), sum=>C(2), co=>ct(2));
	lbl3: Ex_fadder PORT MAP (a=>A(3), b=>B(3), sel=>f, ci=>ct(2), sum=>C(3), co=>ct(3));
	lbl4: Ex_fadder PORT MAP (a=>A(4), b=>B(4), sel=>f, ci=>ct(3), sum=>C(4), co=>ct(4));
	lbl5: Ex_fadder PORT MAP (a=>A(5), b=>B(5), sel=>f, ci=>ct(4), sum=>C(5), co=>ct(5));
	lbl6: Ex_fadder PORT MAP (a=>A(6), b=>B(6), sel=>f, ci=>ct(5), sum=>C(6), co=>ct(6));
	lbl7: Ex_fadder PORT MAP (a=>A(7), b=>B(7), sel=>f, ci=>ct(6), sum=>C(7), co=>o);
	lbl8: or_4	PORT MAP (a=>C(0), b=>C(1), c=>C(2), d=>C(3), y=>z0);
	lbl9: or_4	PORT MAP (a=>C(4), b=>C(5), c=>C(6), d=>C(7), y=>z1);
	lbl10:nor_2	PORT MAP (a=>z0, b=>z1, y=>z);
END structural;

-- A, B, C input operands (8-bit 2's complement!)
-- compute D = A - (B + C)
-- gz = 1 if D > 0
-- o overflow flag
library IEEE;
use IEEE.std_logic_1164.ALL;


ENTITY add_comp IS
   PORT (A, B, C: in std_logic_vector(7 downto 0);
	gz, o: out std_logic);
END add_comp;

ARCHITECTURE structural OF add_comp IS
	COMPONENT inver 
		PORT (a: in  std_logic;
			y: out std_logic);
	END COMPONENT;
	
	COMPONENT and_2
		PORT (a, b: in  std_logic;
			y:    out std_logic);
	END COMPONENT;

	COMPONENT or_2
		PORT (a, b: in  std_logic;
			y:    out std_logic);
	END COMPONENT;

	COMPONENT eight_bitadder
		PORT (A, B: in std_logic_vector(7 downto 0);
			f: in std_logic;
			C: inout std_logic_vector(7 downto 0);
			o, z: out std_logic);
	END COMPONENT;
	signal bplusc, D : std_logic_vector(7 downto 0);
	signal v0, n0, v1, n1, y: std_logic;
BEGIN

	lbl0: eight_bitadder	PORT MAP (A=>B, B=>C, f=>'0', C=>bplusc, o=>v0, z=>n0);
	lbl1: eight_bitadder	PORT MAP (A=>A, B=>bplusc, f=>'1', C=>D, o=>v1, z=>n1);
	lbl2: inver		PORT MAP (a=>D(7), y=>y);
	lbl3: and_2		PORT MAP (a=>y, b=>n1, y=>gz);
	lbl4: or_2		PORT MAP (a=>v0, b=>v1, y=>o);

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

	COMPONENT or_2
		PORT (a, b: in  std_logic;
			y:    out std_logic);
	END COMPONENT;
	
	COMPONENT add_comp
	   PORT (A, B, C: in std_logic_vector(7 downto 0);
		gz, o: out std_logic);
	END COMPONENT;
	
	SIGNAL v0, v1, c0a, c0b: std_logic;
BEGIN
	lbl0: add_comp PORT MAP (A=>Tin, B=>Tref, C=>Td, gz=>c0b, o=>v0);
	lbl1: add_comp PORT MAP (A=>Tref, B=>Tin, C=>Td, gz=>c0a, o=>v1);
	lbl2: or_2 PORT MAP (a=>c0b, b=>c0a, y=>c0);
	lbl3: c1 <= c0b;
END structural;
