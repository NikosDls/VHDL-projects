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

ARCHITECTURE structural OF circuit7 IS
	
	COMPONENT nand2
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			o: OUT STD_LOGIC
		);
    END COMPONENT;

    SIGNAL nandOut1: STD_LOGIC;
    SIGNAL nandOut2: STD_LOGIC;
	SIGNAL nandOut3: STD_LOGIC;
	SIGNAL nandOut4: STD_LOGIC;
	SIGNAL nandOut5: STD_LOGIC;


BEGIN

	stage0:	nand2 PORT MAP(A, B, nandOut1);
	stage1:	nand2 PORT MAP(A, A, nandOut2);
	stage2:	nand2 PORT MAP(B, B, nandOut3);
	stage3: nand2 PORT MAP(nandOut1, nandOut1, O1);
	stage4: nand2 PORT MAP(nandOut2, nandOut3, nandOut4);
	stage5: nand2 PORT MAP(nandOut1, nandOut4, nandOut5);
	stage6: nand2 PORT MAP(nandOut5, nandOut5, O2);
	
END structural;