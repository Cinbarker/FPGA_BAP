library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;


entity Phasor_Calc_Toplevel_tb is
end;

architecture bench of Phasor_Calc_Toplevel_tb is

  component Phasor_Calc_Toplevel
  port(
    clk : in std_logic;
  	reset : in std_logic;
  	input_Phasor_calc_valid: in std_logic;
  	input_features : in   custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  	extra_feature_value : in  std_logic_vector(FP_SIZE-1 downto 0);
    weights_gain : in custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  	weights_phase : in custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
    input_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
  	input_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Phase   : out  std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Gain : out std_logic_vector(FP_SIZE-1 downto 0);
    	Control_Phasor_valid : out std_logic
  	);
  end component;

  signal clk: std_logic;
  signal reset: std_logic;
  signal input_Phasor_calc_valid: std_logic;
  signal input_features: custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  signal extra_feature_value: std_logic_vector(FP_SIZE-1 downto 0);
  signal weights_gain: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal weights_phase: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal input_Phase: std_logic_vector(FP_SIZE-1 downto 0);
  signal input_Gain: std_logic_vector(FP_SIZE-1 downto 0);
  signal Control_Phase: std_logic_vector(FP_SIZE-1 downto 0);
  signal Control_Gain: std_logic_vector(FP_SIZE-1 downto 0);
  signal Control_Phasor_valid: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
begin

  uut: Phasor_Calc_Toplevel port map ( clk                     => clk,
                                       reset                   => reset,
                                       input_Phasor_calc_valid => input_Phasor_calc_valid,
                                       input_features          => input_features,
                                       extra_feature_value     => extra_feature_value,
                                       weights_gain            => weights_gain,
                                       weights_phase           => weights_phase,
                                       input_Phase             => input_Phase,
                                       input_Gain              => input_Gain,
                                       Control_Phase           => Control_Phase,
                                       Control_Gain            => Control_Gain,
                                       Control_Phasor_valid    => Control_Phasor_valid );

  stimulus: process
  begin
    reset <= '1';
    input_Phasor_calc_valid <= '0';
    for i in INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0 loop
        weights_gain(i) <=  "0000000000000000";--0000000000000000" ;
        weights_phase(i) <= "0000000000000000";--0000000000000000" ;
    end loop;

    for i in INPUT_FEATURE_LENGTH-1 downto 0 loop
        input_features(i) <=    "0000000000000000";--0000000000000000" ;
    end loop;

    extra_feature_value <= "0000000000000000";
    input_Phase <= "0000000000000000";--0000000000000000" ;
    input_Gain  <= "0000000000000000";


    -- Put test bench stimulus code here

       wait for 40ns;
       reset <='0';

       wait for 200ns;
       input_Phasor_calc_valid <= '0';

    for i in INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0 loop
        weights_gain(i) <=  x"3C00"; --1 ;
        weights_phase(i) <= x"251E";--0.02 ;

    end loop;
    for i in INPUT_FEATURE_LENGTH-1 downto 0 loop
        input_features(i)<=    x"4200"; --3 ;
    end loop;

    extra_feature_value <= x"3C66"; --1.1
    input_Phase <= x"3C00"; --1 ;
    input_Gain  <= x"70E2"; --10000

    wait for 20 ns;
    input_Phasor_calc_valid <= '1';
    wait for 100 ns;
    reset <= '1';
    wait for 20ns;
    reset <= '0';
    wait for 6500 ns;
    input_Phasor_calc_valid <= '0';
    wait for 100 ns;
    stop_the_clock <= true;
    wait;

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