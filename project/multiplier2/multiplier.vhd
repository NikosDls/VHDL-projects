--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: MULTIPLIER
--	ENTITY NAME: MULTIPLIER
--	ENTITY INPUTS: X, Y, reset, clock, enable
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY multiplier IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		-- NUMBERS MUST BE BIT_VECTOR TYPE, BECAUSE WE USE ROR AND SRL OPERATION
		X: IN BIT_VECTOR(N-1 DOWNTO 0);	-- first number
		Y: IN BIT_VECTOR(N-1 DOWNTO 0);	-- second number
		reset: IN STD_LOGIC;	-- reset signal
		clock: IN STD_LOGIC;	-- clock
		enable: IN STD_LOGIC;	-- enable signal
		output: OUT BIT_VECTOR((2*N)-1 DOWNTO 0)	-- multiplication output
	);
END ENTITY multiplier;

ARCHITECTURE behavioral OF multiplier IS

SIGNAL A: BIT_VECTOR(N-1 DOWNTO 0);
SIGNAL Q: BIT_VECTOR(N-1 DOWNTO 0);
SIGNAL B: BIT_VECTOR(N-1 DOWNTO 0);
SIGNAL S: BIT_VECTOR(N-1 DOWNTO 0);
--SIGNAL c: BIT_VECTOR(N DOWNTO 0);

	COMPONENT claa8bit IS
		PORT(
			a: IN BIT_VECTOR(7 DOWNTO 0);
			b: IN BIT_VECTOR(7 DOWNTO 0);
			cin: IN BIT;
			s: OUT BIT_VECTOR(7 DOWNTO 0);
			cout: OUT BIT
		);
	END COMPONENT;

BEGIN

	add: claa8bit PORT MAP(A, B, '0', S, open);		-- S = A + B

	multiplier_work: PROCESS(clock)
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (reset = '0') THEN
				IF (enable = '1') THEN
					IF (Q(0) = '1') THEN
						--for i in 0 to 7 loop
						--	S(i) <= A(i) XOR B(i) XOR c(i);
						--	C(i+1) <= (A(i) AND B(i)) OR (c(i) AND A(i)) OR (c(i) AND B(i));
						--	A(i) <= S(i);
						--end loop;
						
						A <= S;		-- A = A + B
					END IF;
					
					A <= A SRL 1;	-- round right shift A
					Q <= Q ROR 1;	-- round right shift Q
				ELSE
					output <= A & Q;	-- if enable is 0, we know that multiplication is over
				END IF;
			ELSE	-- if reset is 1, we initialize our signals
				B <= X;
				Q <= Y;
				A <= "00000000";
			END IF;
		END IF;
	END PROCESS multiplier_work;

END ARCHITECTURE behavioral;