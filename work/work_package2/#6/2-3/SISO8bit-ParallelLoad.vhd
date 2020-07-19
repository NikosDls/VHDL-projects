LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY siso8bitParallelLoad IS
	PORT( 
		din: IN STD_LOGIC;
		dinall: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		clk: IN STD_LOGIC;
		aload: IN STD_LOGIC;
		reset: IN STD_LOGIC;
		dout: OUT STD_LOGIC
	);
END	siso8bitParallelLoad;

ARCHITECTURE behavioral OF siso8bitParallelLoad IS 
	
	SIGNAL s: STD_LOGIC_VECTOR(31 DOWNTO 0); 
  
BEGIN

	PROCESS(clk, aload, reset, dinall) 
		BEGIN
			IF(reset = '1') THEN 
							s <= (OTHERS => '0');
			
			ELSIF(aload = '1') THEN 
								s <= dinall; 
       
			ELSIF(RISING_EDGE(clk)) THEN 
									s <= s(30 downto 0) & din;
									dout <= s(31);
			END IF; 
	END PROCESS; 
	
END behavioral; 