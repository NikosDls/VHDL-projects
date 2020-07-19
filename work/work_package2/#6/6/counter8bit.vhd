LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY counter IS
    PORT( 
		clk: IN STD_LOGIC;
		c: OUT  STD_LOGIC_VECTOR (7 DOWNTO 0)	-- counter
	);	
END counter;
 
 
ARCHITECTURE behavioral OF counter IS
 
	SIGNAL tempCounter : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
 
BEGIN
 
	c <= tempCounter;
 
	PROCESS(clk)
	BEGIN
		IF RISING_EDGE(clk) THEN
			tempCounter <= tempCounter + 1;
		END IF;
	END PROCESS;

END behavioral;