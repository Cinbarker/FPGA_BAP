library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity control_module_tb is
end;

architecture bench of control_module_tb is

  component control_module
      port (
            clk                     : in std_logic;
            reset                   : in std_logic;
    
            -- Inputs from Communication
            new_frequencies         : in custom_fp_array_32_bit(FREQ_DIM-1 downto 0); -- Array of frequencies used
            new_update              : in std_logic;
            new_polynomial_features : in custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
            new_extra_feature       : in std_logic_vector(FP_SIZE-1 downto 0);
            new_magnitude_weights   : in custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
            new_phase_weights       : in custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
            new_phasor_magnitude    : in custom_fp_array(FREQ_DIM-1 downto 0);
            new_phasor_phase        : in custom_fp_array(FREQ_DIM-1 downto 0);
            new_model_id            : in std_logic_vector(13 downto 0);
    
            -- Connections to Math Module
            math_start                   : out std_logic;    -- Start pulse to start math, data to math module is valid on this pulse
            math_polynomial_features     : out custom_fp_array(POLY_DIM-1 downto 0);
            math_extra_feature           : out std_logic_vector(FP_SIZE-1 downto 0);
            math_phase_weights           : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
            math_magnitude_weights       : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
            math_phasor_magnitude        : out std_logic_vector(FP_SIZE-1 downto 0);
            math_phasor_phase            : out std_logic_vector(FP_SIZE-1 downto 0);
            math_result_phasor_magnitude : in std_logic_vector(FP_SIZE-1 downto 0);
            math_result_phasor_phase     : in std_logic_vector(FP_SIZE-1 downto 0);
            math_valid                   : in std_logic;
    
            -- Connections to Time Signal Generation
            gen_frequencies       : out custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
            gen_phasor_magnitudes : out custom_fp_array(FREQ_DIM-1 downto 0);
            gen_phasor_phases     : out custom_fp_array(FREQ_DIM-1 downto 0);
    
            bin_update                   : out std_logic;
            bin_extra_feature            : out std_logic_vector(FP_SIZE-1 downto 0);
            bin_model_id                 : out std_logic_vector(13 downto 0)
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

    -- Initialize Math
    math_valid <= '0';
    math_result_phasor_magnitude <= (others => '0');
    math_result_phasor_phase <= (others => '0');

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
    new_frequencies <= (others => (others => '0'));
    new_update <= '0';
    new_polynomial_features <= (others => (others => (others => '0')));
    new_extra_feature <= (others => '0');
    new_magnitude_weights <= (others => (others => '0'));
    new_phase_weights <= (others => (others => '0'));
    new_phasor_magnitude <= (others => (others => '0'));
    new_phasor_phase <= (others => (others => '0'));
    new_model_id <= (others => '0');
    wait for clock_period*2;

    -- Math freq 0 done
    math_result_phasor_magnitude <= std_logic_vector(to_unsigned(1, FP_SIZE));
    math_result_phasor_phase <= std_logic_vector(to_unsigned(1, FP_SIZE));
    math_valid <= '1';
    wait for clock_period;
    math_result_phasor_magnitude <= (others => '0');
    math_result_phasor_phase <= (others => '0');
    math_valid <= '0';

    -- Process math
    wait for clock_period*4;

    -- Math freq 1 done
    math_result_phasor_magnitude <= std_logic_vector(to_unsigned(2, FP_SIZE));
    math_result_phasor_phase <= std_logic_vector(to_unsigned(2, FP_SIZE));
    math_valid <= '1';
    wait for clock_period;
    math_result_phasor_magnitude <= (others => '0');
    math_result_phasor_phase <= (others => '0');
    math_valid <= '0';

    -- Process math
    wait for clock_period*4;

    -- Math freq 2 done
    math_result_phasor_magnitude <= std_logic_vector(to_unsigned(3, FP_SIZE));
    math_result_phasor_phase <= std_logic_vector(to_unsigned(3, FP_SIZE));
    math_valid <= '1';
    wait for clock_period;
    math_result_phasor_magnitude <= (others => '0');
    math_result_phasor_phase <= (others => '0');
    math_valid <= '0';

    wait for clock_period*50;
    -- RX new features and weights
    new_update <= '1';
    wait for clock_period;
    new_update <= '0';

    wait for clock_period*3500;
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