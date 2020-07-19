--	**********	
--	PROJECT - Anaptyksh Thlepikoinwniakwn Systhmatwn se Yliko
--	Etos: 2017-2018
--	Dollas Nikolaos		Panagou Natalia
--	**********	
--		
--	COMPONENT: SCRAMBLER
--	ENTITY NAME: scrambler
--	ENTITY INPUTS: data_in, reset, clock, enable, scrambler_seed
--	ENTITY OUTPUTS: data_out
--
--	**********	

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY test IS
	PORT(
	a: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END ENTITY test;

ARCHITECTURE behavioral OF test IS
	signal rorrr: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
BEGIN

	rorrr <= a ror 1;

END ARCHITECTURE behavioral;