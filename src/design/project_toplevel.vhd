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
        status_led          : out std_logic;
        dac_clk             : out std_logic;
        dac_out             : out std_logic_vector(13 downto 0);
        adc_clk             : in std_logic;
        adc_data_in         : in std_logic_vector(13 downto 0);
        ft_clk              : in std_logic;
        ft_data             : out std_logic_vector(15 downto 0);
        ft_wr_n             : out std_logic;
        ft_rd_n             : out std_logic;
        ft_be               : out std_logic_vector(1 downto 0);
        ft_oe_n             : out std_logic;
        ft_txe_n            : in std_logic);
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
          tx_param            : in std_logic_vector(FP_SIZE-1 downto 0);
          tx_select           : out std_logic_vector(7 downto 0)
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
        feature_gen_state : out std_logic_vector(1 downto 0);

        final_features   : inout  custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
        System_phase : inout std_logic_vector(FP_SIZE-1 downto 0);
        System_gain  : inout std_logic_vector(FP_SIZE-1 downto 0);

        mult_valid_feat: out std_logic;
        sub_valid   : out std_logic_vector(1 downto 0);
        Control_Phase   : out  std_logic_vector(FP_SIZE-1 downto 0);
        Control_Gain : out std_logic_vector(FP_SIZE-1 downto 0);
    	Control_Phasor_valid : out std_logic
  	);
  end component;
  
  component dac_buffer is
    port (  clk     : in std_logic;
            rst_n   : in std_logic;
            dac_clk : in std_logic;
            dac_data: in std_logic_vector(13 downto 0);
            dac_out : out std_logic_vector(13 downto 0));
  end component;
  
  component adc_to_usb_stream
      port( clk                 : in std_logic;
            rst_n               : in std_logic;
            adc_clk             : in std_logic;
            adc_data_in         : in std_logic_vector(13 downto 0);
            ft_clk              : in std_logic;
            ft_data             : out std_logic_vector(15 downto 0);
            ft_wr_n             : out std_logic;
            ft_rd_n             : out std_logic;
            ft_be               : out std_logic_vector(1 downto 0);
            ft_oe_n             : out std_logic;
            ft_txe_n            : in std_logic;
            bin_update          : out std_logic;
            bin_calc_en         : out std_logic;
            bin_extra_feature   : in std_logic_vector(FP_SIZE-1 downto 0);
            bin_model_id        : in std_logic_vector(13 downto 0));
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
  
  signal sub_valid, feature_gen_state  : std_logic_vector(1 downto 0);
  signal mult_valid_feat : std_logic;

  signal final_features   : custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal System_phase :  std_logic_vector(FP_SIZE-1 downto 0);
  signal System_gain  :  std_logic_vector(FP_SIZE-1 downto 0);

  -- comm signals
  signal transmit_data: std_logic_vector(7 downto 0);
  signal tx_param: std_logic_vector(FP_SIZE-1 downto 0);
  signal tx_select: std_logic_vector(7 downto 0);
  
  signal dac_data : std_logic_vector(13 downto 0);
  signal dac_data_long : std_logic_vector(15 downto 0);
  
  signal new_update_latch : std_logic:= '0';
  
  signal bin_size_counter       : integer range 0 to (BIN_SIZE+SETTLING_CYCLES-1);
begin
reset <= NOT(rst_n);
with tx_select select tx_param <=
    gen_frequencies(0)(15 downto 0) when x"01",
    gen_frequencies(1)(15 downto 0) when x"02",
    gen_frequencies(2)(15 downto 0) when x"03",
    gen_frequencies(3)(15 downto 0) when x"04",
    gen_phasor_magnitudes(0)        when x"05",
    gen_phasor_magnitudes(1)        when x"06",
    gen_phasor_magnitudes(2)        when x"07",
    gen_phasor_magnitudes(3)        when x"08",
    gen_phasor_phases(0)            when x"09",
    gen_phasor_phases(1)            when x"10",
    gen_phasor_phases(2)            when x"11",
    gen_phasor_phases(3)            when x"12",
    bin_extra_feature               when x"13",
    "00" & bin_model_id             when x"14",
    new_frequencies(0)(15 downto 0) when x"15",
    new_frequencies(1)(15 downto 0) when x"16",
    new_frequencies(2)(15 downto 0) when x"17",
    new_frequencies(3)(15 downto 0) when x"18",
    new_polynomial_features(0,0)    when x"19",
    new_extra_feature               when x"20",
    new_magnitude_weights(0)        when x"21",
    new_phase_weights(0)            when x"22",
    new_phasor_magnitude(0)         when x"23",
    new_phasor_magnitude(1)         when x"24",
    new_phasor_magnitude(2)         when x"25",
    new_phasor_magnitude(3)         when x"26",
    new_phasor_phase(0)             when x"27",
    new_phasor_phase(1)             when x"28",
    new_phasor_phase(2)             when x"29",
    new_phasor_phase(3)             when x"30",
    "00" & new_model_id             when x"31",
    System_gain                     when x"32",
    System_phase                    when x"33",
    final_features(0)               when x"34",
    x"1234"                         when others;

process(clk)
begin
if rising_edge(clk) then
    if rst_n = '0' then
        new_update_latch <= '0';
    elsif new_update = '1' then
    new_update_latch <= '1';
    else
        new_update_latch <= new_update_latch;
    end if;
end if;
end process;
status_led <= new_update_latch;

dac_clk <= clk;
dac_data <= dac_data_long(15 downto 2);
dac_out <= dac_data;


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
                                        tx_param            => tx_param,
                                        tx_select           => tx_select);
                                        
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
           feature_gen_state       => feature_gen_state,
           mult_valid_feat         => mult_valid_feat,
           sub_valid               => sub_valid,
           Control_Phase           => math_result_phasor_phase,
           Control_Gain            => math_result_phasor_magnitude,
           Control_Phasor_valid    => math_valid);
   
   usb: adc_to_usb_stream port map( clk                 => clk,
                                    rst_n               => rst_n,
                                    adc_clk             => adc_clk,
                                    adc_data_in         => adc_data_in,
                                    ft_clk              => ft_clk,
                                    ft_data             => ft_data,
                                    ft_wr_n             => ft_wr_n,
                                    ft_rd_n             => ft_rd_n,
                                    ft_be               => ft_be,
                                    ft_oe_n             => ft_oe_n,
                                    ft_txe_n            => ft_txe_n,
                                    bin_update          => bin_update,
                                    bin_calc_en         => bin_calc_en,
                                    bin_extra_feature   => bin_extra_feature, --x"1234", -- 18, 52
                                    bin_model_id        => bin_model_id); --"000000" & x"69"); -- 105
           
--  dac_buff: dac_buffer port map (   clk         => clk,
--                                    rst_n       => rst_n,
--                                    dac_clk     => dac_clk,
--                                    dac_data    => dac_data,
--                                    dac_out     => dac_out);
  
end behavioral;
