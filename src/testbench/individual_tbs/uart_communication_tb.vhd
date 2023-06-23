library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

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

        -- Connections to UART pins
        uart_tx             : out std_logic;
        uart_rx             : in std_logic;

        -- Connections to LEDs
        led                 : out std_logic_vector(7 downto 0);

        -- Connections to Control Module
        frequencies         : out custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
        update              : out std_logic;
        polynomial_features : out custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
        extra_feature       : out std_logic_vector(FP_SIZE-1 downto 0);
        magnitude_weights   : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
        phase_weights       : out custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
        phasor_magnitude    : out custom_fp_array(FREQ_DIM-1 downto 0);
        phasor_phase        : out custom_fp_array(FREQ_DIM-1 downto 0);
        model_id            : out std_logic_vector(13 downto 0);

        -- Connections to Pre-processing Module
        amplitude_estimate  : in std_logic_vector(FP_SIZE-1 downto 0)
      );
  end component;

  signal clk: std_logic;
  signal rst_n: std_logic;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic;
  signal led: std_logic_vector(7 downto 0);
  signal frequencies: custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
  signal update: std_logic;
  signal polynomial_features: custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
  signal extra_feature: std_logic_vector(FP_SIZE-1 downto 0);
  signal magnitude_weights: custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal phase_weights: custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
  signal phasor_magnitude: custom_fp_array(FREQ_DIM-1 downto 0);
  signal phasor_phase: custom_fp_array(FREQ_DIM-1 downto 0);
  signal model_id: std_logic_vector(13 downto 0);
  signal amplitude_estimate: std_logic_vector(FP_SIZE-1 downto 0) ;

  constant clock_period: time := 10 ns;
  constant bit_period : time := ((1.0 / real(115200)) * real(1e9)) * 1 ns;
  signal stop_the_clock: boolean;

  signal transmit_data: std_logic_vector(7 downto 0);

  -- Generated model data for testing
type variable_array is array (natural range <>) of std_logic_vector(7 downto 0);
-- frequencies = [402653866, 805307050, 268436138]
constant frequencies_cmds: variable_array(FREQ_DIM*4 downto 0) := ("01100011", "00011000", "00000000", "00000010", "10101010", "00110000", "00000000", "00000010", "10101010", "00010000", "00000000", "00000010", "10101010") ;
-- polynomial_features = [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [2, 2, 2, 2, 2, 2, 2, 2, 2, 2], [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]]
constant polynomial_features_cmds: variable_array(FREQ_DIM*POLY_DIM*2 downto 0) := ("01100100", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000000", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000", "01000010", "00000000") ;
-- extra_feature = [1]
constant extra_feature_cmds: variable_array(2 downto 0) := ("01100101", "00111100", "00000000") ;
-- magnitude_weights = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
constant magnitude_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100110", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000", "00111100", "00000000") ;
-- phase_weights = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
constant phase_weights_cmds: variable_array(EXTRA_DIM*POLY_DIM*2 downto 0) := ("01100111", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110", "00101110", "01100110") ;
-- phasor_magnitude = [1000, 4000, 13000]
constant phasor_magnitude_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101000", "01100011", "11010000", "01101011", "11010000", "01110010", "01011001") ;
-- phasor_phase = [2, 1, 1.5]
constant phasor_phase_cmds: variable_array(FREQ_DIM*2 downto 0) := ("01101001", "01000000", "00000000", "00111100", "00000000", "00111110", "00000000") ;
-- model_id = [1248]
constant model_id_cmds: variable_array(2 downto 0) := ("01101010", "00000100", "11100000") ;





begin

  -- Insert values for generic parameters !!
  uut: uart_communication generic map ( baud          
        => 115200,
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
    amplitude_estimate <= "1001100100010001"; -- 10011001 00010001
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