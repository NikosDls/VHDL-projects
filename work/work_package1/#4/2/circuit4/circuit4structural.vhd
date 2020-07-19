LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit4 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
		C: IN STD_LOGIC;
        Y: OUT STD_LOGIC
    );
END circuit4;

ARCHITECTURE structural OF circuit4 IS

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

    SIGNAL andOut: STD_LOGIC;
    SIGNAL notAndOut: STD_LOGIC;
	SIGNAL notC: STD_LOGIC;
	SIGNAL notNotC: STD_LOGIC;

BEGIN

	stage0: and2 PORT MAP(A, B, andOut);
	stage1:	notGate PORT MAP(andOut, notAndOut);
	stage2:	notGate PORT MAP(C, notC);
	stage3: notGate PORT MAP(notC, notNotC);
	stage4: and2 PORT MAP(notNotC, notAndOut, Y);

END structural;