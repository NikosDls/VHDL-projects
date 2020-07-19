LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit5 IS
	PORT(
        A0: IN STD_LOGIC;
        A1: IN STD_LOGIC;
        D0: OUT STD_LOGIC;
		D1: OUT STD_LOGIC;
		D2: OUT STD_LOGIC;
		D3: OUT STD_LOGIC
    );
END circuit5;

ARCHITECTURE behavioral OF circuit5 IS
BEGIN
	PROCESS(A0, A1)
    BEGIN
        IF (A0 = '0' AND A1 = '0') THEN 
						D0 <= '1';
						D1 <= '0';
						D2 <= '0';
						D3 <= '0';
        ELSIF (A0 = '0' AND A1 = '1') THEN
						D0 <= '0';
						D1 <= '0';
						D2 <= '1';
						D3 <= '0';
		ELSIF (A0 = '1' AND A1 = '0') THEN 
						D0 <= '0';
						D1 <= '1';
						D2 <= '0';
						D3 <= '0';
        ELSE D0 <= '0';
			D1 <= '0';
			D2 <= '0';
			D3 <= '1';
        END IF;
    END PROCESS;
END behavioral;