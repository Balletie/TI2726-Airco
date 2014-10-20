
-- Available components

-- inverter
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY inver IS
   PORT (a: in  std_logic;
         y: out std_logic);
END inver;

ARCHITECTURE behaviour OF inver IS
BEGIN
   y <= NOT a AFTER 5 NS;
END behaviour;

-- Two input AND
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY and_2 IS
   PORT (a, b: in  std_logic;
         y:    out std_logic);
END and_2;

ARCHITECTURE behaviour OF and_2 IS
BEGIN
   y <= a AND b AFTER 5 ns;
END behaviour;

-- Four input AND
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY and_4 IS
   PORT (a, b, c, d: in  std_logic;
         y:    out std_logic);
END and_4;

ARCHITECTURE behaviour OF and_4 IS
BEGIN
   y <= a AND b AND c AND d AFTER 10 ns;
END behaviour;

-- Five input AND
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY and_5 IS
   PORT (a, b, c, d, e: in  std_logic;
         y:    out std_logic);
END and_5;

ARCHITECTURE behaviour OF and_5 IS
BEGIN
   y <= a AND b AND c AND d AND e AFTER 10 ns;
END behaviour;

-- Two input NAND
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY nand_2 IS
   PORT (a, b: in  std_logic;
         y:    out std_logic);
END nand_2;

ARCHITECTURE behaviour OF nand_2 IS
BEGIN
   y <= a NAND b AFTER 5 NS;
END behaviour;


-- Two input OR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY or_2 IS
   PORT (a, b: in  std_logic;
         y:    out std_logic);
END or_2;

ARCHITECTURE behaviour OF or_2 IS
BEGIN
   y <= a OR b AFTER 5 NS;
END behaviour;

-- Three input OR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY or_3 IS
   PORT (a, b, c: IN  std_logic;
         y:       OUT std_logic);
END or_3;

ARCHITECTURE behaviour OF or_3 IS
BEGIN
   y <= a OR b OR c AFTER 5 NS;
END behaviour;

-- Four input OR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY or_4 IS
   PORT (a, b, c, d: IN  std_logic;
         y:       OUT std_logic);
END or_4;

ARCHITECTURE behaviour OF or_4 IS
BEGIN
   y <= a OR b OR c OR d AFTER 5 NS;
END behaviour;

-- Five input OR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY or_5 IS
   PORT (a, b, c, d, e: IN  std_logic;
         y:       OUT std_logic);
END or_5;

ARCHITECTURE behaviour OF or_5 IS
BEGIN
   y <= a OR b OR c OR d OR e AFTER 5 NS;
END behaviour;

-- Two input NOR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY nor_2 IS
   PORT (a, b: in  std_logic;
         y:    out std_logic);
END nor_2;

ARCHITECTURE behaviour OF nor_2 IS
BEGIN
   y <= a NOR b AFTER 5 NS;
END behaviour;

-- XOR
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY xor_2 IS
   PORT (a, b: in  std_logic;
         y:    out std_logic);
END xor_2;

ARCHITECTURE behaviour OF xor_2 IS
BEGIN
   PROCESS(a, b)
   BEGIN
     IF a = b THEN
        y <= '0' AFTER 6 NS;
     ELSE
        y <= '1' AFTER 8 NS;
     END IF;
  END PROCESS;
END behaviour;

-- 2:1 Mulltiplexer
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY mux21 IS
   PORT (a, b, sel: in  std_logic;
         y:       out std_logic);
END mux21;

ARCHITECTURE behaviour OF mux21 IS
BEGIN
   y <= (a AND (NOT sel)) OR (b AND sel) AFTER 10 NS;
END behaviour;

-- Full Adder
library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY fadder IS
   PORT (a, b, ci: in  std_logic;
         sum, co:  out std_logic);
END fadder;

ARCHITECTURE structural OF fadder IS
   COMPONENT and_2
      PORT (a, b: in  std_logic;
            y:    out std_logic);
   END COMPONENT;
   COMPONENT or_3
      PORT (a, b, c: in  std_logic;
            y:       out std_logic);
   END COMPONENT;
   COMPONENT xor_2
      PORT (a, b: in  std_logic;
            y:    out std_logic);
   END COMPONENT;
SIGNAL s1, s2, s3, s4: std_logic;
BEGIN
   lbl1: and_2 PORT MAP (a=>a, b=>b, y=>s1);
   lbl2: and_2 PORT MAP (a=>a, b=>ci, y=>s2);
   lbl3: and_2 PORT MAP (a=>b, b=>ci, y=>s3);
   lbl4: or_3  PORT MAP (a=>s1, b=>s2, c=>s3, y=>co);
   lbl5: xor_2 PORT MAP (a=>a, b=>b, y=>s4);
   lbl6: xor_2 PORT MAP (a=>s4, b=>ci, y=>sum);
END structural;
