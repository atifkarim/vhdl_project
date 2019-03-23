library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity binary_4_bit_mul_top is
end binary_4_bit_mul_top;

architecture TEST of binary_4_bit_mul_top is

--constant x: signed ( 7 downto 0 ) := "10011000" ;
--constant y: signed ( 7 downto 0 ) := "00011010" ;
--constant z: signed ( 7 downto 0 ) := "10010000" ;
component binary_4_bit_mul_top

Port ( 
	   clk : in std_logic;
	   NUM1 : in  STD_LOGIC_VECTOR (7 downto 0);
       	   NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
	   NUM3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SUM : out  STD_LOGIC_VECTOR (15 downto 0));

end component;


-- signal has started

signal clk: std_logic;
signal NUM1: STD_LOGIC_VECTOR (7 downto 0);
signal NUM2: STD_LOGIC_VECTOR (7 downto 0);
signal NUM3: STD_LOGIC_VECTOR (7 downto 0);
signal SUM: STD_LOGIC_VECTOR (15 downto 0);


begin

-- port mapping has started

uut: binary_4_bit_mul_top port map (   clk => clk,
                                       NUM1 => NUM1,
                                       NUM2 => NUM2,
                                       NUM3 => NUM3,
                                       SUM => SUM );



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


-- below code taken from auto generator


configuration cfg_binary_4_bit_mul_top_tb of binary_4_bit_mul_top_tb is

  for bench
    for uut: binary_4_bit_mul_top
      -- Default configuration
    end for;
  end for;
end cfg_binary_4_bit_mul_top_tb;

configuration cfg_binary_4_bit_mul_top_tb_Behavioral of binary_4_bit_mul_top_tb is
  for bench
    for uut: binary_4_bit_mul_top

      use entity work.binary_4_bit_mul_top(Behavioral);

    end for;
  end for;
end cfg_binary_4_bit_mul_top_tb_Behavioral;
