library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.mytypes_pkg.all;

entity uart_communication_tb is
end;

architecture bench of uart_communication_tb is

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
          frequencies         : out all_freq_array;
          update              : out std_logic;
          polynomial_features : out all_feat_array;
          extra_feature       : out std_logic_vector(FP_SIZE-1 downto 0);
          magnitude_weights   : out weight_array;
          phase_weights       : out weight_array;
          phasor_magnitude    : out all_freq_array;
          phasor_phase        : out all_freq_array;
          model_id            : out std_logic_vector(13 downto 0);
          amplitude_estimate  : in std_logic_vector(FP_SIZE-1 downto 0)
      );
  end component;

  signal clk: std_logic;
  signal rst_n: std_logic;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic;
  signal led: std_logic_vector(7 downto 0);
  signal frequencies: all_freq_array;
  signal update: std_logic;
  signal polynomial_features: all_feat_array;
  signal extra_feature: std_logic_vector(FP_SIZE-1 downto 0);
  signal magnitude_weights: weight_array;
  signal phase_weights: weight_array;
  signal phasor_magnitude: all_freq_array;
  signal phasor_phase: all_freq_array;
  signal model_id: std_logic_vector(13 downto 0);
  signal amplitude_estimate: std_logic_vector(FP_SIZE-1 downto 0) ;

  constant clock_period: time := 10 ns;
  constant bit_period : time := ((1.0 / real(115200)) * real(1e9)) * 1 ns;
  signal stop_the_clock: boolean;

  signal transmit_data: std_logic_vector(7 downto 0);

  -- Generated model data for testing
type variable_array is array (natural range <>) of std_logic_vector(7 downto 0);
-- frequencies = [0, 100, 200]
constant frequencies_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01100011", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "01100100", "00000000", "00000000", "00000000", "11001000") ;
-- polynomial_features = [[0, 10, 20, 30, 40, 50, 60, 70, 80, 90], [1, 11, 21, 31, 41, 51, 61, 71, 81, 91], [2, 12, 22, 32, 42, 52, 62, 72, 82, 92]]
constant polynomial_features_cmds: variable_array(FREQ_DIM*POLY_DIM*4 downto 0) := ("01100100", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00001010", "00000000", "00000000", "00000000", "00010100", "00000000", "00000000", "00000000", "00011110", "00000000", "00000000", "00000000", "00101000", "00000000", "00000000", "00000000", "00110010", "00000000", "00000000", "00000000", "00111100", "00000000", "00000000", "00000000", "01000110", "00000000", "00000000", "00000000", "01010000", "00000000", "00000000", "00000000", "01011010", "00000000", "00000000", "00000000", "00000001", "00000000", "00000000", "00000000", "00001011", "00000000", "00000000", "00000000", "00010101", "00000000", "00000000", "00000000", "00011111", "00000000", "00000000", "00000000", "00101001", "00000000", "00000000", "00000000", "00110011", "00000000", "00000000", "00000000", "00111101", "00000000", "00000000", "00000000", "01000111", "00000000", "00000000", "00000000", "01010001", "00000000", "00000000", "00000000", "01011011", "00000000", "00000000", "00000000", "00000010", "00000000", "00000000", "00000000", "00001100", "00000000", "00000000", "00000000", "00010110", "00000000", "00000000", "00000000", "00100000", "00000000", "00000000", "00000000", "00101010", "00000000", "00000000", "00000000", "00110100", "00000000", "00000000", "00000000", "00111110", "00000000", "00000000", "00000000", "01001000", "00000000", "00000000", "00000000", "01010010", "00000000", "00000000", "00000000", "01011100") ;
-- extra_feature = [222]
constant extra_feature_cmds: variable_array(4 downto 0) := ("01100101", "00000000", "00000000", "00000000", "11011110") ;
-- magnitude_weights = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49]
constant magnitude_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*4 downto 0) := ("01100110", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000001", "00000000", "00000000", "00000000", "00000010", "00000000", "00000000", "00000000", "00000011", "00000000", "00000000", "00000000", "00000100", "00000000", "00000000", "00000000", "00000101", "00000000", "00000000", "00000000", "00000110", "00000000", "00000000", "00000000", "00000111", "00000000", "00000000", "00000000", "00001000", "00000000", "00000000", "00000000", "00001001", "00000000", "00000000", "00000000", "00001010", "00000000", "00000000", "00000000", "00001011", "00000000", "00000000", "00000000", "00001100", "00000000", "00000000", "00000000", "00001101", "00000000", "00000000", "00000000", "00001110", "00000000", "00000000", "00000000", "00001111", "00000000", "00000000", "00000000", "00010000", "00000000", "00000000", "00000000", "00010001", "00000000", "00000000", "00000000", "00010010", "00000000", "00000000", "00000000", "00010011", "00000000", "00000000", "00000000", "00010100", "00000000", "00000000", "00000000", "00010101", "00000000", "00000000", "00000000", "00010110", "00000000", "00000000", "00000000", "00010111", "00000000", "00000000", "00000000", "00011000", "00000000", "00000000", "00000000", "00011001", "00000000", "00000000", "00000000", "00011010", "00000000", "00000000", "00000000", "00011011", "00000000", "00000000", "00000000", "00011100", "00000000", "00000000", "00000000", "00011101", "00000000", "00000000", "00000000", "00011110", "00000000", "00000000", "00000000", "00011111", "00000000", "00000000", "00000000", "00100000", "00000000", "00000000", "00000000", "00100001", "00000000", "00000000", "00000000", "00100010", "00000000", "00000000", "00000000", "00100011", "00000000", "00000000", "00000000", "00100100", "00000000", "00000000", "00000000", "00100101", "00000000", "00000000", "00000000", "00100110", "00000000", "00000000", "00000000", "00100111", "00000000", "00000000", "00000000", "00101000", "00000000", "00000000", "00000000", "00101001", "00000000", "00000000", "00000000", "00101010", "00000000", "00000000", "00000000", "00101011", "00000000", "00000000", "00000000", "00101100", "00000000", "00000000", "00000000", "00101101", "00000000", "00000000", "00000000", "00101110", "00000000", "00000000", "00000000", "00101111", "00000000", "00000000", "00000000", "00110000", "00000000", "00000000", "00000000", "00110001") ;
-- phase_weights = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98]
constant phase_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*4 downto 0) := ("01100111", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000010", "00000000", "00000000", "00000000", "00000100", "00000000", "00000000", "00000000", "00000110", "00000000", "00000000", "00000000", "00001000", "00000000", "00000000", "00000000", "00001010", "00000000", "00000000", "00000000", "00001100", "00000000", "00000000", "00000000", "00001110", "00000000", "00000000", "00000000", "00010000", "00000000", "00000000", "00000000", "00010010", "00000000", "00000000", "00000000", "00010100", "00000000", "00000000", "00000000", "00010110", "00000000", "00000000", "00000000", "00011000", "00000000", "00000000", "00000000", "00011010", "00000000", "00000000", "00000000", "00011100", "00000000", "00000000", "00000000", "00011110", "00000000", "00000000", "00000000", "00100000", "00000000", "00000000", "00000000", "00100010", "00000000", "00000000", "00000000", "00100100", "00000000", "00000000", "00000000", "00100110", "00000000", "00000000", "00000000", "00101000", "00000000", "00000000", "00000000", "00101010", "00000000", "00000000", "00000000", "00101100", "00000000", "00000000", "00000000", "00101110", "00000000", "00000000", "00000000", "00110000", "00000000", "00000000", "00000000", "00110010", "00000000", "00000000", "00000000", "00110100", "00000000", "00000000", "00000000", "00110110", "00000000", "00000000", "00000000", "00111000", "00000000", "00000000", "00000000", "00111010", "00000000", "00000000", "00000000", "00111100", "00000000", "00000000", "00000000", "00111110", "00000000", "00000000", "00000000", "01000000", "00000000", "00000000", "00000000", "01000010", "00000000", "00000000", "00000000", "01000100", "00000000", "00000000", "00000000", "01000110", "00000000", "00000000", "00000000", "01001000", "00000000", "00000000", "00000000", "01001010", "00000000", "00000000", "00000000", "01001100", "00000000", "00000000", "00000000", "01001110", "00000000", "00000000", "00000000", "01010000", "00000000", "00000000", "00000000", "01010010", "00000000", "00000000", "00000000", "01010100", "00000000", "00000000", "00000000", "01010110", "00000000", "00000000", "00000000", "01011000", "00000000", "00000000", "00000000", "01011010", "00000000", "00000000", "00000000", "01011100", "00000000", "00000000", "00000000", "01011110", "00000000", "00000000", "00000000", "01100000", "00000000", "00000000", "00000000", "01100010") ;
-- phasor_magnitude = [1000, 2000, 3000]
constant phasor_magnitude_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01101000", "00000000", "00000000", "00000011", "11101000", "00000000", "00000000", "00000111", "11010000", "00000000", "00000000", "00001011", "10111000") ;
-- phasor_phase = [1001, 2002, 3003]
constant phasor_phase_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01101001", "00000000", "00000000", "00000011", "11101001", "00000000", "00000000", "00000111", "11010010", "00000000", "00000000", "00001011", "10111011") ;
-- model_id = [1248]
constant model_id_cmds: variable_array(2 downto 0) := ("01101010", "00000100", "11100000") ;



begin

  -- Insert values for generic parameters !!
  uut: uart_communication generic map ( baud                => 115200,
                                        clock_frequency     => 100000000)
                             port map ( clk                 => clk,
                                        rst_n               => rst_n,
                                        uart_tx             => uart_tx,
                                        uart_rx             => uart_rx,
                                        led                 => led,
                                        frequencies         => frequencies,
                                        update              => update,
                                        polynomial_features => polynomial_features,
                                        extra_feature       => extra_feature,
                                        magnitude_weights   => magnitude_weights,
                                        phase_weights       => phase_weights,
                                        phasor_magnitude    => phasor_magnitude,
                                        phasor_phase        => phasor_phase,
                                        model_id            => model_id,
                                        amplitude_estimate  => amplitude_estimate );

  stimulus: process
  begin

    -- Put initialisation code here

    rst_n <= '1';
    amplitude_estimate <= "10011001000100011010101000101000"; -- 10011001 00010001 10101010 00101000
    transmit_data <= "00000000";
    uart_rx <= '1'; -- UART Idle
    wait for bit_period;

    rst_n <= '0';
    wait for 5 ns;
    rst_n <= '1';
    wait for 5 ns;
    wait for bit_period;
    -- Put test bench stimulus code here

    ------------------------------------------------------------------------------------
    -- Set LEDs to 10101010
    ------------------------------------------------------------------------------------
    -- Send CMD
    transmit_data <= "01100001"; -- CMD: RX_LED [ascii: a]
    uart_rx <= '0'; -- Send start
    wait for bit_period;
    for i in 0 to 7 loop    -- Send CMD
        uart_rx <= transmit_data(i);
        wait for bit_period;
    end loop;
    uart_rx <= '1'; -- Send stop
    wait for bit_period*2;

    -- Send Data
    transmit_data <= "10101010";
    uart_rx <= '0'; -- Send start
    wait for bit_period;
    for i in 0 to 7 loop    -- Send data
        uart_rx <= transmit_data(i);
        wait for bit_period;
    end loop;
    uart_rx <= '1'; -- Send stop
    wait for bit_period*10;

    ------------------------------------------------------------------------------------
    -- Request amplitude estimate
    ------------------------------------------------------------------------------------
    -- Send CMD
    transmit_data <= "01100010";    -- CMD: TX_AMPLITUDE [ascii: b]
    uart_rx <= '0'; -- Send start
    wait for bit_period;
    for i in 0 to 7 loop
        uart_rx <= transmit_data(i);
        wait for bit_period;
    end loop;
    uart_rx <= '1'; -- Send stop
    wait for bit_period*50;

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
    wait for bit_period*50;

    stop_the_clock <= true;
    wait;
  end process;



  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;