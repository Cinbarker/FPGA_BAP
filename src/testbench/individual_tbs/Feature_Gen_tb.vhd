library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity Feature_Gen_tb is
end;

architecture bench of Feature_Gen_tb is

  component Feature_Gen
    port (
  	clk : in std_logic;
  	reset : in std_logic;
  	Generate_Features: in std_logic;
  	input_features : in   custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  	extra_feature_value : in  std_logic_vector(FP_SIZE-1 downto 0);
  	final_features   : out  custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  	Feature_Gen_Done : out std_logic
      );
  end component;

  signal clk: std_logic;
  signal reset: std_logic;
  signal Generate_Features: std_logic;
  signal input_features: custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  signal extra_feature_value: std_logic_vector(FP_SIZE-1 downto 0);
  signal final_features: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
  signal Feature_Gen_Done: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: Feature_Gen port map ( clk                 => clk,
                              reset               => reset,
                              Generate_Features    => Generate_Features,
                              input_features      => input_features,
                              extra_feature_value => extra_feature_value,
                              final_features     => final_features,
                              Feature_Gen_Done    => Feature_Gen_Done );

  stimulus: process
  begin

    -- Put initialisation code here

    reset <= '1';
    Generate_Features    <= '0';

    wait for 100ns;

    input_feature_init : for k in 0 to INPUT_FEATURE_LENGTH-1  loop
        input_features(k) <= "0100000101010000";--0111100001101100";
    end loop input_feature_init;
    extra_feature_value <=   "0011110011000011";--1100100111101111";
    wait for 100ns;
    -- Put test bench stimulus code here
    reset <= '0';
    Generate_Features    <= '1';

    wait for 200ns;
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