----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/11/2023 04:13:38 PM
-- Design Name:
-- Module Name: vector_scalar_multiplier - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vector_scalar_multiplier is
    generic(
        VECTOR_WIDTH : integer := INPUT_FEATURE_LENGTH);
    port(
    clk : in std_logic;
    input_valid : in STD_LOGIC;
  	input_mult_vect : in custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0); -- partial features
	input_mult1 : in std_logic_vector(FP_SIZE-1 downto 0);
  	output_mult : out custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  	mult_valid : out std_logic
      );
end vector_scalar_multiplier;

architecture Behavioral of vector_scalar_multiplier is
component fp_mult_16_bit
    Port (
    aclk : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 )
  );
  end component;
  signal valid :  std_logic_vector((INPUT_FEATURE_LENGTH-1) downto 0);
begin
gen_multipliers: for i in 0 to VECTOR_WIDTH-1 generate
  mult :  fp_mult_16_bit port map(
        aclk => clk,
        s_axis_a_tvalid =>input_valid,
        s_axis_a_tdata =>input_mult_vect(i),
        s_axis_b_tvalid => input_valid,
        s_axis_b_tdata =>input_mult1,
        m_axis_result_tvalid =>valid(i),
        m_axis_result_tdata =>output_mult(i)
);

end generate gen_multipliers;
process(valid)
variable temp_valid:std_logic;
begin
    temp_valid := '1';
    for i in 0 to VECTOR_WIDTH-1 loop
        temp_valid := temp_valid and valid(i);
    end loop;
    mult_valid <= temp_valid;
end process;

end Behavioral;
