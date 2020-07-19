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
		output: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0);	-- multiplication output
		done: OUT STD_LOGIC		-- signal to end
	);
END ENTITY multiplier;

ARCHITECTURE behavioral OF multiplier IS


SIGNAL MR,QR,AR: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL AD: STD_LOGIC_VECTOR(N DOWNTO 0);
SIGNAL loadA, loadM, loadQ, shift, clearA: STD_LOGIC;

BEGIN

	output <= AR & QR;
	
	M: mreg PORT MAP(Y, MR, loadM, clock);
	Q: Qreg PORT MAP(X, QR, AR(0), loadQ, shift, clock);
	A: areg PORT MAP(AD, AR, loadA, shift, clearA, clock);
	ADR: adder PORT MAP(AR, MR, AD);
	C: mctrl PORT MAP(reset, enable, clock, QR(0), loadA, loadM,
					loadQ, shift, clearA, done);
					
END behavioral;