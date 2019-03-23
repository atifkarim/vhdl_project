library ieee;
use ieee.std_logic_1164.all;

entity binary_4_bit_mul_top is
end binary_4_bit_mul_top;

architecture TEST of binary_4_bit_mul_top is
component binary_4_bit_mul_top
Port ( 
	   clk : in std_logic;
	   NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
       	   NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
	   NUM3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SUM : out  STD_LOGIC_VECTOR (15 downto 0));

--port(EXP_TIME : in integer;
--NO_PICS : in integer;
--SHOW_TIME : in std_ulogic;
--E_ERROR : in std_ulogic;
--DISP_PHOTO : out integer);
end component;


--signal W_EXP_TIME : integer := 0;
--signal W_NO_PICS : integer := 0;
--signal W_SHOW_TIME : std_ulogic := '0';
--signal W_E_ERROR : std_ulogic :='0';
--signal W_DISP_PHOTO : integer:= 0;

-- signal has started

signal clk: std_logic;
signal NUM1: STD_LOGIC_VECTOR (7 downto 0);
signal NUM2: STD_LOGIC_VECTOR (7 downto 0);
signal NUM3: STD_LOGIC_VECTOR (7 downto 0);
signal SUM: STD_LOGIC_VECTOR (15 downto 0);


begin

-- port mapping has started

U0: binary_4_bit_mul_top port map (   clk,
                                       NUM1,
                                       NUM2,
                                       NUM3,
                                       SUM  );


--DUT : binary_4_bit_mul_top
--port map (
--EXP_TIME => W_EXP_TIME,
--E_ERROR=> W_E_ERROR,
--NO_PICS => W_NO_PICS,
--SHOW_TIME => W_SHOW_TIME,
--DISP_PHOTO => W_DISP_PHOTO);

STIMULI : process
--begin
--process()
begin
NUM1<="00000100";
NUM2<="00000101";
NUM3<="00000110";
--W_EXP_TIME<=64;
wait for 30 ns;
NUM1<="00000111";
NUM2<="00001000";
NUM3<="00000110";
--W_EXP_TIME<=64;
wait for 30 ns;
NUM1<="00001000";
NUM2<="00001010";
NUM3<="00001010";
--W_EXP_TIME<=64;
--wait for 30 ns;
--NUM1<='0';
--NUM1<='1';
--NUM1<=2;
--W_EXP_TIME<=64;
wait for 30 ns;

end process;
end TEST;
--configuration CFG_binary_4_bit_mul_top of TB_binary_4_bit_mul_top is
--for TEST
--end for;
--end CFG_binary_4_bit_mul_top;