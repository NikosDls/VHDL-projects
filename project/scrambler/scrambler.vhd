--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: SCRAMBLER
--	ENTITY NAME: scrambler
--	ENTITY INPUTS: data_in, reset, clock, enable, scrambler_seed
--	ENTITY OUTPUTS: data_out
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY scrambler IS
	PORT(
		data_in: IN STD_LOGIC;	-- serial input
		reset: IN STD_LOGIC;	-- reset signal
		clock: IN STD_LOGIC;	-- clock
		enable: IN STD_LOGIC;	-- enable signal
		scrambler_seed: IN STD_LOGIC_VECTOR(6 DOWNTO 0);	-- scrambler seed to initialize the scrambler shift register
		data_out: OUT STD_LOGIC	-- serial output
	);
END ENTITY scrambler;

ARCHITECTURE behavioral OF scrambler IS
	
SIGNAL shift_reg: STD_LOGIC_VECTOR(6 DOWNTO 0);	-- X1, X2, ... , X7
SIGNAL temp: STD_LOGIC;		-- signal to save: X4 XOR X7	
	
BEGIN

	temp <= shift_reg(3) XOR shift_reg(6);	-- X4 XOR X7

	scrambler_work: PROCESS(clock)
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (reset = '0') THEN
				IF (enable = '1') then
					shift_reg(6 DOWNTO 1) <= shift_reg(5 DOWNTO 0);		-- moving the input left
					shift_reg(0) <= temp;	-- add in X1 the new input(X4 XOR X7)
				END IF;
			ELSE
				shift_reg <= scrambler_seed;	-- initialize shift register if reset signal is 1
			END IF;
		END IF;
	END PROCESS scrambler_work;
	
	scrambler_output: PROCESS(clock)
	BEGIN
		IF (RISING_EDGE(clock)) THEN
			IF (enable = '1') THEN
				data_out <= data_in XOR temp;
			ELSE
				data_out <= '0';
			END IF;
		END IF;
	END PROCESS scrambler_output;

END ARCHITECTURE behavioral;