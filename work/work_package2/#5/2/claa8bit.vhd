LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY claa8bit IS
	PORT(
        a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        b: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout: OUT STD_LOGIC
    );
END claa8bit;

ARCHITECTURE structural OF claa8bit IS
	
	COMPONENT fba IS
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			cin: IN STD_LOGIC;
			s: OUT STD_LOGIC;
			cout: OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL g: std_logic_vector(7 DOWNTO 0);
	SIGNAL p: std_logic_vector(7 DOWNTO 0);
	SIGNAL c: std_logic_vector(8 DOWNTO 0);
  
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