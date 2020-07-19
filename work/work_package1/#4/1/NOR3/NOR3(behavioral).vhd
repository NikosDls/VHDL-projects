LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nor3 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END nor3;

ARCHITECTURE behavioral OF nor3 IS
BEGIN
    PROCESS(A, B, C)
    BEGIN
        IF (A = '0' AND B = '0' AND C = '0') THEN O <= '1';
        ELSE O <= '0';
        END IF;
    END PROCESS;
END behavioral;