LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY siso8bit IS
	PORT( 
		din: IN STD_LOGIC;
		clk: IN STD_LOGIC;
		reset: IN STD_LOGIC;
		dout: OUT STD_LOGIC
	);
END	siso8bit;

ARCHITECTURE behavioral OF siso8bit IS
		
	SIGNAL s: STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
	
BEGIN

	PROCESS(clk, din, reset) IS
	BEGIN
		IF(reset = '1') THEN 
							s <= (OTHERS => '0');
		
		ELSIF (RISING_EDGE(clk)) THEN 
									s <= (s(6 DOWNTO 0) & din); 
									dout <= s(7);
		END IF;
	END PROCESS;
	
END behavioral;