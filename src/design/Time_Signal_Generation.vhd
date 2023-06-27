-------------------------------------------------------------------------------
-- TIME SIGNAL GENERATION
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity Time_Signal_Generation is
port(
    clk : in std_logic;
  	reset : in std_logic;
  	input_valid : in std_logic;
  	Control_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0); --16 bit float that represents phase increase
  	Control_Gain : in std_logic_vector(FP_SIZE-1 downto 0); --16 bit float turns into 16 bit signed
  	phase_increase : in std_logic_vector(31 downto 0); -- 32 bit unsigned represents phase increase wehre 2^32 is 2*pi

    single_freq_sig : out std_logic_vector(15 downto 0);
    time_sig_valid: out std_logic
  	);end Time_Signal_Generation;

architecture Behavioral of Time_Signal_Generation is

component Map_inputs_DDS is
port(
    clk: in std_logic;
    input_Map_inputs_DDS_valid : in std_logic;
  	Control_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	DDS_Phase: out  std_logic_vector(31 downto 0);
  	DDS_Gain : out std_logic_vector(15 downto 0);
  	output_Map_inputs_DDS_valid: out std_logic
  	);
end component;

component dds_compiler_0
  Port (
    aclk : in STD_LOGIC;
    s_axis_phase_tvalid : in STD_LOGIC;
    s_axis_phase_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 ) -- 2s complemetn 16 bit
  );
  end component;

  component floating_point_mult_32_bit is
  Port (
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

component X_X_Multiplier is
    Port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    P : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end component;

signal config_data : STD_LOGIC_VECTOR ( 64-1 downto 0 );
signal DDS_Phase: STD_LOGIC_VECTOR(31 downto 0);
signal DDS_Gain: std_logic_vector(15 downto 0);
signal output_Map_inputs_DDS_valid, DDS_output_valid, DDS_output_valid_delayed: std_logic;
signal single_freq_sig_temp, DDS_output: std_logic_vector(15 downto 0);
signal DDS_Phase_padded: std_logic_vector(31 downto 0);
signal DDS_output_padded: std_logic_vector(15 downto 0);

begin

map_inputs_dds1: Map_inputs_DDS port map(
    clk => clk,
    input_Map_inputs_DDS_valid => input_valid,
  	Control_Phase   => Control_Phase,
  	Control_Gain  => Control_Gain,
  	DDS_Phase => DDS_Phase,
  	DDS_Gain   => DDS_Gain,
  	output_Map_inputs_DDS_valid => output_Map_inputs_DDS_valid
  	);

  	DDS_Phase_padded <= DDS_Phase;
  	config_data(31 downto 0) <= phase_increase;
  	config_data(63 downto 32) <= DDS_Phase_padded;

Attach_DDS: dds_compiler_0 Port map (
    aclk =>clk,
    s_axis_phase_tvalid =>output_Map_inputs_DDS_valid,
    s_axis_phase_tdata => config_data,
    m_axis_data_tvalid => DDS_output_valid,
    m_axis_data_tdata =>DDS_output_padded
  );

  DDS_output <= DDS_output_padded(15 downto 0);

multiply_with_gain: X_X_Multiplier
  Port map(

    A => DDS_output,
    B => DDS_gain,
    P => single_freq_sig_temp
  );

DAC_out_validator: process(clk)
begin
    if(rising_edge(clk)) then
    DDS_output_valid_delayed <= DDS_output_valid;
    time_sig_valid <=DDS_output_valid_delayed;
    single_freq_sig <= single_freq_sig_temp;
    end if;
end process;


end Behavioral;
