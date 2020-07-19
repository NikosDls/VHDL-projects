--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: ACCUMULATOR REGISTER
--	ENTITY NAME: areg
--	ENTITY INPUTS: X, Y, reset, clock, enable
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY areg IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		input: IN STD_LOGIC_VECTOR(N DOWNTO 0);
		output: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		aLoad: IN STD_LOGIC;	-- parallel load signal
		shift: IN STD_LOGIC;	-- 1 for shift
		clear: IN STD_LOGIC;	-- 1 for clear
		clock: IN STD_LOGIC
	);
END ENTITY areg;

ARCHITECTURE behavioral OF areg IS

SIGNAL A: STD_LOGIC_VECTOR(N DOWNTO 0);

BEGIN

	output <= A(N-1 DOWNTO 0);	-- we need the only the 8 from 9 bits
	
	PROCESS(clock, clear)
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (clear = '1') THEN A <= (OTHERS => '0');	-- clear
			ELSIF (aLoad = '1') THEN
				A <= input;		-- load the input
			ELSIF (shift = '1') THEN
				A <= '0' & A(N DOWNTO 1);	-- shift right
			END IF;
		END IF; 
	END PROCESS;
					
END behavioral;