LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE STD.TEXTIO.ALL; --file I/O
USE IEEE.STD_LOGIC_TEXTIO.ALL; --std_logic values writing to file


ENTITY Divider_tb IS
END Divider_tb;
ARCHITECTURE tb OF Divider_tb IS

COMPONENT Divider is
    Port ( start    : in   STD_LOGIC;
           D 		: in   STD_LOGIC_VECTOR (7 downto 0);
           N 		: in   STD_LOGIC_VECTOR (7 downto 0);
           Q 		: out  STD_LOGIC_VECTOR (7 downto 0);
           R 		: out  STD_LOGIC_VECTOR (7 downto 0);           
		   working  : out  STD_LOGIC;
		   error	: out STD_LOGIC;
           clk      : in   STD_LOGIC);
END COMPONENT;


SIGNAL 		t_start,t_working,t_error, t_clk: std_logic;
SIGNAL		t_D,t_N,t_Q,t_R :std_logic_vector(7 downto 0);

BEGIN
dut: Divider PORT MAP (t_start,t_D,t_N,t_Q,t_R,t_working,t_error,t_clk );

STIMULUS_CLK : PROCESS
BEGIN
 t_Clk <= '0';
 WAIT FOR 3 ns;
 t_Clk <= '1';
 WAIT FOR 3 ns;
END PROCESS STIMULUS_CLK; 

tb : PROCESS
 FILE logFile : text OPEN write_mode IS "log.txt";
 VARIABLE L: line;
 BEGIN
  
 WRITE(L, string'("N")); -- include heading in file
 WRITE(L, ht);
 WRITE(L, string'("D"));
 WRITE(L, ht);
 WRITE(L, string'("Q"));
 WRITE(L, ht);
 WRITE(L, string'("R"));
 WRITE(L, ht);
 WRITE(L, string'("Error"));
 WRITELINE(logFile,L);
	FOR i IN 0 TO 255 LOOP
		FOR j IN 0 TO 255 LOOP
			t_N <= std_logic_vector(to_unsigned(i,8));
			t_D  <= std_logic_vector(to_unsigned(j,8));
			WAIT FOR 5 ns;
			t_start <= '1';
			WAIT FOR 25 ns;
			t_start <= '0';
			WAIT FOR 50 ns;
			WRITE(L, TO_INTEGER(UNSIGNED(t_N))); -- insert unsigned decimal value of N in file
			WRITE(L, ht);
			WRITE(L, TO_INTEGER(UNSIGNED(t_D))); -- insert unsigned decimal value of D in file
			WRITE(L, ht);
			WRITE(L, TO_INTEGER(UNSIGNED(t_Q))); -- insert unsigned decimal value of Q in file
			WRITE(L, ht);
			WRITE(L, TO_INTEGER(UNSIGNED(t_R))); -- insert unsigned decimal value of R in file
			WRITE(L, ht);
			WRITE(L, t_error);					-- insert value of error in file
			WRITELINE(logFile,L);
			IF t_error='0' THEN
				ASSERT --check for wrong division result
				(TO_INTEGER(UNSIGNED(t_N))) = (TO_INTEGER(UNSIGNED(t_Q)))*(TO_INTEGER(UNSIGNED(t_D))) + (TO_INTEGER(UNSIGNED(t_R)))
				REPORT "Incorrect division"
				SEVERITY NOTE;
			ELSE
				ASSERT  --check for wrong result for division by zero.
					(t_Q="11111111" AND t_R="11111111")
				REPORT "Incorrect div by zero result"
				SEVERITY NOTE;
			END IF;
		END LOOP;
	END LOOP;
	
	FILE_CLOSE(logFile);
	WAIT;
	END PROCESS;
END tb;