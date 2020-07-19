LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fa4bit IS
	PORT(
        a: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		cout: OUT STD_LOGIC
    );
END fa4bit;

ARCHITECTURE structural OF fa4bit IS
	
	COMPONENT fba IS
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			cin: IN STD_LOGIC;
			s: OUT STD_LOGIC;
			cout: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL c1: STD_LOGIC;
    SIGNAL c2: STD_LOGIC;
    SIGNAL c3: STD_LOGIC;
	
BEGIN
	
	stage0: fba PORT MAP(a(0), b(0), cin, s(0), c1);
	stage1: fba PORT MAP(a(1), b(1), c1, s(1), c2);
	stage2: fba PORT MAP(a(2), b(2), c2, s(2), c3);
	stage3: fba PORT MAP(a(3), b(3), c3, s(3), cout);
	
END structural;