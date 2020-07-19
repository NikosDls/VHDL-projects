LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        Q: OUT STD_LOGIC
    );
END circuit2;

ARCHITECTURE behavioral	 OF circuit2 IS
BEGIN
	PROCESS(A, B, C)
    BEGIN
        IF (A = '0' AND B = '1' AND C = '1') THEN Q <= '1';
        ELSIF (A = '1' AND B = '1' AND C = '0') THEN Q <= '1';
		ELSIF (A = '1' AND B = '1' AND C = '1') THEN Q <= '1';
        ELSE Q <= '0';
        END IF;
    END PROCESS;
END behavioral;