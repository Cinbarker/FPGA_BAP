----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/12/2023 10:10:30 PM
-- Design Name:
-- Module Name: Vector_Vector_Scalar_multiplier - Behavioral
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
use ieee.math_real.all;
use work.my_types_pkg.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vector_Vector_Scalar_multiplier is
    port(
    clk : in std_logic;
    reset: in std_logic;
    input_scalar_mult_valid : in std_logic;
  	input_mult_vect_a : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
	input_mult_vect_b : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
  	output_scalar_mult: out std_logic_vector(FP_SIZE-1 downto 0);
  	output_scalar_mult_valid : out std_logic
      );
end Vector_Vector_Scalar_multiplier;

architecture Behavioral of Vector_Vector_Scalar_multiplier is

signal output_mult : custom_fp_array(VECTOR_WIDTH -1 downto 0);
signal intermediate_sums : custom_fp_array(VECTOR_WIDTH*2 -2 downto 0);
signal intermediate_valid: std_logic_vector(VECTOR_WIDTH*2 -2 downto  0);
signal aresetn: std_logic;

component fp_mult_16_bit
    Port (
    aclk: in std_logic;
    aresetn : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 )
  );
  end component;

COMPONENT fp_adder_16_bit
  PORT (
    aclk: IN STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_a_tvalid : IN STD_LOGIC;
    s_axis_a_tdata : IN STD_LOGIC_VECTOR(FP_SIZE-1 DOWNTO 0);
    s_axis_b_tvalid : IN STD_LOGIC;
    s_axis_b_tdata : IN STD_LOGIC_VECTOR(FP_SIZE-1 DOWNTO 0);
    m_axis_result_tvalid : OUT STD_LOGIC;
    m_axis_result_tdata : OUT STD_LOGIC_VECTOR(FP_SIZE-1 DOWNTO 0)
  );
  end component;

begin

aresetn <= (input_scalar_mult_valid and (not reset));

gen_multipliers: for i in 0 to VECTOR_WIDTH -1 generate
  
  mult :  fp_mult_16_bit port map(
        aclk => clk,
        aresetn => aresetn,
        s_axis_a_tvalid =>input_scalar_mult_valid,
        s_axis_a_tdata =>input_mult_vect_a(i),
        s_axis_b_tvalid => input_scalar_mult_valid,
        s_axis_b_tdata =>input_mult_vect_b(i),
        m_axis_result_tvalid =>intermediate_valid(i),
        m_axis_result_tdata =>output_mult(i)
);
end generate gen_multipliers;

intermediate_sums(VECTOR_WIDTH -1 downto 0) <= output_mult;



    gen_adders6:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-1))-1 generate
        begin
            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k),
            s_axis_a_tdata => intermediate_sums(2*k),
            s_axis_b_tvalid => intermediate_valid(2*k+1),
            s_axis_b_tdata => intermediate_sums(2*k+1),
            m_axis_result_tvalid => intermediate_valid(k+2**ADDER_TREE_DEPTH_SCALAR),
            m_axis_result_tdata => intermediate_sums(k+2**ADDER_TREE_DEPTH_SCALAR)
                );
    end generate;

    gen_adders5:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-2))-1 generate
        begin

            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR),
            s_axis_a_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR),
            s_axis_b_tvalid => intermediate_valid(2*k+1+2**ADDER_TREE_DEPTH_SCALAR),
            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR),
            m_axis_result_tvalid => intermediate_valid(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)),
            m_axis_result_tdata => intermediate_sums(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1))
                );
    end generate;
    gen_adders4:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-3))-1 generate
        begin

            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)),
            s_axis_a_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)),
            s_axis_b_tvalid => intermediate_valid(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)),
            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)),
            m_axis_result_tvalid => intermediate_valid(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)),
            m_axis_result_tdata => intermediate_sums(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2))
                );
    end generate;
    gen_adders3:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-4))-1 generate
        begin

            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)),
            s_axis_a_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)),
            s_axis_b_tvalid => intermediate_valid(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)),
            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)),
            m_axis_result_tvalid => intermediate_valid(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)),
            m_axis_result_tdata => intermediate_sums(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3))
                );
    end generate;

  gen_adders2:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-5))-1 generate
        begin

            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)),
            s_axis_a_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)),
            s_axis_b_tvalid => intermediate_valid(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)),
            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)),
            m_axis_result_tvalid => intermediate_valid(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)),
            m_axis_result_tdata => intermediate_sums(k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4))
                );
    end generate;
    gen_adders1:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-6))-1 generate
        begin

            adder: fp_adder_16_bit port map(
            aclk => clk,
            aresetn => aresetn,
            s_axis_a_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)),
            s_axis_a_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)),
            s_axis_b_tvalid =>intermediate_valid(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)),
            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)),
            m_axis_result_tvalid => intermediate_valid(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)+2**(ADDER_TREE_DEPTH_SCALAR-5)),
            m_axis_result_tdata => intermediate_sums(2*k+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)+2**(ADDER_TREE_DEPTH_SCALAR-5))
                );
    end generate;

    output_scalar_mult <= intermediate_sums(2*VECTOR_WIDTH-2);
    output_scalar_mult_valid <= intermediate_valid(2*VECTOR_WIDTH-2);
--    gen_adders0:for k in 0 to (2**(ADDER_TREE_DEPTH_SCALAR-7))-1 generate
--        begin

--            adder: fp_adder_16_bit port map(
--            aclk => clk,
--            aresetn => aresetn,
--            s_axis_a_tvalid => '1',
--            s_axis_a_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)+2**(ADDER_TREE_DEPTH_SCALAR-5)),
--            s_axis_b_tvalid => '1',
--            s_axis_b_tdata => intermediate_sums(2*k+1+2**ADDER_TREE_DEPTH_SCALAR+2**(ADDER_TREE_DEPTH_SCALAR-1)+2**(ADDER_TREE_DEPTH_SCALAR-2)+2**(ADDER_TREE_DEPTH_SCALAR-3)+2**(ADDER_TREE_DEPTH_SCALAR-4)+2**(ADDER_TREE_DEPTH_SCALAR-5)),
--            m_axis_result_tvalid => open,
--            m_axis_result_tdata => output_scalar_mult
--                );
--    end generate;


end Behavioral;
