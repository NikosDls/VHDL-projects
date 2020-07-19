--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: MULTIPLICAND REGISTER
--	ENTITY NAME: mreg
--	ENTITY INPUTS: input, aload, clock
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mreg IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		input: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		aload: IN STD_LOGIC;	-- parallel load signal
		clock: IN STD_LOGIC
	);
END ENTITY mreg;

ARCHITECTURE behavioral OF mreg IS
BEGIN

	PROCESS(clock) 
		BEGIN
			IF (RISING_EDGE(clock)) THEN 
				IF (aload = '1') THEN
					output <= input;	-- we load the input
				END IF;
			END IF;
	END PROCESS;
					
END behavioral;