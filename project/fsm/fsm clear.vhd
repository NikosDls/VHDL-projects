LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm IS 
	GENERIC(
		N: integer := 8 	-- length of numbers in bits 				
	);
	
	PORT( 
		A: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);	-- first number
		B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);	-- second number
		choice: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- we have 10 choices
		reset: IN STD_LOGIC;	-- reset signal
		clock: IN STD_LOGIC;	-- clock
		enable: IN STD_LOGIC;	-- enable signal
		scrambler_seed: IN STD_LOGIC_VECTOR(6 DOWNTO 0);	-- scrambler seed
		output: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0)	-- multiplication output is the biggest one
	);
END fsm;
	
ARCHITECTURE behavioral OF fsm IS

-- components

TYPE STATE_TYPE IS (IDLE, 
					ADDER_KOGGE, ADDER_CARRY, 
					MULTIPLIER, 
					XORCIPHER_ENCODER, XORCIPHER_DECODER, 
					ROM_ENCRYPT, ROM_DECRYPT, 
					SCRAMBLER, 
					PIPO,
					DIVISION);			
SIGNAL state: STATE_TYPE;

SIGNAL choice0: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- ADDER_KOGGE
SIGNAL choice1: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- ADDER_CARRY
SIGNAL choice2: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- MULTIPLIER
SIGNAL choice3: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- XORCIPHER_ENCODER
SIGNAL choice4: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- XORCIPHER_DECODER
SIGNAL choice5: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- ROM_ENCRYPT
SIGNAL choice6: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- ROM_DECRYPT
SIGNAL choice7: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- SCRAMBLER
SIGNAL choice8: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- PIPO
SIGNAL choice9: STD_LOGIC_VECTOR(2*N-1 DOWNTO 0);	-- DIVISION

BEGIN
	--
	-- all portmaps
	--
	
    change_state: PROCESS(clock, reset)
    BEGIN
        IF (reset = '1') THEN state <= IDLE;
        ELSIF (RISING_EDGE(clock)) THEN
			CASE choice IS
				WHEN "0000" =>  state <= ADDER_KOGGE;	
							
				WHEN "0001" => 	state <= ADDER_CARRY;
				
				WHEN "0010" => 	state <= MULTIPLIER;
				
				WHEN "0011" => 	state <= XORCIPHER_ENCODER;
				
				WHEN "0100" => 	state <= XORCIPHER_DECODER;
				
				WHEN "0101" => 	state <= ROM_ENCRYPT;
				
				WHEN "0110" => 	state <= ROM_DECRYPT;
				
				WHEN "0111" => 	state <= SCRAMBLER;
				
				WHEN "1000" => 	state <= PIPO;
				
				WHEN "1001" => 	state <= DIVISION;
									
				WHEN OTHERS =>	state <= IDLE;
			END CASE;
		END IF;
    END PROCESS change_state;
	
	state_work: PROCESS(state)
    BEGIN
		CASE state IS
			WHEN IDLE => output <= (OTHERS => 'U');
			
			WHEN ADDER_KOGGE =>			output <= choice0;
			
			WHEN ADDER_CARRY =>			output <= choice1;
			
			WHEN MULTIPLIER =>			output <= choice2;
			
			WHEN XORCIPHER_ENCODER =>	output <= choice3;
			
			WHEN XORCIPHER_DECODER =>	output <= choice4;
			
			WHEN ROM_ENCRYPT =>			output <= choice5;
			
			WHEN ROM_DECRYPT =>			output <= choice6;
			
			WHEN SCRAMBLER =>			output <= choice7;
			
			WHEN PIPO =>				output <= choice8;
			
			WHEN DIVISION =>			output <= choice9;
			
			WHEN OTHERS =>	null;
			END CASE;
    END PROCESS state_work;
	
END behavioral;