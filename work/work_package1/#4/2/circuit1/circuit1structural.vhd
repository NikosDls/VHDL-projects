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

ARCHITECTURE structural OF circuit1 IS

	COMPONENT notGate
		PORT ( 
            a: IN STD_LOGIC;
            o: OUT STD_LOGIC
        );
    END COMPONENT;
	
	COMPONENT and3
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			c: IN STD_LOGIC;
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
	
	SIGNAL notB: STD_LOGIC;
    SIGNAL notC: STD_LOGIC;
    SIGNAL notD: STD_LOGIC;
	SIGNAL firstAnd: STD_LOGIC;
	SIGNAL secondAnd: STD_LOGIC;
	
BEGIN

	stage0: notGate PORT MAP(b, notB);
	stage1:	notGate PORT MAP(c, notC);
	stage2:	notGate PORT MAP(d, notD);
	stage3: and3 PORT MAP(a, notB, notC, firstAnd);
	stage4: and3 PORT MAP(notB, notC, notD, secondAnd);
	stage5: or2 PORT MAP(firstAnd, secondAnd, e);
	
END structural;