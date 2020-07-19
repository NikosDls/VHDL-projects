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

ARCHITECTURE structural OF circuit2 IS
	
	COMPONENT and2
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			o: OUT STD_LOGIC
		);
    END COMPONENT;
		
	COMPONENT or2
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			o: OUT STD_LOGIC
		);
    END COMPONENT;

	SIGNAL andOut1: STD_LOGIC;
    SIGNAL orOut: STD_LOGIC;
    SIGNAL andOut2: STD_LOGIC;
	SIGNAL andOut3: STD_LOGIC;
	
BEGIN

	stage0: and2 PORT MAP(A, B, andOut1);
	stage1:	or2 PORT MAP(B, C, orOut);
	stage2:	and2 PORT MAP(C, B, andOut2);
	stage3: and2 PORT MAP(orOut, andOut2, andOut3);
	stage4: or2 PORT MAP(andOut1, andOut3, Q);

END structural;