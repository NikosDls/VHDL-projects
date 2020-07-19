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

ARCHITECTURE behavioral OF circuit1 IS
BEGIN
    PROCESS(a, b, c, d)
    BEGIN
        IF (a = '0' AND b = '0' AND c = '0' AND d = '0') THEN e <= '1';
        ELSIF (a = '1' AND b = '0' AND c = '0' AND d = '0') THEN e <= '1';
		ELSIF (a = '1' AND b = '0' AND c = '0' AND d = '1') THEN e <= '1';
        ELSE e <= '0';
        END IF;
    END PROCESS;
END behavioral;