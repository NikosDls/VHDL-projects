LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        Q: OUT STD_LOGIC
    );
END circuit2;

ARCHITECTURE dataflow OF circuit2 IS
BEGIN
	Q <= (A AND B) OR ((B OR C) AND (C AND B));
END dataflow;