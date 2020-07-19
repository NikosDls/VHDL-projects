--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: 8 BIT ADDER
--	ENTITY NAME: adder
--	ENTITY INPUTS: a, b
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY adder IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		a: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(N DOWNTO 0)	-- 8th bit is for carry out
	);
END ENTITY adder;

ARCHITECTURE behavioral OF adder IS
BEGIN

	output <= STD_LOGIC_VECTOR(UNSIGNED('0' & a) + UNSIGNED('0' & b));
					
END behavioral;