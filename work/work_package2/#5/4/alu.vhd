LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY alu IS
	PORT(
        A: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        B: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        CHOICE: IN STD_LOGIC_VECTOR(1 DOWNTO 0)
    );	
END alu;

ARCHITECTURE structural OF alu IS

    SIGNAL choice0: STD_LOGIC_VECTOR(15 DOWNTO 0);	-- add
    SIGNAL choice1: STD_LOGIC_VECTOR(15 DOWNTO 0);	-- sub
    SIGNAL choice2: STD_LOGIC_VECTOR(15 DOWNTO 0);	-- mux
    SIGNAL choice3: STD_LOGIC_VECTOR(15 DOWNTO 0);	-- compare
	
    SIGNAL temp:    STD_LOGIC_VECTOR(15 DOWNTO 0);

    COMPONENT add8
        PORT(
            A: IN UNSIGNED(7 DOWNTO 0);
            B: IN UNSIGNED(7 DOWNTO 0);
            C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
	
	COMPONENT sub8
        PORT(
            A: IN UNSIGNED(7 DOWNTO 0);
            B: IN UNSIGNED(7 DOWNTO 0);
            C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
	
	COMPONENT compare8
        PORT(
            A: IN UNSIGNED(7 DOWNTO 0);
            B: IN UNSIGNED(7 DOWNTO 0);
            C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    
    COMPONENT mul8
        PORT(
            A: IN UNSIGNED(7 DOWNTO 0);
            B: IN UNSIGNED(7 DOWNTO 0);
            C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT; 

    COMPONENT mux4
        PORT(
            ADDout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			SUBout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            MULout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			COMPout: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            CHOICE: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
    END COMPONENT;

BEGIN

	stage0: add8 PORT MAP (UNSIGNED(A), UNSIGNED(B), choice0);
	stage1: sub8 PORT MAP (UNSIGNED(A), UNSIGNED(B), choice1);
	stage2: mul8 PORT MAP (UNSIGNED(A), UNSIGNED(B), choice2);
	stage3: compare8 PORT MAP (UNSIGNED(A), UNSIGNED(B), choice3);
	stage4: mux4 PORT MAP (choice0, choice1, choice2, choice3, CHOICE, temp);
    C <= temp;
	
END structural;        