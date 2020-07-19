LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit7 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O1: OUT STD_LOGIC;
		O2: OUT STD_LOGIC
    );
END circuit7;

ARCHITECTURE behavioral OF circuit7 IS
BEGIN
	PROCESS(A, B)
    BEGIN
        IF (A = '0' AND B = '0') THEN 
						O1 <= '0';
						O2 <= '0';
        ELSIF (A = '0' AND B = '1') THEN
						O1 <= '0';
						O2 <= '1';
		ELSIF (A = '1' AND B = '0') THEN 
						O1 <= '0';
						O2 <= '1';
        ELSE O1 <= '1';
			O2 <= '0';
        END IF;
	END PROCESS;
END behavioral;