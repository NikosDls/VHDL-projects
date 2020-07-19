LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tbFor16bitAdders IS
END tbFor16bitAdders;
 
ARCHITECTURE tb OF tbFor16bitAdders IS

SIGNAL a: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL b: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL cin: STD_LOGIC;
SIGNAL s: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL cout: STD_LOGIC;
	
	COMPONENT claa16bit IS
	PORT(
		a: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		b: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		cin: IN STD_LOGIC;
		s: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		cout: OUT STD_LOGIC
	);
	END COMPONENT;
	
BEGIN    
	adder: claa16bit PORT MAP(a, b, cin, s, cout);	-- for carry skip adder: csa16bit PORT MAP(a, b, cin, s, cout);
													-- plus the component
    
	run: PROCESS
    BEGIN
        FOR i IN 0 TO 10 LOOP	-- full 16 bit test must be 0 TO 65535 ((2^16)-1)
            a <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 16));
            FOR j IN 0 TO 17 LOOP	-- full 16 bit test must be 0 TO 65535 ((2^16)-1)
                b <= STD_LOGIC_VECTOR(TO_UNSIGNED(j, 16));
                cin <= '0'; WAIT FOR 10 ps;
                cin <= '1'; WAIT FOR 10 ps;
            END LOOP;
        END LOOP;
        WAIT;
    END PROCESS;
end tb;