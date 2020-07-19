LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END xnor2;

ARCHITECTURE dataflow OF xnor2 IS
BEGIN
    O <= NOT(A XOR B);
END dataflow;