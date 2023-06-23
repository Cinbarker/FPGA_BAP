-------------------------------------------------------------------------------
-- UART COMMUNICATION
-- NOT IMPLEMENTED:
    -- Flexible FP_SIZE that isn't a multiple of 8
    -- Timeout to return to WAIT_RX_CMD state (watchdog)?
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_types_pkg.all;

entity uart_communication is
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
end uart_communication;

architecture rtl of uart_communication is
    component uart is
        generic (
            baud            : positive;
            clock_frequency : positive
        );
        port (
            -- general
            clk                 : in std_logic;
            reset               : in std_logic;
            data_stream_in      : in std_logic_vector(7 downto 0);
            data_stream_in_stb  : in std_logic;
            data_stream_in_ack  : out std_logic := '0';
            data_stream_out     : out std_logic_vector(7 downto 0);
            data_stream_out_stb : out std_logic;
            tx                  : out std_logic;
            rx                  : in std_logic
        );
    end component;

    -- UART Signals
    signal tx_data      : std_logic_vector(7 downto 0);
    signal tx_data_stb  : std_logic;
    signal tx_data_ack  : std_logic := '0';
    signal rx_data      : std_logic_vector(7 downto 0);
    signal rx_data_stb  : std_logic;

    -- Control Module Signals
    signal reg_frequencies         : custom_fp_array_32_bit(FREQ_DIM-1 downto 0);
    signal reg_update              : std_logic;
    signal reg_polynomial_features : custom_fp_array_2D(FREQ_DIM-1 downto 0, POLY_DIM-1 downto 0);
    signal reg_extra_feature       : std_logic_vector(FP_SIZE-1 downto 0);
    signal reg_magnitude_weights   : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
    signal reg_phase_weights       : custom_fp_array((EXTRA_DIM*POLY_DIM)-1 downto 0);
    signal reg_phasor_magnitude    : custom_fp_array(FREQ_DIM-1 downto 0);
    signal reg_phasor_phase        : custom_fp_array(FREQ_DIM-1 downto 0);
    signal reg_model_id            : std_logic_vector(15 downto 0);

--    signal amplitude_estimate        : std_logic_vector(FP_SIZE-1 downto 0):= "01001000011001010111100100001010";
    constant FP_DATA_BYTES : integer := (FP_SIZE + 8 - 1) / 8;
    signal count_byte : integer range 0 to 4;
    signal original_count_byte : integer range 0 to 4;
    signal count_index : integer;
    signal original_count_index : integer;
    signal count2_index : integer;
    type param_types is (PARAM_FREQUENCIES, PARAM_POLYNOMIAL_FEATURES, PARAM_EXTRA_FEATURE,
                         PARAM_MAGNITUDE_WEIGHTS, PARAM_PHASE_WEIGHTS, PARAM_PHASOR_MAGNITUDE, PARAM_PHASOR_PHASE, PARAM_MODEL_ID, NONE);
    signal parameter : param_types;

    type state_types is (WAIT_RX_CMD, RX_PARAM, SEND_UPDATE, TX_AMPLITUDE, RX_LED);
    signal state : state_types;

begin
    -- Connect uart componenet
    uart_component : uart
    generic map(
        baud                => baud,
        clock_frequency     => clock_frequency
    )
    port map(
        -- general
        clk                 => clk,
        reset               => '0',
        data_stream_in      => tx_data,
        data_stream_in_stb  => tx_data_stb,
        data_stream_in_ack  => tx_data_ack,
        data_stream_out     => rx_data,
        data_stream_out_stb => rx_data_stb,
        tx                  => uart_tx,
        rx                  => uart_rx
    );

    receive : process(clk)
    begin
        if rst_n = '0' then
            -- Initial values
            state <= WAIT_RX_CMD;
            reg_frequencies             <= (others => (others => '0'));
            reg_update                  <= '0';
            reg_polynomial_features     <= (others => (others => (others => '0')));
            reg_extra_feature           <= (others => '0');
            reg_magnitude_weights       <= (others => (others => '0'));
            reg_phase_weights           <= (others => (others => '0'));
            reg_phasor_magnitude        <= (others => (others => '0'));
            reg_phasor_phase            <= (others => (others => '0'));
            reg_model_id                <= (others => '0');
            count_index                 <= 0;
            original_count_index        <= 0;
            count2_index                <= 0;
            count_byte                  <= 0;
            parameter                   <= NONE;
            led                         <= (others => '0');

        elsif rising_edge(clk) then
            -- Default values
            state <= state;
            reg_frequencies             <= reg_frequencies;
            reg_update                  <= '0';
            reg_polynomial_features     <= reg_polynomial_features;
            reg_extra_feature           <= reg_extra_feature;
            reg_magnitude_weights       <= reg_magnitude_weights;
            reg_phase_weights           <= reg_phase_weights;
            reg_phasor_magnitude        <= reg_phasor_magnitude;
            reg_phasor_phase            <= reg_phasor_phase;
            reg_model_id                <= reg_model_id;
            count_index                 <= 0;
            original_count_index        <= 0;
            count2_index                <= 0;
            count_byte                  <= 0;
            parameter                   <= NONE;
            case state is
                when WAIT_RX_CMD =>
                    if rx_data_stb = '1' then   -- If CMD available
                        count_byte <= FP_DATA_BYTES;
                        original_count_byte <= FP_DATA_BYTES;
                        count2_index <= 1;
                        case rx_data is         -- Execute command
                            when "01100001" =>  -- CMD: RX_LED                  [ascii: a]
                                state <= RX_LED;
                            when "01100010" =>  -- CMD: TX_AMPLITUDE            [ascii: b]
                                state <= TX_AMPLITUDE;
                            when "01100011" =>  -- CMD: RX frequencies          [ascii: c]
                                parameter <= PARAM_FREQUENCIES;
                                count_index <= FREQ_DIM;
                                original_count_index <= FREQ_DIM;
                                count_byte <= 4;
                                original_count_byte <= 4;
                                state <= RX_PARAM;
                            when "01100100" =>  -- CMD: RX polynomial_features  [ascii: d]
                                parameter <= PARAM_POLYNOMIAL_FEATURES;
                                count_index <= POLY_DIM;
                                original_count_index <= POLY_DIM;
                                count2_index <= FREQ_DIM;
                                state <= RX_PARAM;
                            when "01100101" =>  -- CMD: RX extra_feature        [ascii: e]
                                parameter <= PARAM_EXTRA_FEATURE;
                                count_index <= 1;
                                original_count_index <= 1;
                                state <= RX_PARAM;
                            when "01100110" =>  -- CMD: RX magnitude_weights    [ascii: f]
                                parameter <= PARAM_MAGNITUDE_WEIGHTS;
                                count_index <= EXTRA_DIM*POLY_DIM;
                                original_count_index <= EXTRA_DIM*POLY_DIM;
                                state <= RX_PARAM;
                            when "01100111" =>  -- CMD: RX phase_weights        [ascii: g]
                                parameter <= PARAM_PHASE_WEIGHTS;
                                count_index <= EXTRA_DIM*POLY_DIM;
                                original_count_index <= EXTRA_DIM*POLY_DIM;
                                state <= RX_PARAM;
                            when "01101000" =>  -- CMD: RX phasor_magnitude     [ascii: h]
                                parameter <= PARAM_PHASOR_MAGNITUDE;
                                count_index <= FREQ_DIM;
                                original_count_index <= FREQ_DIM;
                                state <= RX_PARAM;
                            when "01101001" =>  -- CMD: RX phasor_phase         [ascii: i]
                                parameter <= PARAM_PHASOR_PHASE;
                                count_index <= FREQ_DIM;
                                original_count_index <= FREQ_DIM;
                                state <= RX_PARAM;
                            when "01101010" =>  -- CMD: RX model_id             [ascii: j]
                                parameter <= PARAM_MODEL_ID;
                                count_index <= 1;
                                original_count_index <= 1;
                                count_byte <= 2;
                                original_count_byte <= 2;
                                state <= RX_PARAM;
                            when "01101011" =>  -- CMD: Update Model            [ascii: k]
                                state <= SEND_UPDATE;
                            when others =>      -- Else keep for another CMD
                                state <= WAIT_RX_CMD;
                        end case;
                    else
                        state <= WAIT_RX_CMD;
                    end if;

                when RX_PARAM =>
                    led <= "00100100";
                    count_index             <= count_index;
                    original_count_index    <= original_count_index;
                    count2_index            <= count2_index;
                    count_byte              <= count_byte;
                    original_count_byte     <= original_count_byte;
                    parameter               <= parameter;
                    if count2_index > 0 then
                        if count_index > 0 then
                            if count_byte > 0 then
                                if rx_data_stb = '1' then
                                    case parameter is
                                        when PARAM_FREQUENCIES =>
                                            reg_frequencies(count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_POLYNOMIAL_FEATURES =>
                                            reg_polynomial_features(count2_index-1, count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_EXTRA_FEATURE =>
                                            reg_extra_feature(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_MAGNITUDE_WEIGHTS =>
                                            reg_magnitude_weights(count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_PHASE_WEIGHTS =>
                                            reg_phase_weights(count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_PHASOR_MAGNITUDE =>
                                            reg_phasor_magnitude(count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_PHASOR_PHASE =>
                                            reg_phasor_phase(count_index-1)(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when PARAM_MODEL_ID =>
                                            reg_model_id(((count_byte*8)-1) downto ((count_byte-1)*8)) <= rx_data;
                                        when NONE =>
                                            led <= "11100111";
                                            state <= WAIT_RX_CMD;
                                    end case;
                                    count_byte <= count_byte - 1;
                                    state <= RX_PARAM;
                                end if;
                            else
                                count_index <= count_index - 1;
                                count_byte <= original_count_byte;
                            end if;
                        else
                            count2_index <= count2_index - 1;
                            count_index <= original_count_index;
                            count_byte <= original_count_byte;
                        end if;
                    else
                        state <= WAIT_RX_CMD;
                    end if;

                when SEND_UPDATE =>     -- Send signal to Control Module to update model parameters
                    reg_update <= '1';
                    led <= "11000011";
                    state <= WAIT_RX_CMD;

                when TX_AMPLITUDE =>    -- Send amplitude estimation over UART
                if count_byte > 0 then
                    tx_data_stb <= '1'; -- Request TX
                    tx_data <= amplitude_estimate(((count_byte*8) -1) downto ((count_byte-1)*8)); -- Send sections of data 1 byte at a time
                    if tx_data_ack = '1' then   -- If TX ack received
                        count_byte <= count_byte - 1;
                        tx_data_stb <= '0';
                    end if;
                    state <= TX_AMPLITUDE;
                else
                    state <= WAIT_RX_CMD;
                end if;

                when RX_LED =>
                    if rx_data_stb = '1' then   -- If value available
                        led <= rx_data;         -- Set LEDs
                        state <= WAIT_RX_CMD;
                    else
                        state <= RX_LED;
                    end if;
            end case;
        end if;
    end process;

    frequencies         <= reg_frequencies;
    update              <= reg_update;
    polynomial_features <= reg_polynomial_features;
    extra_feature       <= reg_extra_feature;
    magnitude_weights   <= reg_magnitude_weights;
    phase_weights       <= reg_phase_weights;
    phasor_magnitude    <= reg_phasor_magnitude;
    phasor_phase        <= reg_phasor_phase;
    model_id            <= reg_model_id(13 downto 0);
end rtl;

