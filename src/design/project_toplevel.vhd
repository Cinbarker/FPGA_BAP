library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity project_toplevel is
  Port (clk                 : in std_logic;
        rst_n               : in std_logic;
        uart_rx             : in std_logic;
        uart_tx             : out std_logic;
        led                 : out std_logic_vector(7 downto 0);
        DAC_IN              : out std_logic_vector(15 downto 0)
         );
end project_toplevel;

architecture behavioral of project_toplevel is

component uart_communication
      generic (
          baud                : positive := 115200;
          clock_frequency     : positive := 100000000
      );
      port (  
          clk                 : in std_logic;
          rst_n               : in std_logic;
          uart_tx             : out std_logic;
          uart_rx             : in std_logic;
          led                 : out std_logic_vector(7 downto 0);
          frequencies         : out custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
          update              : out std_logic;
          polynomial_features : out custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
          extra_feature       : out std_logic_vector(FP_SIZE-1 downto 0);
          magnitude_weights   : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          phase_weights       : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
          phasor_magnitude    : out custom_fp_array(FREQ_DIM-1 downto 0);
          phasor_phase        : out custom_fp_array(FREQ_DIM-1 downto 0);
          model_id            : out std_logic_vector(13 downto 0);
          amplitude_estimate  : in std_logic_vector(FP_SIZE-1 downto 0)
      );
  end component;

  component control_module
      port ( 
          clk                     : in std_logic;
          reset                   : in std_logic;
          new_frequencies         : in custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
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
          gen_frequencies              : out custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
          gen_phasor_magnitudes        : out custom_fp_array(FREQ_DIM-1 downto 0);  
          gen_phasor_phases            : out custom_fp_array(FREQ_DIM-1 downto 0);
          bin_update                   : out std_logic;
          bin_extra_feature            : out std_logic_vector(FP_SIZE-1 downto 0);
          bin_model_id                 : out std_logic_vector(13 downto 0)
      );
  end component;
  
  component Multiple_time_signal_generation is
        port(
            clk : in std_logic;
            reset : in std_logic;
            input_valid : in std_logic;
            Control_Phase : in custom_fp_array(NUM_FREQS-1 downto 0);
            Control_Gain : in custom_fp_array(NUM_FREQS-1 downto 0);
            phase_increase : in custom_fp_array_32_bit(NUM_FREQS-1 downto 0);
            DAC_IN : out std_logic_vector(15 downto 0)
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
  -- ctrl signals
  
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
  
  constant clock_period: time := 10 ns;
  constant bit_period : time := ((1.0 / real(115200)) * real(1e9)) * 1 ns;
  signal stop_the_clock : boolean;
  
  -- comm signals
  signal transmit_data: std_logic_vector(7 downto 0);
  signal amplitude_estimate: std_logic_vector(FP_SIZE-1 downto 0);
  
  -- siggen signals

type variable_array is array (natural range <>) of std_logic_vector(7 downto 0);
-- phase_incr = [429496729, 128849018, 214748364]
constant phase_incr_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01100011", "00011001", "10011001", "10011001", "10011001", "00000111", "10101110", "00010100", "01111010", "00001100", "11001100", "11001100", "11001100") ;
-- polynomial_features = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [3, 3, 3, 3, 3, 3, 3, 3, 3, 3], [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]]
constant polynomial_features_cmds: variable_array(FREQ_DIM*POLY_DIM*2 downto 0) := ("01100100", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000001", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000011", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101", "00000000", "00000101") ;
-- extra_feature = [1]
constant extra_feature_cmds: variable_array(2 downto 0) := ("01100101", "00000000", "00000001") ;
-- magnitude_weights = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49]
constant magnitude_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100110", "00000000", "00000000", "00000000", "00000001", "00000000", "00000010", "00000000", "00000011", "00000000", "00000100", "00000000", "00000101", "00000000", "00000110", "00000000", "00000111", "00000000", "00001000", "00000000", "00001001", "00000000", "00001010", "00000000", "00001011", "00000000", "00001100", "00000000", "00001101", "00000000", "00001110", "00000000", "00001111", "00000000", "00010000", "00000000", "00010001", "00000000", "00010010", "00000000", "00010011", "00000000", "00010100", "00000000", "00010101", "00000000", "00010110", "00000000", "00010111", "00000000", "00011000", "00000000", "00011001", "00000000", "00011010", "00000000", "00011011", "00000000", "00011100", "00000000", "00011101", "00000000", "00011110", "00000000", "00011111", "00000000", "00100000", "00000000", "00100001", "00000000", "00100010", "00000000", "00100011", "00000000", "00100100", "00000000", "00100101", "00000000", "00100110", "00000000", "00100111", "00000000", "00101000", "00000000", "00101001", "00000000", "00101010", "00000000", "00101011", "00000000", "00101100", "00000000", "00101101", "00000000", "00101110", "00000000", "00101111", "00000000", "00110000", "00000000", "00110001") ;
-- phase_weights = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98]
constant phase_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100111", "00000000", "00000000", "00000000", "00000010", "00000000", "00000100", "00000000", "00000110", "00000000", "00001000", "00000000", "00001010", "00000000", "00001100", "00000000", "00001110", "00000000", "00010000", "00000000", "00010010", "00000000", "00010100", "00000000", "00010110", "00000000", "00011000", "00000000", "00011010", "00000000", "00011100", "00000000", "00011110", "00000000", "00100000", "00000000", "00100010", "00000000", "00100100", "00000000", "00100110", "00000000", "00101000", "00000000", "00101010", "00000000", "00101100", "00000000", "00101110", "00000000", "00110000", "00000000", "00110010", "00000000", "00110100", "00000000", "00110110", "00000000", "00111000", "00000000", "00111010", "00000000", "00111100", "00000000", "00111110", "00000000", "01000000", "00000000", "01000010", "00000000", "01000100", "00000000", "01000110", "00000000", "01001000", "00000000", "01001010", "00000000", "01001100", "00000000", "01001110", "00000000", "01010000", "00000000", "01010010", "00000000", "01010100", "00000000", "01010110", "00000000", "01011000", "00000000", "01011010", "00000000", "01011100", "00000000", "01011110", "00000000", "01100000", "00000000", "01100010") ;
-- phasor_magnitude = [1000, 4000, 13000]
constant phasor_magnitude_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101000", "00000011", "11101000", "00001111", "10100000", "00110010", "11001000") ;
-- phasor_phase = [3, 2, 1]
constant phasor_phase_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101001", "00000000", "00000011", "00000000", "00000010", "00000000", "00000001") ;
-- model_id = [1248]
constant model_id_cmds: variable_array(2 downto 0) := ("01101010", "00000100", "11100000") ;


begin
reset <= NOT(rst_n);

  -- Insert values for generic parameters !!
  comm: uart_communication generic map ( baud                => 115200,
                                        clock_frequency     => 100000000)
                             port map ( clk                 => clk,
                                        rst_n               => rst_n,
                                        uart_tx             => uart_tx,
                                        uart_rx             => uart_rx,
                                        led                 => led,
                                        frequencies         => new_frequencies,
                                        update              => new_update,
                                        polynomial_features => new_polynomial_features,
                                        extra_feature       => new_extra_feature,
                                        magnitude_weights   => new_magnitude_weights,
                                        phase_weights       => new_phase_weights,
                                        phasor_magnitude    => new_phasor_magnitude,
                                        phasor_phase        => new_phasor_phase,
                                        model_id            => new_model_id,
                                        amplitude_estimate  => amplitude_estimate );
                                        
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

  siggen: Multiple_time_signal_generation
        port map(
            clk => clk,
            reset => reset,
            input_valid => '1',
            Control_Phase => gen_phasor_phases,
            Control_Gain => gen_phasor_magnitudes,
            phase_increase => gen_frequencies,
            DAC_IN => DAC_IN);
      
      math: Phasor_Calc_Toplevel port map ( 
           clk                     => clk,
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
           

end behavioral;
