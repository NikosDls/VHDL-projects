LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END xnor2;

ARCHITECTURE behavioral OF xnor2 IS
BEGIN
    PROCESS(A, B)
    BEGIN
        IF (A = '0' AND B = '0') THEN O <= '1';
        ELSIF (A = '0' AND B = '1') THEN O <= '0';
        ELSIF (A = '1' AND B = '0') THEN O <= '0';
        ELSE O <= '1';
        END IF;
    END PROCESS;
END behavioral;