--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: MULTIPLIER CONTROLLER
--	ENTITY NAME: controller
--	ENTITY INPUTS: reset, enable, clock
--	ENTITY OUTPUTS: loadA, loadM, loadQ, shift
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY controller IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		reset: IN STD_LOGIC;
		enable: IN STD_LOGIC;
		clock: IN STD_LOGIC;
		lsb: OUT STD_LOGIC;		-- least significant bit
		loadA: OUT STD_LOGIC;	-- load from adder
		loadM: OUT STD_LOGIC;	-- load from m register
		loadQ: OUT STD_LOGIC;	-- load from q register
		shift: OUT STD_LOGIC;	-- shift right AQ
		clear: OUT STD_LOGIC;	-- clear
		done: OUT STD_LOGIC		-- signal to end
	);
END ENTITY controller;

ARCHITECTURE behavioral OF controller IS

TYPE STATES IS(INIT, ADD, SHIFT, STOP);
SIGNAL state: STATES := STOP;

SIGNAL itsOver: STD_LOGIC;	-- 1 if the multiplication is over

BEGIN

	clear <= '1' WHEN state = INIT ELSE '0';
	loadM <= '1' WHEN state = INIT ELSE '0'; 
	loadQ <= '1' WHEN state = INIT ELSE '0'; 	
	loadA <= '1' WHEN (state = ADD) AND (lsb = '1') ELSE '0'; 
	shift <= '1' WHEN state = SHIFT ELSE '0';
	done <= '1' WHEN state = STOP ELSE '0';
	
	change_state: PROCESS(clock, reset)
	BEGIN
		IF (reset = '1') THEN state <= STOP;
		ELSIF (RISING_EDGE(clock)) THEN
			CASE state IS
				WHEN STOP => IF (enable = '1') THEN state <= INIT;	-- start the process of multiplication
							 END IF;
							 
				WHEN INIT => state <= ADD;	-- A = A + M if lsb(Q0) = 1
				
				WHEN ADD => STATE <= SHIFT;	-- shift AQ
				
				WHEN shift => IF (itsOver = '1') THEN state <= STOP;	-- check if multiplication is over
							  ELSE state <= ADD;	-- else we continue the process
							  END IF;
				
				WHEN OTHERS => null;
			END CASE;
		END IF;
	END PROCESS change_state;
	
	check_iterations: PROCESS(clock)
	VARIABLE counter: INTEGER RANGE 0 TO 7;
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			CASE state IS
				WHEN INIT => counter := 0;
							 
				WHEN ADD => IF (counter = 7) THEN counter := 0;
							ELSE counter := counter + 1;
							END IF;
				
				WHEN OTHERS => null;
			END CASE;
		END IF;
		
		IF (COUNTER = 0) THEN
			itsOver = '1';
		ELSE
			itsOver = '0';
		END IF;	
	END PROCESS check_iterations;
	
END behavioral;