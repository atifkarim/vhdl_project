--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.std_logic_unsigned.all;
----use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.NUMERIC_STD.ALL;
----use IEEE.math_real.all;
--
--entity binary_4_bit_mul_top is
--    Port ( 
--	   clk : in std_logic;
--	   NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
--           NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
--	   NUM3 : in  STD_LOGIC_VECTOR (7 downto 0);
--           SUM : out  STD_LOGIC_VECTOR (15 downto 0));
--end binary_4_bit_mul_top;
--
--architecture Behavioral of binary_4_bit_mul_top is
--
--signal sig_1 : std_logic_vector(15 downto 0);
--signal sig_2 : std_logic_vector(15 downto 0);
--signal sig_3 : std_logic_vector(15 downto 0);
--constant x: std_logic_vector ( 7 downto 0 ) := "10011000" ;
--constant y: std_logic_vector ( 7 downto 0 ) := "10011010" ;
--constant z: std_logic_vector ( 7 downto 0 ) := "10010000" ;
--begin
--  --process (clk)
----variable var_1 : std_logic_vector(15 downto 0);
----variable var_2 : std_logic_vector(15 downto 0);
----variable var_3 : std_logic_vector(15 downto 0);
----begin
----    var_1:=NUM1 * x;
----    var_2:=NUM2 * x;
----    var_3:=NUM3 * x;
--sig_1<=NUM1*x;
--sig_2<=NUM2*y;
--sig_3<=NUM3*z;
--    --MUL <= NUM1 * NUM2;-- * NUM3;
--    --SUM<=var_1 + var_2 + var_3;
--	SUM<=sig_1 + sig_2 + sig_3;
----SUM<= NUM1*x + NUM2*y + NUM3*z; 
----report " output value is " & std_logic_vector'image(var_1+var_2+var_3);
--	--end process;
--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity binary_4_bit_mul_top is
    Port ( 
	   clk : in std_logic;
	   NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
       	   NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
	   NUM3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SUM : out  STD_LOGIC_VECTOR (15 downto 0));
end binary_4_bit_mul_top;

architecture Behavioral of binary_4_bit_mul_top is

signal sig_1 : signed(15 downto 0);
signal sig_2 : signed(15 downto 0);
signal sig_3 : signed(15 downto 0);
constant x: signed ( 7 downto 0 ) := "10011000" ;
constant y: signed ( 7 downto 0 ) := "00011010" ;
constant z: signed ( 7 downto 0 ) := "10010000" ;


begin

sig_1<=  signed(NUM1) * signed (x);
sig_2<= signed(NUM2) * signed (y);
sig_3<= signed(NUM3) * signed (z);

SUM <= std_logic_vector(  (sig_1) +   (sig_2) +  (sig_3));

end Behavioral;

