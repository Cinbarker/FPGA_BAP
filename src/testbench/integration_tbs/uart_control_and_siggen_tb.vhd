library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity uart_control_and_siggen_tb is
end;
--Thomas git fun number 2
architecture bench of uart_control_and_siggen_tb is

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
  
  constant clock_period: time := 10 ns;
  constant bit_period : time := ((1.0 / real(115200)) * real(1e9)) * 1 ns;
  signal stop_the_clock : boolean;
  
  
    signal bin_size_counter       : integer range 0 to (BIN_SIZE+SETTLING_CYCLES-1);
    signal bin_calc_en : std_logic;
  -- comm signals
  signal transmit_data: std_logic_vector(7 downto 0);
  signal rst_n : std_logic;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic;
  signal led: std_logic_vector(7 downto 0);
  signal amplitude_estimate: std_logic_vector(FP_SIZE-1 downto 0);
  
  -- siggen signals
  signal DAC_IN : std_logic_vector(15 downto 0);
  
type variable_array is array (natural range <>) of std_logic_vector(7 downto 0);
-- frequencies = [402653866, 805307050, 268436138]
constant frequencies_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01100011", "00011000", "00000000", "00000010", "10101010", "00110000", "00000000", "00000010", "10101010", "00010000", "00000000", "00000010", "10101010") ;
-- polynomial_features = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]]
constant polynomial_features_cmds: variable_array(FREQ_DIM*POLY_DIM*2 downto 0) := ("01100100", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000") ;
-- extra_feature = [1]
constant extra_feature_cmds: variable_array(2 downto 0) := ("01100101", "00111100", "00000000") ;
-- magnitude_weights = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93, 96, 99, 102, 105, 108, 111, 114, 117, 120, 123, 126, 129, 132, 135, 138, 141, 144, 147]
constant magnitude_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100110", "00000000", "00000000", "01000010", "00000000", "01000110", "00000000", "01001000", "10000000", "01001010", "00000000", "01001011", "10000000", "01001100", "10000000", "01001101", "01000000", "01001110", "00000000", "01001110", "11000000", "01001111", "10000000", "01010000", "00100000", "01010000", "10000000", "01010000", "11100000", "01010001", "01000000", "01010001", "10100000", "01010010", "00000000", "01010010", "01100000", "01010010", "11000000", "01010011", "00100000", "01010011", "10000000", "01010011", "11100000", "01010100", "00100000", "01010100", "01010000", "01010100", "10000000", "01010100", "10110000", "01010100", "11100000", "01010101", "00010000", "01010101", "01000000", "01010101", "01110000", "01010101", "10100000", "01010101", "11010000", "01010110", "00000000", "01010110", "00110000", "01010110", "01100000", "01010110", "10010000", "01010110", "11000000", "01010110", "11110000", "01010111", "00100000", "01010111", "01010000", "01010111", "10000000", "01010111", "10110000", "01010111", "11100000", "01011000", "00001000", "01011000", "00100000", "01011000", "00111000", "01011000", "01010000", "01011000", "01101000", "01011000", "10000000", "01011000", "10011000") ;
-- phase_weights = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49]
constant phase_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100111", "00000000", "00000000", "00111100", "00000000", "01000000", "00000000", "01000010", "00000000", "01000100", "00000000", "01000101", "00000000", "01000110", "00000000", "01000111", "00000000", "01001000", "00000000", "01001000", "10000000", "01001001", "00000000", "01001001", "10000000", "01001010", "00000000", "01001010", "10000000", "01001011", "00000000", "01001011", "10000000", "01001100", "00000000", "01001100", "01000000", "01001100", "10000000", "01001100", "11000000", "01001101", "00000000", "01001101", "01000000", "01001101", "10000000", "01001101", "11000000", "01001110", "00000000", "01001110", "01000000", "01001110", "10000000", "01001110", "11000000", "01001111", "00000000", "01001111", "01000000", "01001111", "10000000", "01001111", "11000000", "01010000", "00000000", "01010000", "00100000", "01010000", "01000000", "01010000", "01100000", "01010000", "10000000", "01010000", "10100000", "01010000", "11000000", "01010000", "11100000", "01010001", "00000000", "01010001", "00100000", "01010001", "01000000", "01010001", "01100000", "01010001", "10000000", "01010001", "10100000", "01010001", "11000000", "01010001", "11100000", "01010010", "00000000", "01010010", "00100000") ;
-- phasor_magnitude = [1000, 4000, 13000]
constant phasor_magnitude_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101000", "01100011", "11010000", "01101011", "11010000", "01110010", "01011001") ;
-- phasor_phase = [2, 1, 1.5]
constant phasor_phase_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101001", "01000000", "00000000", "00111100", "00000000", "00111110", "00000000") ;
-- model_id = [1248]
constant model_id_cmds: variable_array(2 downto 0) := ("01101010", "00000100", "11100000") ;





begin
rst_n <= NOT(reset);

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
           clk                  => clk,
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
    
    -- Initialize Math


    reset <= '1';
    wait for clock_period;
    reset <= '0';
    wait for clock_period;

    -- Put test bench stimulus code here
    
    wait for clock_period*30;
    
    -- RX new features and weights
    ------------------------------------------------------------------------------------
    -- Change Parameter frequencies
    ------------------------------------------------------------------------------------
    for i in frequencies_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= frequencies_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter polynomial_features
    ------------------------------------------------------------------------------------
    for i in polynomial_features_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= polynomial_features_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter extra_feature
    ------------------------------------------------------------------------------------
    for i in extra_feature_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= extra_feature_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter magnitude_weights
    ------------------------------------------------------------------------------------
    for i in magnitude_weights_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= magnitude_weights_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter phase_weights
    ------------------------------------------------------------------------------------
    for i in phase_weights_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= phase_weights_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter phasor_magnitude
    ------------------------------------------------------------------------------------
    for i in phasor_magnitude_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= phasor_magnitude_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter phasor_phase
    ------------------------------------------------------------------------------------
    for i in phasor_phase_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= phasor_phase_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Change Parameter model_id
    ------------------------------------------------------------------------------------
    for i in model_id_cmds'range(1) loop
        uart_rx <= '0'; -- Send start
        wait for bit_period;
        for j in 0 to 7 loop    
            uart_rx <= model_id_cmds(i)(j);
            wait for bit_period;
        end loop;
        uart_rx <= '1'; -- Send stop
        wait for bit_period*2;
    end loop;
    wait for bit_period*2;
    
    ------------------------------------------------------------------------------------
    -- Send Update Model Command
    ------------------------------------------------------------------------------------
    -- Send CMD
    transmit_data <= "01101011";    -- CMD: Update Model [ascii: k]
    uart_rx <= '0'; -- Send start
    wait for bit_period;
    for i in 0 to 7 loop    
        uart_rx <= transmit_data(i);
        wait for bit_period;
    end loop;
    uart_rx <= '1'; -- Send stop
    
    while math_start = '0' loop
        wait for clock_period;
    end loop;
    
    -- Process math
    wait for clock_period*4;
        
    
    
    wait for clock_period*3000;
    stop_the_clock <= TRUE;
    wait;
  end process;

process(clk)
    begin
        if rst_n = '0' then                      
            bin_size_counter    <= 0;
        elsif rising_edge(clk) then
            if bin_size_counter >= BIN_SIZE + SETTLING_CYCLES - 1 then
                bin_update <= '1';
                bin_size_counter <= 0;
            else
                bin_update <= '0';
                bin_size_counter <= bin_size_counter + 1;
            end if;
            if bin_size_counter <= SETTLING_CYCLES then
                bin_calc_en <= '1';
            else
                bin_calc_en <= '0';
            end if;
        end if;
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