library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity Vector_Vector_Scalar_multiplier_tb is

end;

architecture bench of Vector_Vector_Scalar_multiplier_tb is

  component Vector_Vector_Scalar_multiplier
      port(
    clk : in std_logic;
    reset : in std_logic;
    input_scalar_mult_valid : std_logic;
  	input_mult_vect_a : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
	input_mult_vect_b : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
  	output_scalar_mult: out std_logic_vector(FP_SIZE-1 downto 0);
  	output_scalar_mult_valid : out std_logic

        );
  end component;

  signal clk, reset: std_logic;
  signal input_mult_vect_a: custom_fp_array(VECTOR_WIDTH -1 downto 0);
  signal input_mult_vect_b: custom_fp_array(VECTOR_WIDTH -1 downto 0);
  signal output_scalar_mult: std_logic_vector(FP_SIZE-1 downto 0);
  signal output_scalar_mult_valid: std_logic;
  signal input_scalar_mult_valid : std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
begin

  uut: Vector_Vector_Scalar_multiplier port map ( clk                => clk,
                                                  reset => reset,
                                                  input_scalar_mult_valid => input_scalar_mult_valid,
                                                  input_mult_vect_a  => input_mult_vect_a,
                                                  input_mult_vect_b  => input_mult_vect_b,
                                                  output_scalar_mult => output_scalar_mult,
                                                  output_scalar_mult_valid => output_scalar_mult_valid );

  stimulus: process
  begin

    -- Put initialisation code here
    reset <= '1';
    input_scalar_mult_valid <= '0';
    for i in VECTOR_WIDTH-1 downto 0 loop
        input_mult_vect_a(i) <= "0000000000000000";--0000000000000000" ;
        input_mult_vect_b(i) <= "0000000000000000";--0000000000000000" ;
    end loop;
       wait for 20ns;
       input_scalar_mult_valid <= '1';
       wait for 100ns;
    -- Put test bench stimulus code here
    for i in VECTOR_WIDTH-1 downto 0 loop

        input_mult_vect_a(i) <= "0100000101010001";--1000100001100110" ;
        input_mult_vect_b(i) <= "0011101111101111";--0011010011010111" ;
    end loop;
    wait for 20 ns;
    reset <= '0';
    input_scalar_mult_valid <= '1';

    wait for 300ns;
    reset <= '1';
    input_scalar_mult_valid <= '1';
    wait for 50 ns;
    reset <= '0';
    input_scalar_mult_valid <= '1';
    wait for 300ns;
    stop_the_clock <= true;

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
