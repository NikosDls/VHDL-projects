LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY moore IS 
	PORT ( 
        A: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        O: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END moore;
	
ARCHITECTURE fsm OF moore IS

SUBTYPE STATE_TYPE IS STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL state: STATE_TYPE;

CONSTANT S0: STATE_TYPE := "00";
CONSTANT S1: STATE_TYPE := "01";
CONSTANT S2: STATE_TYPE := "10";

BEGIN
    change_state: PROCESS(clk, reset)
    BEGIN
        IF (reset = '1') THEN state <= S0;
        ELSIF (RISING_EDGE(clk)) THEN
			CASE state IS
				WHEN S0 =>	IF (A = '0') THEN state <= S2;
							ELSE state <= S1;
							END IF;
					
				WHEN S1 => 	IF (A = '0') THEN state <= S1;
							ELSE state <= S2;
							END IF;     
					
				WHEN S2 =>	IF (A = '0') THEN state <= S1;
							ELSE state <= S0;
							END IF;
				
				WHEN OTHERS => state <= S0;
			END CASE;
		END IF;
    END PROCESS change_state;
	
	state_work: PROCESS(state)
    BEGIN
			CASE state IS
				WHEN S0 =>	O <= "01"; 
												
				WHEN S1 =>	O <= "11";
							    
				WHEN S2 => 	O <= "11";
							
				WHEN OTHERS => O <= "UU";
			END CASE;
    END PROCESS state_work;
END fsm;