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

ARCHITECTURE structural OF circuit3 IS

	COMPONENT notGate
		PORT( 
            a: IN STD_LOGIC;
            o: OUT STD_LOGIC
        );
    END COMPONENT;
	
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
	
    SIGNAL notC: STD_LOGIC;
    SIGNAL andOut: STD_LOGIC;
	SIGNAL orOut: STD_LOGIC;

BEGIN

	stage0: and2 PORT MAP(A, B, andOut);
	stage1:	notGate PORT MAP(C, notC);
	stage2:	or2 PORT MAP(andOut, notC, orOut);
	stage3: notGate PORT MAP(orOut, Y);

END structural;