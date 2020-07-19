LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY claa8bit IS
	PORT(
        a: IN BIT_VECTOR(7 DOWNTO 0);
        b: IN BIT_VECTOR(7 DOWNTO 0);
		cin: IN BIT;
		s: OUT BIT_VECTOR(7 DOWNTO 0);
		cout: OUT BIT
    );
END claa8bit;

ARCHITECTURE structural OF claa8bit IS
	
	COMPONENT fba IS
		PORT(
			a: IN BIT;
			b: IN BIT;
			cin: IN BIT;
			s: OUT BIT;
			cout: OUT BIT
		);
	END COMPONENT;

	SIGNAL g: BIT_VECTOR(7 DOWNTO 0);
	SIGNAL p: BIT_VECTOR(7 DOWNTO 0);
	SIGNAL c: BIT_VECTOR(8 DOWNTO 0);
  
BEGIN

	gen_all: FOR i IN 0 TO 7 generate
		gen: fba PORT MAP(a(i), b(i), c(i), s(i), open);
	END generate gen_all;
	
	claa: FOR i IN 0 TO 7 generate
		g(i) <= a(i) AND b(i);
		p(i) <= a(i) OR b(i);
		c(i+1) <= g(i) OR (p(i) AND c(i));
	END generate claa;
	
	c(0) <= cin;
	cout <= c(8);
	
END structural;