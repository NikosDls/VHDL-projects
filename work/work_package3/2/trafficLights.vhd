LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY trafficLights IS 
	PORT ( 
        clk: IN STD_LOGIC;
        reset: IN STD_LOGIC
	);
END trafficLights;
	
ARCHITECTURE fsm OF trafficLights IS

TYPE LIGHT IS (isON, isOFF);
SIGNAL ewRED, ewYELLOW, ewGREEN, nsRED, nsYELLOW, nsGREEN: LIGHT := isOFF;

TYPE STATE_TYPE IS (ewSTOP, ewGO, ewCHANGE, ewGOready, ewSTOPPING,
					nsSTOP, nsGO, nsCHANGE, nsGOready, nsSTOPPING);			
SIGNAL state: STATE_TYPE;

SIGNAL ewCAR, nsCAR: STD_LOGIC := '0';	-- 1 if car is moving	0 if car is stopped

BEGIN
    change_state: PROCESS(clk, reset)
    BEGIN
        IF (reset = '1') THEN state <= ewSTOP;
        ELSIF (RISING_EDGE(clk)) THEN
			CASE state IS
				WHEN ewSTOP => 	state <= nsCHANGE;	
					
				WHEN nsCHANGE =>  state <= nsSTOPPING;

				WHEN nsSTOPPING =>	IF (nsCAR = '1') THEN state <= nsSTOP;
									ELSE state <= ewGO;
									END IF;
				
				WHEN nsSTOP =>	state <= ewCHANGE;
				
				WHEN ewCHANGE =>	state <= ewSTOPPING;
				
				WHEN ewGO =>	IF (nsCAR = '1') THEN state <= ewCHANGE;
								ELSE state <= ewGOready;
								END IF;
								
				WHEN ewGOready =>	IF (nsCAR = '1') THEN state <= ewSTOPPING;
									--else error
									END IF;
						
				WHEN ewSTOPPING =>	IF (ewCAR = '1') THEN state <= ewSTOP;
									ELSE state <= nsGO;
									END IF;
									
				WHEN nsGO =>	IF (ewCAR = '1') THEN state <= nsCHANGE;
								ELSE state <= nsGOready;
								END IF;
				
				WHEN nsGOready =>	IF (ewCAR = '1') THEN state <= nsSTOPPING;
									--else error
									END IF;
									
				WHEN OTHERS => state <= ewGO;
			END CASE;
		END IF;
    END PROCESS change_state;
	
	state_work: PROCESS(state)
    BEGIN
		CASE state IS
			WHEN ewSTOP =>	ewRED <= isON;
							ewYELLOW <= isOFF;
							ewGREEN <= isOFF;
							nsRED <= isOFF;
							nsYELLOW <= isOFF;
							nsGREEN <= isON;
							
			WHEN ewSTOPPING	=>	ewRED <= isON;
								ewYELLOW <= isOFF;
								ewGREEN <= isOFF;
								nsRED <= isOFF;
								nsYELLOW <= isOFF;
								nsGREEN <= isON;
			
			WHEN ewCHANGE =>	ewRED <= isOFF;
								ewYELLOW <= isON;
								ewGREEN <= isOFF;
								nsRED <= isON;
								nsYELLOW <= isOFF;
								nsGREEN <= isOFF;
								
			WHEN ewGOready =>	ewRED <= isOFF;
								ewYELLOW <= isON;
								ewGREEN <= isOFF;
								nsRED <= isON;
								nsYELLOW <= isOFF;
								nsGREEN <= isOFF;
			
			WHEN nsSTOP =>	ewRED <= isOFF;
							ewYELLOW <= isOFF;
							ewGREEN <= isON;
							nsRED <= isON;
							nsYELLOW <= isOFF;
							nsGREEN <= isOFF;
							
			WHEN nsSTOPPING	=>	ewRED <= isOFF;
								ewYELLOW <= isOFF;
								ewGREEN <= isON;
								nsRED <= isON;
								nsYELLOW <= isOFF;
								nsGREEN <= isOFF;
			
			WHEN nsCHANGE =>	ewRED <= isON;
								ewYELLOW <= isOFF;
								ewGREEN <= isOFF;
								nsRED <= isOFF;
								nsYELLOW <= isON;
								nsGREEN <= isOFF;
								
			WHEN nsGOready =>	ewRED <= isON;
								ewYELLOW <= isOFF;
								ewGREEN <= isOFF;
								nsRED <= isOFF;
								nsYELLOW <= isON;
								nsGREEN <= isOFF;				
						
			WHEN OTHERS =>	null;
			END CASE;
    END PROCESS state_work;
END fsm;