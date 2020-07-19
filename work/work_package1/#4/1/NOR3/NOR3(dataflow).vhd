LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor3 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END nor3;

ARCHITECTURE dataflow OF nor3 IS
BEGIN
    O <= NOT(A OR B OR C);
END dataflow;