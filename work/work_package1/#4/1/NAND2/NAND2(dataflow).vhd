LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END nand2;

ARCHITECTURE dataflow OF nand2 IS
BEGIN
    O <= NOT(A AND B);
END dataflow;