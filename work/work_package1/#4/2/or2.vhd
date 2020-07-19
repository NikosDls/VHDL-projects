LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY or2 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		o: OUT STD_LOGIC
    );
END or2;

ARCHITECTURE dataflow OF or2 IS
BEGIN
	o <= a OR b;
END dataflow;