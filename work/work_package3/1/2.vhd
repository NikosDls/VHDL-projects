LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY moore IS 
	PORT ( 
        A: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        O: OUT STD_LOGIC    -- 0: S1, 1: S2
	);
END moore;
	
ARCHITECTURE fsm OF moore IS

TYPE STATE_TYPE IS (S1, S2);
SIGNAL state: STATE_TYPE;

BEGIN
    change_state: PROCESS(clk, reset)
    BEGIN
        IF (reset = '1') THEN state <= S1;
        ELSIF (RISING_EDGE(clk)) THEN
			CASE state IS
				WHEN S1 =>	IF (A = '0') THEN state <= S2;
							ELSE state <= S1;
							END IF;
					
				WHEN S2 => 	IF (A = '0') THEN state <= S1;
							ELSE state <= S2;
							END IF;
							
				WHEN OTHERS => state <= S1;
			END CASE;
		END IF;
    END PROCESS change_state;
	
	state_work: PROCESS(state)
    BEGIN
			CASE state IS
				WHEN S1 =>	O <= '0'; 
												
				WHEN S2 =>	O <= '1';
							
				WHEN OTHERS => O <= 'U';
			END CASE;
    END PROCESS state_work;
END fsm;