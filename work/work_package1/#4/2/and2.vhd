LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and2 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		o: OUT STD_LOGIC
    );
END and2;

ARCHITECTURE dataflow OF and2 IS
BEGIN
	o <= a AND b;
END dataflow;