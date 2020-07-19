LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY mul8 IS 
    PORT(
        A: IN UNSIGNED(7 DOWNTO 0);
        B: IN UNSIGNED(7 DOWNTO 0);
        C: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END mul8;

ARCHITECTURE dataflow OF mul8 IS
BEGIN
    C <= STD_LOGIC_VECTOR(A * B);
END dataflow;            