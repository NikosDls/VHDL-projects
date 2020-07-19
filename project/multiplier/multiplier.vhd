--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: SHIFT AND ADD MULTIPLIER
--	ENTITY NAME: MULTIPLIER
--	ENTITY INPUTS: X, Y, reset, clock, enable
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 

ENTITY multiplier IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		X: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);	-- first number
		Y: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);	-- second number
		reset: IN STD_LOGIC;	-- reset signal
		clock: IN STD_LOGIC;	-- clock
		enable: IN STD_LOGIC;	-- enable signal
		output: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0)	-- multiplication output
	);
END ENTITY multiplier;

ARCHITECTURE behavioral OF multiplier IS


BEGIN

	multiplier_work:PROCESS(clock)	
	VARIABlE AQ: STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0);
	VARIABLE A: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	VARIABLE B: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (reset = '0') THEN
				IF (enable = '1') THEN
					FOR i IN 0 TO N-1 LOOP
						IF (AQ(0) = '1') THEN 
							AQ((2*N)-1 DOWNTO N) := AQ((2*N)-1 DOWNTO N) + A(N-1 DOWNTO 0);		-- add B to A
						END IF;
						
						AQ((2*N)-1 DOWNTO 0) := '0' & AQ((2*N)-1 DOWNTO 1);	-- shift right A_Q 
					END LOOP;
				
					output <= AQ;	-- output
				END IF;
			ELSE	-- if reset is 1, we initialize our signals
				A := X;
				B := Y;
				AQ := "00000000" & B ;
			END IF;
		END IF;
	END PROCESS multiplier_work;
	
end behavioral;