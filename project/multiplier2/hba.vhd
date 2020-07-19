LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY hba IS
	PORT(
        a: IN BIT;
        b: IN BIT;
		s: OUT BIT;
		c: OUT BIT
    );
END hba;

ARCHITECTURE dataflow OF hba IS
BEGIN
	s <= a XOR b;
	c <= a AND b;
END dataflow;