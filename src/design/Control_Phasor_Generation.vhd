-------------------------------------------------------------------------------
-- CONTROL PHASOR GENERATION
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_types_pkg.all;
use ieee.math_real.all;

entity Control_Phasor_Generation is
port(
    clk : in std_logic;
    reset : in std_logic;
    input_ready : in std_logic;
  	System_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
	System_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
	input_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
	input_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Phase   : out  std_logic_vector(FP_SIZE-1 downto 0);
	Control_Gain : out std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Phasor_valid : out std_logic);
end Control_Phasor_Generation;

architecture Behavioral of Control_Phasor_Generation is
component fp_subtract_X_bit is
  Port (
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR (FP_SIZE-1 downto 0);
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR (FP_SIZE-1 downto 0);
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR (FP_SIZE-1 downto 0)
  );

end component;

component fp_divider_X_bit is
  Port (
    aclk : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( FP_SIZE-1  downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( FP_SIZE-1 downto 0 )
  );

end component;

signal subtract_valid, divide_valid: std_logic;
begin



subtract_phase: fp_subtract_X_bit
    port map (
      -- Global signals
    -- AXI4-Stream slave channel for operand A
      s_axis_a_tvalid         => input_ready,
      s_axis_a_tdata          => input_Phase,
      -- AXI4-Stream slave channel for operand B
      s_axis_b_tvalid         => input_ready,
      s_axis_b_tdata          => System_Phase,
      -- AXI4-Stream master channel for output result
      m_axis_result_tvalid    => subtract_valid,
      m_axis_result_tdata     => Control_Phase
      );

divide_gain: fp_divider_X_bit
    port map (
      -- Global signals
      aclk                    => clk,
    -- AXI4-Stream slave channel for operand A
      s_axis_a_tvalid         => input_ready,
      s_axis_a_tdata          => input_gain,
      -- AXI4-Stream slave channel for operand B
      s_axis_b_tvalid         => input_ready,
      s_axis_b_tdata          => System_gain,
      -- AXI4-Stream master channel for output result
      m_axis_result_tvalid    => divide_valid,
      m_axis_result_tdata     => Control_gain
      );


        Control_Phasor_valid <= divide_valid and subtract_valid;

end Behavioral;



