LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fba IS
	PORT(
        a: IN STD_LOGIC;
        b: IN STD_LOGIC;
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC;
		cout: OUT STD_LOGIC
    );
END fba;

ARCHITECTURE structural OF fba IS
	
	COMPONENT hba IS
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			s: OUT STD_LOGIC;
			c: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL sout: STD_LOGIC;
    SIGNAL cout1: STD_LOGIC;
    SIGNAL cout2: STD_LOGIC;
	
BEGIN
	
	stage0: hba PORT MAP(a, b, sout, cout1);
	stage1: hba PORT MAP(cin, sout, s, cout2);
	cout <= cout1 OR cout2;
	
END structural;