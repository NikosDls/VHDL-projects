LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY and3 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
        c: IN STD_LOGIC;
		o: OUT STD_LOGIC
    );
END and3;

ARCHITECTURE dataflow OF and3 IS
BEGIN
	o <= a AND b AND c;
END dataflow;