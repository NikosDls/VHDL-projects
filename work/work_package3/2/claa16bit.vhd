LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY claa16bit IS
	PORT(
        a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		cout: OUT STD_LOGIC
    );
END claa16bit;

ARCHITECTURE structural OF claa16bit IS
	
	COMPONENT fba IS
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			cin: IN STD_LOGIC;
			s: OUT STD_LOGIC;
			cout: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL g: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL p: STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL c: STD_LOGIC_VECTOR(16 DOWNTO 0);
  
BEGIN

	gen_all: FOR i IN 0 TO 15 generate
		gen: fba PORT MAP(a(i), b(i), c(i), s(i), open);
	END generate gen_all;
	
	claa: FOR i IN 0 TO 15 generate
		g(i) <= a(i) AND b(i);
		p(i) <= a(i) OR b(i);
		c(i+1) <= g(i) OR (p(i) AND c(i));
	END generate claa;
	
	c(0) <= cin;
	cout <= c(16);
	
END structural;