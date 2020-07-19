-- 16 bits number input, to 4 blocks (4 bits each block)

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY csa16bit IS 
	PORT(
		A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		B: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		cin: IN STD_LOGIC;
		sum: OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		cout: OUT STD_LOGIC
	);
END csa16bit;

ARCHITECTURE behavioral OF csa16bit IS

	COMPONENT fba IS
		PORT(
			a: IN STD_LOGIC;
			b: IN STD_LOGIC;
			cin: IN STD_LOGIC;
			s: OUT STD_LOGIC;
			cout: OUT STD_LOGIC
		);
	END COMPONENT;

SIGNAL g: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL p: STD_LOGIC_VECTOR (15 DOWNTO 0);
SIGNAL P_block: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL c: STD_LOGIC_VECTOR (16 DOWNTO 0);
SIGNAL C_block: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL CO_block: STD_LOGIC_VECTOR (10 DOWNTO 0);
SIGNAL s: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN

	P_block(4) <= p(0);

	gen_all: FOR i IN 0 TO 15 generate
		gen: fba PORT MAP(a(i), b(i), c(i), s(i), open);
	END generate gen_all;
	
	for1: FOR i IN 0 TO 15 generate
		g(i) <= a(i) AND b(i);
		p(i) <= a(i) OR b(i);
		c(i+1) <= g(i) OR (p(i) AND c(i));
		P_block(4) <= P_block(4) AND p(i);		-- P BLOCK
	END generate for1;

	C_block(4) <= C(4);

	CO_block(1) <= (P_block(1) AND C_block(0)) OR C_block(1);	-- carry out for the next block

	for2: FOR i IN 1 TO 3 generate
		CO_block(i) <= (P_block(i) AND C_block(i)) OR C_block(i+1); 	-- calculate the carry out of the blocks
	END generate for2;

	c(0) <= cin;
	cout <= CO_block(4);
	
	sum <= s;
	
END behavioral;