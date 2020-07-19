LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY mux4 IS
	PORT(
        ADDout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		SUBout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        MULout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		COMPout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        CHOICE: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);	
END mux4;

ARCHITECTURE behavioral OF mux4 IS
BEGIN
    PROCESS(CHOICE)
        BEGIN           
			CASE CHOICE IS
				WHEN "00" => C <= ADDout;
				WHEN "01" => C <= SUBout;
				WHEN "10" => C <= MULout;
				WHEN OTHERS => C <= COMPout;    --11
			END CASE;    		
    END PROCESS;
END behavioral;