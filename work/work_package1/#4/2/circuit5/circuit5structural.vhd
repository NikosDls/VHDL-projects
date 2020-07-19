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

ARCHITECTURE structural OF circuit5 IS

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

    SIGNAL notA0: STD_LOGIC;
    SIGNAL notA1: STD_LOGIC;

BEGIN

	stage0:	notGate PORT MAP(A0, notA0);
	stage1:	notGate PORT MAP(A1, notA1);
	stage2:	and2 PORT MAP(notA0, notA1, D0);
	stage3: and2 PORT MAP(A0, notA1, D1);
	stage4: and2 PORT MAP(A1, notA0, D2);
	stage5: and2 PORT MAP(A1, A0, D3);

END structural;