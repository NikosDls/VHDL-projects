LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY notGate IS
	PORT(
        a: IN STD_LOGIC;
		o: OUT STD_LOGIC
    );
END notGate;

ARCHITECTURE dataflow OF notGate IS
BEGIN
	o <= NOT a;
END dataflow;