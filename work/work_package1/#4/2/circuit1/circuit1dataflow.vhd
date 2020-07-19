LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit1 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		c: IN STD_LOGIC;
		d: IN STD_LOGIC;
        e: OUT STD_LOGIC
    );
END circuit1;

ARCHITECTURE dataflow OF circuit1 IS
BEGIN
	e <= (a AND NOT b AND NOT c) OR (NOT b AND NOT c AND NOT d);
END dataflow;