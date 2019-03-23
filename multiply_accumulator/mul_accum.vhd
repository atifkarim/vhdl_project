
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mul_accum is
	port 
	(
		clk			: in std_logic;
		clear_accum		: in std_logic;
		in_a			: in STD_LOGIC_VECTOR(31 downto 0) := (others=>'0');
		in_b			: in STD_LOGIC_VECTOR (31 downto 0):= (others=>'0');
		output			: out STD_LOGIC_VECTOR (31 downto 0)
	);
	
end entity;

architecture rtl of mul_accum is

	-- Declare registers for intermediate values
	--signal a_reg : signed (7 downto 0);
	--signal b_reg : signed (7 downto 0);
	signal clear_accum_reg : std_logic;

	signal mult_reg_32 : signed(31 downto 0) := (others=>'0');
	signal adder_out : signed (31 downto 0):= (others=>'0');
	--signal adder_out_reg : signed (31 downto 0);
	signal old_result : signed (31 downto 0):= (others=>'0');

begin

	--mult_reg_16 <= a_reg * b_reg;
	mult_reg_32 <= signed(in_a(15 downto 0)) * signed(in_b(15 downto 0));

	-- Expand 16 bit to 32 bit

	--mult_reg_32 <= (resize(signed(mult_reg_16), mult_reg_32'length));
	--adder_out <= old_result + mult_reg_32;
	process (adder_out, clear_accum_reg)
	begin
		if (clear_accum_reg = '1') then
			-- Clear the accumulated data
			old_result <= (others => '0');
		else
			old_result <= adder_out;
		end if;
	end process;
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			--a_reg <= signed(in_a);
			--b_reg <= signed(in_b);
			clear_accum_reg <= clear_accum;
			
			-- Store accumulation result in a register
			--adder_out_reg <= adder_out;
			adder_out <= old_result + mult_reg_32;
		end if;
	end process;
	
        

	-- Output accumulation result
	output <= std_logic_vector(adder_out);
	
end rtl;