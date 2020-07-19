--	Input from right to left (bit by bit)
--	Example: number 0010 -> 0 1 0 0

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY bdcToExc3 IS 
	PORT ( 
        A: IN STD_LOGIC;
        clk: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        O: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END bdcToExc3;
	
ARCHITECTURE fsm OF bdcToExc3 IS

TYPE STATE_TYPE IS (S0, S1, S2, S3, S4, S5, S6);
SIGNAL state: STATE_TYPE;
SIGNAL shift_reg: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
    change_state: PROCESS(clk, reset)
    BEGIN
        IF (reset = '1') THEN state <= S0;
							  shift_reg <= "0000";
        ELSIF (RISING_EDGE(clk)) THEN
			CASE state IS
				WHEN S0 =>	IF (A = '0') THEN state <= S1;
											  shift_reg <= '1' & shift_reg(3 DOWNTO 1); 
							ELSE state <= S2;
								 shift_reg <= '0' & shift_reg(3 DOWNTO 1); 
							END IF;
					
				WHEN S1 => 	IF (A = '0') THEN state <= S3;
											  shift_reg <= '1' & shift_reg(3 DOWNTO 1); 
							ELSE state <= S4;
								 shift_reg <= '0' & shift_reg(3 DOWNTO 1); 
							END IF;     
					
				WHEN S2 =>	state <= S4;
							IF (A = '0') THEN shift_reg <= '0' & shift_reg(3 DOWNTO 1); 
							ELSE shift_reg <= '1' & shift_reg(3 DOWNTO 1); 
							END IF;
							
				WHEN S3 => 	state <= S5;
							IF (A = '0') THEN shift_reg <= '0' & shift_reg(3 DOWNTO 1); 
							ELSE shift_reg <= '1' & shift_reg(3 DOWNTO 1); 
							END IF;
							
				WHEN S4 => 	IF (A = '0') THEN state <= S5;
											  shift_reg <= '1' & shift_reg(3 DOWNTO 1);
							ELSE state <= S6;
								 shift_reg <= '0' & shift_reg(3 DOWNTO 1);
							END IF; 

				WHEN S5 => 	state <= S0;
							IF (A = '0') THEN shift_reg <= '0' & shift_reg(3 DOWNTO 1); 
							ELSE shift_reg <= '1' & shift_reg(3 DOWNTO 1); 
							END IF;
							
				WHEN S6 => 	IF (A = '0') THEN state <= S0;
											  shift_reg <= '1' & shift_reg(3 DOWNTO 1);
							-- if A = 1. ERROR
							END IF; 			
							
				WHEN OTHERS => state <= S0;
			END CASE;
		END IF;
    END PROCESS change_state;
	
	O <= shift_reg;
END fsm;