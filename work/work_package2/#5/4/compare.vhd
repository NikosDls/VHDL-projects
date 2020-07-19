LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY compare8 IS 
    PORT(
        A: IN UNSIGNED(7 DOWNTO 0);
        B: IN UNSIGNED(7 DOWNTO 0);
        C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END compare8;

ARCHITECTURE behavioral OF compare8 IS
BEGIN
	PROCESS(A, B)
    BEGIN
        IF(A < B) THEN
					C <= STD_LOGIC_VECTOR("00000000" & B);
        ELSE
            C <= STD_LOGIC_VECTOR("00000000" & A);
        END IF;
    END PROCESS;
END behavioral;            