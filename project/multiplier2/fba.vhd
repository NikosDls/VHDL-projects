LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fba IS
	PORT(
        a: IN BIT;
        b: IN BIT;
		cin: IN BIT;
		s: OUT BIT;
		cout: OUT BIT
    );
END fba;

ARCHITECTURE structural OF fba IS
	
	COMPONENT hba IS
		PORT(
			a: IN BIT;
			b: IN BIT;
			s: OUT BIT;
			c: OUT BIT
		);
	END COMPONENT;

	SIGNAL sout: BIT;
    SIGNAL cout1: BIT;
    SIGNAL cout2: BIT;
	
BEGIN
	
	stage0: hba PORT MAP(a, b, sout, cout1);
	stage1: hba PORT MAP(cin, sout, s, cout2);
	cout <= cout1 OR cout2;
	
END structural;