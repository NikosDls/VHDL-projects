LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit4 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        Y: OUT STD_LOGIC
    );
END circuit4;

ARCHITECTURE dataflow OF circuit4 IS
BEGIN
	Y <= (A NAND B) AND (NOT (NOT C));
END dataflow;