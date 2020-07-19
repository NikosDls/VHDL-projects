LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit6 IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		c: IN STD_LOGIC;
		d: IN STD_LOGIC;
        e: OUT STD_LOGIC
    );
END circuit6;

ARCHITECTURE structural OF circuit6 IS

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
	
    SIGNAL orOut: STD_LOGIC;
    SIGNAL notOrOut: STD_LOGIC;
	SIGNAL notD: STD_LOGIC;
	SIGNAL andOut1: STD_LOGIC;
	SIGNAL andOut2: STD_LOGIC;

BEGIN

	stage0:	or2 PORT MAP(b, c, orOut);
	stage1:	notGate PORT MAP(orOut, notOrOut);
	stage2:	and2 PORT MAP(a, notOrOut, andOut1);
	stage3: notGate PORT MAP(d, notD);
	stage4: and2 PORT MAP(notOrOut, notD, andOut2);
	stage5: or2 PORT MAP(andOut1, andOut2, e);

END structural;