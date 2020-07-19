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

ARCHITECTURE behavioral OF circuit3 IS
BEGIN
	PROCESS(A, B, C)
    BEGIN
        IF (A = '0' AND B = '0' AND C = '1') THEN Y <= '1';
        ELSIF (A = '0' AND B = '1' AND C = '1') THEN Y <= '1';
		ELSIF (A = '1' AND B = '0' AND C = '1') THEN Y <= '1';
        ELSE Y <= '0';
        END IF;
    END PROCESS;
END behavioral;