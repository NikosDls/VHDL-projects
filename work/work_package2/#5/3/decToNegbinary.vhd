LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY decToNegbinary IS
	PORT(
        a: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		o: OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
    );
END decToNegbinary;

ARCHITECTURE dataflow OF decToNegbinary IS

	SIGNAL tempInt: INTEGER RANGE 0 TO 255 := 0;
	SIGNAL tempBinary: STD_LOGIC_VECTOR(7 DOWNTO 0);
  
BEGIN
	
	tempInt <= TO_INTEGER(UNSIGNED(a));
	
	tempBinary <= STD_LOGIC_VECTOR(TO_UNSIGNED(tempInt, 8));
	
	o <= '1' & tempBinary;
	
END dataflow;