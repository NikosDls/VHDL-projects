LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY circuit7 IS
	PORT(
        A: IN STD_LOGIC;
        B: IN STD_LOGIC;
        O1: OUT STD_LOGIC;
		O2: OUT STD_LOGIC
    );
END circuit7;

ARCHITECTURE dataflow OF circuit7 IS
BEGIN
	O1 <= (A NAND B) NAND (A NAND B);
	O2 <= (((A NAND A) NAND (B NAND B)) NAND (A NAND B)) NAND (((A NAND A) NAND (B NAND B)) NAND (A NAND B));
END dataflow;