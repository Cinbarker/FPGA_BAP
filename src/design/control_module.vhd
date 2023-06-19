-------------------------------------------------------------------------------
-- CONTROL MODULE
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity control_module is
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
end control_module;

architecture Behavioral of control_module is

type math_states is (WAIT_UPDATE, QUEUE_MATH, EXECUTE_MATH, RX_MATH, SAVE_PARAMS);
signal state : math_states;

signal bin_size_counter : integer range 0 to (BIN_SIZE+SETTLING_CYCLES-1);

signal current_freq : integer range 0 to (FREQ_DIM-1); -- Which frequency to calculate for

-- Register signals to maintain output
signal reg_math_polynomial_features     : custom_fp_array(POLY_DIM-1 downto 0);
signal reg_math_extra_feature           : std_logic_vector(FP_SIZE-1 downto 0);
signal reg_math_phase_weights           : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
signal reg_math_magnitude_weights       : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
signal reg_math_phasor_magnitude        : std_logic_vector(FP_SIZE-1 downto 0);
signal reg_math_phasor_phase            : std_logic_vector(FP_SIZE-1 downto 0);

signal reg_all_math_polynomial_features : custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
signal reg_all_math_phasor_magnitude    : custom_fp_array(FREQ_DIM-1 downto 0);
signal reg_all_math_phasor_phase        : custom_fp_array(FREQ_DIM-1 downto 0);

signal reg_gen_frequencies          : custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
signal reg_gen_phasor_magnitudes    : custom_fp_array(FREQ_DIM-1 downto 0);
signal reg_gen_phasor_phases        : custom_fp_array(FREQ_DIM-1 downto 0);
signal reg_bin_extra_feature        : std_logic_vector(FP_SIZE-1 downto 0);
signal reg_bin_model_id             : std_logic_vector(13 downto 0);

signal reg_next_gen_frequencies        : custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
signal reg_next_gen_phasor_magnitudes  : custom_fp_array(FREQ_DIM-1 downto 0);
signal reg_next_gen_phasor_phases      : custom_fp_array(FREQ_DIM-1 downto 0);
signal reg_next_bin_extra_feature      : std_logic_vector(FP_SIZE-1 downto 0);
signal reg_next_bin_model_id           : std_logic_vector(13 downto 0);

begin

process(clk, reset)
begin
    if reset = '1' then
        -- Reset values
        state               <= WAIT_UPDATE;
        bin_size_counter    <= 0;
        current_freq        <= 0;

        math_start          <= '0';
        reg_math_polynomial_features    <= (others => (others => '0'));
        reg_math_extra_feature          <= (others => '0');
        reg_math_phase_weights          <= (others => (others => '0'));
        reg_math_magnitude_weights      <= (others => (others => '0'));
        reg_math_phasor_magnitude       <= (others => '0');
        reg_math_phasor_phase           <= (others => '0');



        reg_gen_frequencies             <= (others => (others => '0'));
        reg_gen_phasor_magnitudes       <= (others => (others => '0'));
        reg_gen_phasor_phases           <= (others => (others => '0'));
        reg_bin_extra_feature           <= (others => '0');
        reg_bin_model_id                <= (others => '0');

        reg_next_gen_frequencies        <= (others => (others => '0'));
        reg_next_gen_phasor_magnitudes  <= (others => (others => '0'));
        reg_next_gen_phasor_phases      <= (others => (others => '0'));
        reg_next_bin_extra_feature      <= (others => '0');
        reg_next_bin_model_id           <= (others => '0');

        gen_frequencies                 <= (others => (others => '0'));
        gen_phasor_magnitudes           <= (others => (others => '0'));
        gen_phasor_phases               <= (others => (others => '0'));
        bin_extra_feature               <= (others => '0');
        bin_model_id                    <= (others => '0');

    elsif rising_edge(clk) then
        -- Default values
        state                           <= state;
        math_start                      <= '0';
        reg_math_polynomial_features    <= reg_math_polynomial_features;
        reg_math_extra_feature          <= reg_math_extra_feature;
        reg_math_phase_weights          <= reg_math_phase_weights;
        reg_math_magnitude_weights      <= reg_math_magnitude_weights;
        reg_math_phasor_magnitude       <= reg_math_phasor_magnitude;
        reg_math_phasor_phase           <= reg_math_phasor_phase;
        current_freq                    <= current_freq;
        reg_gen_frequencies         <= reg_gen_frequencies;
        reg_gen_phasor_magnitudes   <= reg_gen_phasor_magnitudes;
        reg_gen_phasor_phases       <= reg_gen_phasor_phases;
        reg_bin_extra_feature       <= reg_bin_extra_feature;
        reg_bin_model_id            <= reg_bin_model_id;

        case state is
            when WAIT_UPDATE =>
                if new_update = '1' then
                    -- RX latest outputs from Communication
                    reg_all_math_polynomial_features    <= new_polynomial_features;
                    reg_math_extra_feature              <= new_extra_feature;
                    reg_math_phase_weights              <= new_phase_weights;
                    reg_math_magnitude_weights          <= new_magnitude_weights;
                    reg_all_math_phasor_magnitude       <= new_phasor_magnitude;
                    reg_all_math_phasor_phase           <= new_phasor_phase;

                    reg_next_gen_frequencies     <= new_frequencies;
                    reg_next_bin_extra_feature   <= new_extra_feature;
                    reg_next_bin_model_id        <= new_model_id;
                    -- Start math
                    state <= QUEUE_MATH;
                end if;
            when QUEUE_MATH =>
                if bin_size_counter <= SETTLING_CYCLES then
                    current_freq <= 0; -- Start by updating 0th frequency
                    state <= EXECUTE_MATH;
                else
                    state <= QUEUE_MATH;
                end if;
            when EXECUTE_MATH =>    -- Send start pulse and params to math module
                math_start <= '1';
                for i in POLY_DIM-1 downto 0 loop
                    reg_math_polynomial_features(i) <= reg_all_math_polynomial_features(current_freq, i);
                end loop;
                reg_math_phasor_magnitude       <= reg_all_math_phasor_magnitude(current_freq);
                reg_math_phasor_phase           <= reg_all_math_phasor_phase(current_freq);
                state <= RX_MATH;
            when RX_MATH =>
                if math_valid = '1' then
                    math_start <= '0';
                    reg_next_gen_phasor_magnitudes(current_freq) <= math_result_phasor_magnitude;
                    reg_next_gen_phasor_phases(current_freq) <= math_result_phasor_phase;
                    if current_freq = (FREQ_DIM-1) then
                        state <= SAVE_PARAMS;
                    else
                        current_freq <= current_freq + 1;   -- Increment frequency to update for
                        state <= EXECUTE_MATH;
                    end if;
                else
                    math_start <= '1';
                    state <= RX_MATH;
                end if;
            when SAVE_PARAMS =>
                reg_gen_frequencies         <= reg_next_gen_frequencies;
                reg_gen_phasor_magnitudes   <= reg_next_gen_phasor_magnitudes;
                reg_gen_phasor_phases       <= reg_next_gen_phasor_phases;
                reg_bin_extra_feature       <= reg_next_bin_extra_feature;
                reg_bin_model_id            <= reg_next_bin_model_id;
                state <= WAIT_UPDATE;
         end case;

        -- Bin counter
        if bin_size_counter >= BIN_SIZE+SETTLING_CYCLES-1 then
            bin_update              <= '1';
            bin_size_counter        <= 0;
            gen_frequencies         <= reg_next_gen_frequencies;
            gen_phasor_magnitudes   <= reg_next_gen_phasor_magnitudes;
            gen_phasor_phases       <= reg_next_gen_phasor_phases;
            bin_extra_feature       <= reg_next_bin_extra_feature;
            bin_model_id            <= reg_next_bin_model_id;
        else
            bin_update <= '0';
            bin_size_counter <= bin_size_counter + 1;
        end if;
    end if;
end process;

math_polynomial_features    <= reg_math_polynomial_features;
math_extra_feature          <= reg_math_extra_feature;
math_phase_weights          <= reg_math_phase_weights;
math_magnitude_weights      <= reg_math_magnitude_weights;
math_phasor_magnitude       <= reg_math_phasor_magnitude;
math_phasor_phase           <= reg_math_phasor_phase;


end Behavioral;
