LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY hba IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		s: OUT STD_LOGIC;
		c: OUT STD_LOGIC
    );
END hba;

ARCHITECTURE dataflow OF hba IS
BEGIN
	s <= a XOR b;
	c <= a AND b;
END dataflow;