LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mealy IS 
	PORT( 
		A: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		reset: IN STD_LOGIC;
		O: OUT STD_LOGIC
	);
END mealy;
	
ARCHITECTURE fsm OF mealy IS

TYPE STATE_TYPE IS (S0, S1, S2);
SIGNAL state: STATE_TYPE;

BEGIN
    change_state: PROCESS(clk, reset)
    BEGIN
        IF (reset = '1') THEN state <= S0;
							  O <= 'U';
        ELSIF (RISING_EDGE(clk)) THEN 			
			CASE state IS
				WHEN S0 =>	O <= '0';
							IF (A = '0') THEN state <= S2;
							ELSE state <= S1;
							END IF;
				
				WHEN S1 => 	O <= '1';
							IF (A = '0') THEN state <= S2;
							ELSE state <= S1;
							END IF;     
				
				WHEN S2 =>	O <= '0'; 
							IF (A = '0') THEN state <= S2;
							ELSE state <= S1;
							END IF;
							
				WHEN OTHERS => state <= S0;
			END CASE;
		END IF;
    END PROCESS change_state;
END fsm;