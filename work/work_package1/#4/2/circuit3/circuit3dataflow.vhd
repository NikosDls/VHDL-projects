LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit3 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        Y: OUT STD_LOGIC
    );
END circuit3;

ARCHITECTURE dataflow OF circuit3 IS
BEGIN
	Y <= NOT((A AND B) OR (NOT C));
END dataflow;