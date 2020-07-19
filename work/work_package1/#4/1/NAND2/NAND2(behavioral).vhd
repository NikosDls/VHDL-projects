LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY nand2 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O: OUT STD_LOGIC
    );
END nand2;

ARCHITECTURE behavioral OF nand2 IS
BEGIN
    PROCESS(A, B)
    BEGIN
        IF (A = '0' AND B = '0') THEN O <= '1';
        ELSIF (A = '0' AND B = '1') THEN O <= '1';
        ELSIF (A = '1' AND B = '0') THEN O <= '1';
        ELSE O <= '0';
        END IF;
    END PROCESS;
END behavioral;