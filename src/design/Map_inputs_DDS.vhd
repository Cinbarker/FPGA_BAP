-------------------------------------------------------------------------------
-- MAP INPUTS DDS
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity Map_inputs_DDS is
port(
    clk: in std_logic;
    input_Map_inputs_DDS_valid : in std_logic;
  	Control_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	DDS_Phase: out  std_logic_vector(31 downto 0);
  	DDS_Gain : out std_logic_vector(15 downto 0);
  	output_Map_inputs_DDS_valid: out std_logic
  	);
end Map_inputs_DDS;

architecture Behavioral of Map_inputs_DDS is

component float_to_fixed_32_bit     Port (
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component;


  component fp_16_to_32 is
  Port (
    aclk : in std_logic;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component;

  component floating_point_mult_32_bit is
  Port (
    aclk : in std_logic;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end component;

component fp_mult_16_bit is
  Port (
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
 end component;

component float_to_fixed_32bit_to_16_bit is
  Port (
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_result_tvalid : out STD_LOGIC;
    m_axis_result_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end component;

signal Control_Phase_32, Control_Phase_div_2pi_32 : STD_LOGIC_VECTOR ( 31 downto 0 );
signal  Control_Phase_32_valid, Control_Phase_div_2pi_32_valid: std_logic;
signal DDS_phase_valid, DDS_gain_valid, DDS_gain_pad_valid: std_logic;
signal DDS_phase_pad, DDS_gain_pad:  STD_LOGIC_VECTOR ( 31 downto 0 );
begin

Control_phase_to32: fp_16_to_32 port map(
    aclk =>clk,
    s_axis_a_tvalid => input_Map_inputs_DDS_valid,
    s_axis_a_tdata  => Control_Phase,
    m_axis_result_tvalid  => Control_Phase_32_valid,
    m_axis_result_tdata  => Control_Phase_32
  );

Divide_by_2pi: floating_point_mult_32_bit port map(
    aclk => clk,
    s_axis_a_tvalid => Control_Phase_32_valid ,
    s_axis_a_tdata => Control_Phase_32 ,
    s_axis_b_tvalid =>Control_Phase_32_valid ,
    s_axis_b_tdata => "01001011101000101111100110000011" , -- (2^27 -1)/2pi
    m_axis_result_tvalid => Control_Phase_div_2pi_32_valid,
    m_axis_result_tdata => Control_Phase_div_2pi_32
);
to_fixed_get_DDS_phase: float_to_fixed_32_bit port map(
    s_axis_a_tvalid => Control_Phase_div_2pi_32_valid,
    s_axis_a_tdata  => Control_Phase_div_2pi_32,
    m_axis_result_tvalid  => DDS_phase_valid,
    m_axis_result_tdata=> DDS_phase_pad
  );
  DDS_phase <= DDS_phase_pad;--(27 downto 0);

DDS_GAIN_TO_32_bit : fp_16_to_32 port map(
    aclk => clk,
    s_axis_a_tvalid => input_Map_inputs_DDS_valid,
    s_axis_a_tdata  => Control_gain,
    m_axis_result_tvalid  => DDS_gain_pad_valid,
    m_axis_result_tdata  => DDS_gain_pad
);

to_fixed_get_DDS_gain:
    float_to_fixed_32bit_to_16_bit port map(
    s_axis_a_tvalid => DDS_gain_pad_valid,
    s_axis_a_tdata  => DDS_gain_pad,
    m_axis_result_tvalid  => DDS_gain_valid,
    m_axis_result_tdata  => DDS_gain
  );

output_Map_inputs_DDS_valid <= DDS_gain_valid and DDS_phase_valid;


end Behavioral;
