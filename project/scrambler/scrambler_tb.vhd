--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	SCRAMBLER TESTBENCH
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY scramblerTB IS
END scramblerTB;
 
ARCHITECTURE tb OF scramblerTB IS

CONSTANT CLK_PERIOD: TIME := 20 ps;

SIGNAL data_in: STD_LOGIC;
SIGNAL reset: STD_LOGIC;
SIGNAL clock: STD_LOGIC;
SIGNAL enable: STD_LOGIC;
SIGNAL scrambler_seed: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL data_out: STD_LOGIC;
	
SIGNAL temp_data_in: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	COMPONENT scrambler IS
	PORT(
		data_in: IN STD_LOGIC;
		reset: IN STD_LOGIC;
		clock: IN STD_LOGIC;
		enable: IN STD_LOGIC;
		scrambler_seed: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		data_out: OUT STD_LOGIC
	);
	END COMPONENT;
	
BEGIN    
	scramblerCall: scrambler PORT MAP(data_in, reset, clock, enable, scrambler_seed, data_out);
	
	run: PROCESS
    BEGIN
		enable <= '1';
	
        FOR i IN 0 TO 127 LOOP	-- full 7 bit test must be 0 TO 127 ((2^7)-1)
            scrambler_seed <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 7));	-- all possible seeds
			reset <= '1';
			clock <= '0'; WAIT FOR CLK_PERIOD / 2;
            clock <= '1'; WAIT FOR CLK_PERIOD / 2;
            FOR j IN 0 TO 255 LOOP	-- full 8 bit test must be 0 TO 255 ((2^8)-1)
				reset <= '0';

				temp_data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(j, 8));	
			
				FOR w IN 7 DOWNTO 0 LOOP	-- we need 8 clock changes to shift all 8 bits
					data_in <= temp_data_in(w);		-- input for left to right
					clock <= '0'; WAIT FOR CLK_PERIOD / 2;
					clock <= '1'; WAIT FOR CLK_PERIOD / 2;
				END LOOP;
				
			reset <= '1';	-- reset the scrambler seed for new input
			clock <= '0'; WAIT FOR CLK_PERIOD / 2;
            clock <= '1'; WAIT FOR CLK_PERIOD / 2;
			END LOOP;
        END LOOP;
        WAIT;
    END PROCESS;
end tb;