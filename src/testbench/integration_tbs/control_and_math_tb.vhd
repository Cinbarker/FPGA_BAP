library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity control_and_math_tb is
end;

architecture bench of control_and_math_tb is

  component control_module
      port (
          clk                     : in std_logic;
          reset                   : in std_logic;

          new_frequencies         : in custom_fp_array(FREQ_DIM-1 downto 0);
          new_update              : in std_logic;
          new_polynomial_features : in custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
          new_extra_feature       : in std_logic_vector(FP_SIZE-1 downto 0);
          new_magnitude_weights   : in custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          new_phase_weights       : in custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          new_phasor_magnitude    : in custom_fp_array(FREQ_DIM-1 downto 0);
          new_phasor_phase        : in custom_fp_array(FREQ_DIM-1 downto 0);
          new_model_id            : in std_logic_vector(13 downto 0);

          math_start                   : out std_logic;
          math_polynomial_features     : out custom_fp_array(POLY_DIM-1 downto 0);
          math_extra_feature           : out std_logic_vector(FP_SIZE-1 downto 0);
          math_phase_weights           : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          math_magnitude_weights       : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          math_phasor_magnitude        : out std_logic_vector(FP_SIZE-1 downto 0);
          math_phasor_phase            : out std_logic_vector(FP_SIZE-1 downto 0);
          math_result_phasor_magnitude : in std_logic_vector(FP_SIZE-1 downto 0);
          math_result_phasor_phase     : in std_logic_vector(FP_SIZE-1 downto 0);
          math_valid                   : in std_logic;

          gen_frequencies              : out custom_fp_array(FREQ_DIM-1 downto 0);
          gen_phasor_magnitudes        : out custom_fp_array(FREQ_DIM-1 downto 0);
          gen_phasor_phases            : out custom_fp_array(FREQ_DIM-1 downto 0);
          bin_update                   : out std_logic;
          bin_extra_feature            : out std_logic_vector(FP_SIZE-1 downto 0);
          bin_model_id                 : out std_logic_vector(13 downto 0)
      );
  end component;

  component Phasor_Calc_Toplevel
  port(
        clk : in std_logic;
        reset : in std_logic;
        input_Phasor_calc_valid: in std_logic;
        input_features : in   custom_fp_array((POLY_DIM-1) downto 0);
        extra_feature_value : in  std_logic_vector(FP_SIZE-1 downto 0);
        weights_gain : in custom_fp_array(POLY_DIM*EXTRA_DIM-1 downto 0);
        weights_phase : in custom_fp_array(POLY_DIM*EXTRA_DIM-1 downto 0);
        input_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
        input_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
        Control_Phase   : out  std_logic_vector(FP_SIZE-1 downto 0);
        Control_Gain : out std_logic_vector(FP_SIZE-1 downto 0);
    	Control_Phasor_valid : out std_logic
  	);
  end component;

  signal clk                        : std_logic;
  signal reset                      : std_logic;
  signal new_frequencies            : custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
  signal new_update                 : std_logic;
  signal new_polynomial_features    : custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
  signal new_extra_feature          : std_logic_vector(FP_SIZE-1 downto 0);
  signal new_magnitude_weights      : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal new_phase_weights          : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal new_phasor_magnitude       : custom_fp_array(FREQ_DIM-1 downto 0);
  signal new_phasor_phase           : custom_fp_array(FREQ_DIM-1 downto 0);
  signal new_model_id               : std_logic_vector(13 downto 0);
  signal math_start                     : std_logic;
  signal math_polynomial_features       : custom_fp_array(POLY_DIM-1 downto 0);
  signal math_extra_feature             : std_logic_vector(FP_SIZE-1 downto 0);
  signal math_phase_weights             : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal math_magnitude_weights         : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal math_phasor_magnitude          : std_logic_vector(FP_SIZE-1 downto 0);
  signal math_phasor_phase              : std_logic_vector(FP_SIZE-1 downto 0);
  signal math_result_phasor_magnitude   : std_logic_vector(FP_SIZE-1 downto 0);
  signal math_result_phasor_phase       : std_logic_vector(FP_SIZE-1 downto 0);
  signal math_valid                     : std_logic;
  signal gen_frequencies                : custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
  signal gen_phasor_magnitudes          : custom_fp_array(FREQ_DIM-1 downto 0);
  signal gen_phasor_phases              : custom_fp_array(FREQ_DIM-1 downto 0);
  signal bin_update                     : std_logic;
  signal bin_extra_feature              : std_logic_vector(FP_SIZE-1 downto 0);
  signal bin_model_id                   : std_logic_vector(13 downto 0);

  constant clock_period : time := 50 ns;
  signal stop_the_clock : boolean;

begin

  ctrl: control_module port map (clk                          => clk,
                                 reset                        => reset,
                                 new_frequencies              => new_frequencies,
                                 new_update                   => new_update,
                                 new_polynomial_features      => new_polynomial_features,
                                 new_extra_feature            => new_extra_feature,
                                 new_magnitude_weights        => new_magnitude_weights,
                                 new_phase_weights            => new_phase_weights,
                                 new_phasor_magnitude         => new_phasor_magnitude,
                                 new_phasor_phase             => new_phasor_phase,
                                 new_model_id                 => new_model_id,
                                 math_start                   => math_start,
                                 math_polynomial_features     => math_polynomial_features,
                                 math_extra_feature           => math_extra_feature,
                                 math_phase_weights           => math_phase_weights,
                                 math_magnitude_weights       => math_magnitude_weights,
                                 math_phasor_magnitude        => math_phasor_magnitude,
                                 math_phasor_phase            => math_phasor_phase,
                                 math_result_phasor_magnitude => math_result_phasor_magnitude,
                                 math_result_phasor_phase     => math_result_phasor_phase,
                                 math_valid                   => math_valid,
                                 gen_frequencies              => gen_frequencies,
                                 gen_phasor_magnitudes        => gen_phasor_magnitudes,
                                 gen_phasor_phases            => gen_phasor_phases,
                                 bin_update                   => bin_update,
                                 bin_extra_feature            => bin_extra_feature,
                                 bin_model_id                 => bin_model_id);

    math: Phasor_Calc_Toplevel port map ( clk                  => clk,
                                       reset                   => reset,
                                       input_Phasor_calc_valid => math_start,
                                       input_features          => math_polynomial_features,
                                       extra_feature_value     => math_extra_feature,
                                       weights_gain            => math_magnitude_weights,
                                       weights_phase           => math_phase_weights,
                                       input_Phase             => math_phasor_phase,
                                       input_Gain              => math_phasor_magnitude,
                                       Control_Phase           => math_result_phasor_phase,
                                       Control_Gain            => math_result_phasor_magnitude,
                                       Control_Phasor_valid    => math_valid);

  stimulus: process
  begin
    -- Put initialisation code here
    -- Initialize Communication
    new_frequencies <= (others => (others => '1'));
    new_update <= '0';
    new_polynomial_features <= (others => (others => (others => '1')));
    new_extra_feature <= (others => '1');
    new_magnitude_weights <= (others => (others => '1'));
    new_phase_weights <= (others => (others => '1'));
    new_phasor_magnitude <= (others => (others => '1'));
    new_phasor_phase <= (others => (others => '1'));
    new_model_id <= (others => '1');


    reset <= '1';
    wait for clock_period;
    reset <= '0';
    wait for clock_period;

    -- Put test bench stimulus code here

    wait for clock_period*30;

    -- RX new features and weights
    new_update <= '1';
    wait for clock_period;
    new_update <= '0';

    -- Process math
    wait for clock_period*2;

    -- Send new data meanwhile - it should not be processed yet
    new_frequencies <= (others => (others => '0'));
    new_model_id <= (others => '0');

    for i in POLY_DIM*EXTRA_DIM-1 downto 0 loop
        new_magnitude_weights(i) <=  "0100000000000000"; --1000100001100110" ;
        new_phase_weights(i) <= "0110000000000000";--0011010011010111" ;
    end loop;

    for i in FREQ_DIM-1 downto 0 loop
        new_phasor_phase(i) <= "0110000000000000";
        new_phasor_magnitude(i)  <= "0100000101010001";
        for j in POLY_DIM-1 downto 0 loop
            new_polynomial_features(i, j) <= "0011100000000000"; --0011010011010111" ;
        end loop;
    end loop;
    new_extra_feature <= "0011110000000100";

    -- Process math
    wait for clock_period*100;


    -- RX new features and weights
    new_update <= '1';
    wait for clock_period;
    new_update <= '0';

    wait for clock_period*2500;
    stop_the_clock <= TRUE;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '1', '0' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;