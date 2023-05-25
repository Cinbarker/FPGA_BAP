library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;
entity System_Phasor_Calc_tb is
end;

architecture bench of System_Phasor_Calc_tb is

  component System_Phasor_Calc
  port(
      clk : in std_logic;
      reset : in std_logic;
      input_ready : in std_logic;
    	in_features   : in  custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  	weights_gain : in custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  	weights_phase : in custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
    	System_phase : out std_logic_vector(FP_SIZE-1 downto 0);
    	System_gain  : out std_logic_vector(FP_SIZE-1 downto 0);
    	output_phasorcalc_ready : out std_logic);
  end component;

  signal clk: std_logic;
  signal reset: std_logic;
  signal input_ready: std_logic;
  signal in_features: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal weights_gain: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal weights_phase: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal System_phase: std_logic_vector(FP_SIZE-1 downto 0);
  signal System_gain: std_logic_vector(FP_SIZE-1 downto 0);
  signal output_phasorcalc_ready: std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: System_Phasor_Calc port map ( clk                     => clk,
                                     reset                   => reset,
                                     input_ready             => input_ready,
                                     in_features             => in_features,
                                     weights_gain            => weights_gain,
                                     weights_phase           => weights_phase,
                                     System_phase                   => System_phase,
                                     System_gain                    => System_gain,
                                     output_phasorcalc_ready => output_phasorcalc_ready );

  stimulus: process
  begin

    -- Put initialisation code here
    input_ready <= '0';
    for i in INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0 loop
        weights_gain(i) <=  "0000000000000000";--0000000000000000" ;
        weights_phase(i) <= "0000000000000000";--0000000000000000" ;
       in_features(i) <=    "0000000000000000";--0000000000000000" ;
    end loop;

    reset <= '1';

    -- Put test bench stimulus code here

       wait for 40ns;
       reset <='0';

       wait for 150ns;
       input_ready <= '0';

    for i in INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0 loop
        weights_gain(i) <=  "0100000101010001"; --1000100001100110" ;
        weights_phase(i) <= "0011101111101111";--0011010011010111" ;
        in_features(i)<=    "0011101111101111";--0011010011010111" ;
    end loop;
    wait for 20 ns;
    input_ready <= '1';
    wait for 100 ns;
    reset <= '1';
    wait for 40ns;
    reset <= '0';
    wait for 300 ns;
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
