LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand2 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		o: OUT STD_LOGIC
    );
END nand2;

ARCHITECTURE dataflow OF nand2 IS
BEGIN
	o <= a NAND b;
END dataflow;