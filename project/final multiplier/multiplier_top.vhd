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
--	WE NEED 10 CLOCK CYCLES FOR THE MULTIPLICATION PROCESS
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

	COMPONENT mreg IS
		PORT(
			input: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			output: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			aload: IN STD_LOGIC;
			clock: IN STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT qreg IS
		PORT(
			dinall: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			dout: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			din: IN STD_LOGIC;
			aload: IN STD_LOGIC;
			shift: IN STD_LOGIC;
			clock: IN STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT areg IS
		PORT(
			input: IN STD_LOGIC_VECTOR(N DOWNTO 0);
			output: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			aload: IN STD_LOGIC;
			shift: IN STD_LOGIC;
			clear: IN STD_LOGIC;
			clock: IN STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT adder IS
		PORT(
			a: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			b: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			output: OUT STD_LOGIC_VECTOR(N DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT controller IS
		PORT(
			reset: IN STD_LOGIC;
			enable: IN STD_LOGIC;
			clock: IN STD_LOGIC;
			lsb: IN STD_LOGIC;
			loadA: OUT STD_LOGIC;
			loadM: OUT STD_LOGIC;
			loadQ: OUT STD_LOGIC;
			shiftAQ: OUT STD_LOGIC;
			clear: OUT STD_LOGIC;
			done: OUT STD_LOGIC
		);
	END COMPONENT;

SIGNAL MR, QR, AR: STD_LOGIC_VECTOR(N-1 DOWNTO 0);	-- multiplicand register (MR), multiplier register (QR), accumulator register (AR)
SIGNAL AD: STD_LOGIC_VECTOR(N DOWNTO 0);			-- adding result (AD = AR + MR)
SIGNAL loadA, loadM, loadQ, shift, clearA: STD_LOGIC;

BEGIN

	output <= AR & QR;
	
	multiplicandReg: mreg PORT MAP(Y, MR, loadM, clock);
	multiplierReg: qreg PORT MAP(X, QR, AR(0), loadQ, shift, clock);
	accumulatorReg: areg PORT MAP(AD, AR, loadA, shift, clearA, clock);
	adding: adder PORT MAP(AR, MR, AD);
	multiplierController: controller PORT MAP(reset, enable, clock, QR(0), loadA, loadM,
											  loadQ, shift, clearA, done);
					
END behavioral;