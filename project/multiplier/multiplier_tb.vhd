--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	MULTIPLIER TESTBENCH
--
--	**********

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;



ENTITY tbFor16bitAdders IS
END tbFor16bitAdders;
 
ARCHITECTURE tb OF multiplierTB IS

CONSTANT CLK_PERIOD: TIME := 20 ps;
CONSTANT N: INTEGER := 8;

SIGNAL X: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL Y: STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL reset: STD_LOGIC;
SIGNAL clock: STD_LOGIC;
SIGNAL enable: STD_LOGIC;
SIGNAL output: STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0)

	COMPONENT multiplier IS
	PORT(
		X: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		Y: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		reset: IN STD_LOGIC;
		clock: IN STD_LOGIC;
		enable: IN STD_LOGIC;
		output: OUT STD_LOGIC_VECTOR((2*N)-1 DOWNTO 0)
	);
	END COMPONENT;
	
BEGIN    
	mult: multiplier PORT MAP(X, Y, reset, clock, enable, output);
    
	run: PROCESS
    BEGIN
		enable <= 1;
		
        FOR i IN 0 TO 255 LOOP	-- full 8 bit test must be 0 TO 255 ((2^8)-1)
            X <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, N));
            reset <= '1';
			clock <= '0'; WAIT FOR CLK_PERIOD / 2;
            clock <= '1'; WAIT FOR CLK_PERIOD / 2;
			FOR j IN 0 TO 255 LOOP	-- full 8 bit test must be 0 TO 255 ((2^16)-1)
				reset <= 0;
                Y <= STD_LOGIC_VECTOR(TO_UNSIGNED(j, N));
				clock <= '0'; WAIT FOR CLK_PERIOD / 2;
				clock <= '1'; WAIT FOR CLK_PERIOD / 2;
            END LOOP;
        END LOOP;
        WAIT;
    END PROCESS run;
end multiplierTB;