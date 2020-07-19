LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit6 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		c: IN STD_LOGIC;
		d: IN STD_LOGIC;
        e: OUT STD_LOGIC
    );
END circuit6;

ARCHITECTURE dataflow OF circuit6 IS
BEGIN
	e <= (a AND (NOT (b OR c))) OR (NOT d AND (NOT (b OR c)));
END dataflow;