-------------------------------------------------------------------------------
-- PROJECT TOPLEVEL
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity project_toplevel is
  Port (clk                 : in std_logic;
        rst_n               : in std_logic;
        uart_rx             : in std_logic;
        uart_tx             : out std_logic;
        led                 : out std_logic_vector(7 downto 0);
        dac_clk             : in std_logic;
        dac_out             : out std_logic_vector(13 downto 0));
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
          bin_update                   : in std_logic;
          bin_calc_en                  : in std_logic;
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
  
  component clk_wiz_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  end component;
  
  component dac_buffer is
    port (  clk     : in std_logic;
            rst_n   : in std_logic;
            dac_clk : in std_logic;
            dac_data: in std_logic_vector(13 downto 0);
            dac_out : out std_logic_vector(13 downto 0));
            
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
  signal bin_calc_en                    : std_logic;
  signal bin_extra_feature              : std_logic_vector(FP_SIZE-1 downto 0);
  signal bin_model_id                   : std_logic_vector(13 downto 0);
  
  -- comm signals
  signal transmit_data: std_logic_vector(7 downto 0);
  signal amplitude_estimate: std_logic_vector(FP_SIZE-1 downto 0);
  signal dac_clk_PLL, clock_PLL_locked: std_logic;
  signal dac_data : std_logic_vector(13 downto 0);
  signal dac_data_long : std_logic_vector(15 downto 0);

begin
reset <= NOT(rst_n);
  dac_data <= dac_data_long(15 downto 2);
  -- Insert values for generic parameters !!
  comm: uart_communication generic map ( baud               => 115200,
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
                                 bin_calc_en                  => bin_calc_en,
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
            DAC_IN => dac_data_long);
      
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
           
  DACclock_PLL : clk_wiz_0 port map(
                                        clk_out1 => dac_clk_PLL,
                                        reset => reset,
                                        locked => clock_PLL_locked,
                                        clk_in1 => dac_clk
                                    );
  
  dac_buff: dac_buffer port map (   clk         => clk,
                                    rst_n       => rst_n,
                                    dac_clk     => dac_clk_PLL,
                                    dac_data    => dac_data,
                                    dac_out     => dac_out);
                                    
end behavioral;
