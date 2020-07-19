LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Divider IS
 
    PORT ( start    : IN STD_LOGIC;    					--SIGNAL for division start.
           D   		: IN STD_LOGIC_VECTOR (7 DOWNTO 0); --D (denominator divisor   dieraitis)
           N  		: IN STD_LOGIC_VECTOR (7 DOWNTO 0); --N (Numerator dividend dieraiteos)
           Q  		:OUT STD_LOGIC_VECTOR (7 DOWNTO 0); --Q (Quotient piliko)
           R 		:OUT STD_LOGIC_VECTOR (7 DOWNTO 0);	--R (Remainder ipolipo)
           working  :OUT STD_LOGIC;   					--working SIGNAL: IF =1 processing IF =0 result is ready
           error	:OUT STD_LOGIC;						--division by zero SIGNAL error;
		   clk      : IN STD_LOGIC);	  				--clock;	
END Divider;

architecture bhv of Divider is

SIGNAL N_temp : UNSIGNED(7 DOWNTO 0); -- Temp signal used for casting the N signal
SIGNAL D_temp : UNSIGNED(7 DOWNTO 0); -- Temp signal used for casting the D signal
SIGNAL Q_temp  : UNSIGNED(7 DOWNTO 0); -- Temp signal used for casting the Q signal
SIGNAL R_temp  : UNSIGNED(7 DOWNTO 0); -- Temp signal used for casting the R signal
SIGNAL counter : UNSIGNED(3 DOWNTO 0); --RANGE 8 DOWNTO 0;
TYPE statetype is (idle, preprocessing, processing, ready);
SIGNAL state : statetype;

BEGIN

   PROCESS 
   VARIABLE r_n_shifter : UNSIGNED(7 DOWNTO 0); --Variable used for storing the r_n_shifter 
   BEGIN
      WAIT UNTIL rising_edge(clk);
      CASE state is 
        ----------------------------------------------------------------
		--IDLE state waiting for division                             --  
		---------------------------------------------------------------- 	 
		 WHEN idle => 
            IF (start='1') THEN 
               state <= preprocessing; 
               working <= '1';
            END IF;
            N_temp <= unsigned(N);  --Load N data
            D_temp <= unsigned(D);  --Load D data

		
		----------------------------------------------------------------
		--  PREPROCESSING state load initial values and check for     --
		--  special cases resulting errors or fastest calculation	  --
		---------------------------------------------------------------- 	
         WHEN preprocessing =>
            Q_temp <= (OTHERS=>'0'); --Initialize Q
            R_temp <= (OTHERS=>'0'); --Initialize R
			error<='0';        
           	counter <= to_unsigned(8,4); --Initialize counter to 8 value
           ----------------------------------------------------------------
		   --Check for special cases                                     --  
		   ----------------------------------------------------------------
		   ----------------------------------------------------------------
		   -- If D=0 ==>division by zero error                           --
           ---------------------------------------------------------------- 
			IF (D_temp=0) THEN  
               Q_temp <= (OTHERS=>'1'); --Q="11111111"
               R_temp <= (OTHERS=>'1'); --R="11111111"
               state <= ready;
			   error<='1';
			   working<='0';
			   
			----------------------------------------------------------------
			-- If divisor>dividend set Quotient to '0' and Remainder to N --
			----------------------------------------------------------------
            ELSIF (D_temp>N_temp) THEN 
               R_temp <= N_temp;
               state <= ready;
			   working<='0';
			   
			----------------------------------------------------------------  
			-- If divisor=dividend set Quotient to '1' and Remainder to '0'- 
			----------------------------------------------------------------
            ELSIF (D_temp=N_temp) THEN
               Q_temp <= to_unsigned(1,8);
			   state <= ready;
			   working<='0';
			ELSE 
				state<=processing;
			END IF;
			

			
		------------------------------------------------------------------
		--  PROCESSING state load implementing integer division  with   --
		--  remainder https://en.wikipedia.org/wiki/Division_algorithm	--
		------------------------------------------------------------------ 	
         WHEN processing =>
           	IF (counter > to_unsigned(0,4)) THEN
					r_n_shifter:=R_temp;
					r_n_shifter:= r_n_shifter(6 DOWNTO 0)&N_temp(7);
					N_temp   <= N_temp(6 DOWNTO 0)&'0';
					IF ( r_n_shifter >= D_temp ) THEN
						r_n_shifter := r_n_shifter-D_temp;
						Q_temp 	<= Q_temp(6 DOWNTO 0)&'1';
					ELSIF r_n_shifter<D_temp THEN
						Q_temp <= Q_temp(6 DOWNTO 0)&'0';					
					END IF;
				R_temp<=r_n_shifter;
				counter<=counter-to_unsigned(1,4);
			ELSE
               state <= ready;
			   working<='0';
            END IF;

		----------------------------------------------------------------------
		--  READY state division is ready   								--
		---------------------------------------------------------------------- 	   
         WHEN ready =>
                     
            IF (start='0') THEN   --waiting for start to go down if not
               state <= idle;  	  --go to idle state waiting for new division
            END IF;
      END CASE;
   END PROCESS;
   
   Q  <= STD_LOGIC_VECTOR(Q_temp);
   R <= STD_LOGIC_VECTOR(R_temp);
   
END bhv;
