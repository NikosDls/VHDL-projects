Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

entity MULT is
port
(A, B: in std_logic_vector(3 downto 0);
 CLK,RESET: in std_logic;
 Product: out std_logic_vector(7 downto 0)
 --CLK: in bit;
 --START: in BIT;
 --DONE: out BIT
);
end MULT;

architecture Shift_Mult of MULT is
begin
process(CLK,RESET)
variable Q: std_logic_vector(7 downto 0);
variable X,Y,Z: std_logic_vector(3 downto 0);
--variable product_reg:std_logic_vector(7 downto 0);

begin
if(RESET='1') then
X:= A;
Y:= B;
Q:="0000" & Y ;

elsif(rising_edge(CLK)) then 
for i in 0 to 3 loop
if Q(0)='1' then 
Q(7 downto 4):=Q(7 downto 4)+X(3 downto 0);
end if;
Q(7 downto 0):='0' & Q(7 downto 1) ; 

end loop;
end if;
Product<=Q(7 downto 0);
end process;
	
end Shift_Mult;