--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: MULTIPLIER REGISTER
--	ENTITY NAME: qreg
--	ENTITY INPUTS: X, Y, reset, clock, enable
--	ENTITY OUTPUTS: output
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY qreg IS
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT(
		dinall: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		din: IN STD_LOGIC;		-- serial input
		aload: IN STD_LOGIC;	-- parallel load
		shift: IN STD_LOGIC;	-- 1 for right shift
		clock: IN STD_LOGIC
	);
END ENTITY qreg;

ARCHITECTURE behavioral OF qreg IS

SIGNAL shift_reg: STD_LOGIC_VECTOR(N-1 DOWNTO 0);

BEGIN
	
	dout <= shift_reg;
	
	PROCESS(clock)
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (aload = '1') THEN
				shift_reg <= dinall;
			ELSIF (shift = '1') THEN
				shift_reg <= din & shift_reg(N-1 DOWNTO 1);
			END IF;
		END IF;
	END PROCESS;
	
END behavioral;