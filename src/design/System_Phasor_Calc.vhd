-------------------------------------------------------------------------------
-- SYSTEM PHASOR CALCULATION
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_types_pkg.all;
use ieee.math_real.all;

entity System_Phasor_Calc is
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
end System_Phasor_Calc;

architecture Behavioral of System_Phasor_Calc is

component Vector_Vector_Scalar_multiplier is

    port(
    clk : in std_logic;
    reset : in std_logic;
    input_scalar_mult_valid : in std_logic;
  	input_mult_vect_a : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
	input_mult_vect_b : in custom_fp_array(VECTOR_WIDTH -1 downto 0);
  	output_scalar_mult: out std_logic_vector(FP_SIZE-1 downto 0);
  	output_scalar_mult_valid : out std_logic
      );
end component Vector_Vector_Scalar_multiplier;

signal input_scalar_mult_valid : std_logic;
signal input_mult_vect_a : custom_fp_array(VECTOR_WIDTH -1 downto 0);
signal input_mult_vect_b : custom_fp_array(VECTOR_WIDTH -1 downto 0);
signal output_scalar_mult: std_logic_vector(FP_SIZE-1 downto 0);
signal output_scalar_mult_valid : std_logic;

signal phase_sum, gain_sum: std_logic_vector(FP_SIZE-1 downto 0);
type state is (start, calc_gain,gain_done, calc_phase,phase_done, done);
signal current_state : state ;
signal next_state : state;
signal count : unsigned(4 downto 0);



begin
update_state: process (clk, reset, input_ready)
  begin
  if(reset='1' or input_ready ='0') then
      current_state <= start;

  else
 	if rising_edge(clk) then
		current_state <= next_state;
		if(current_state /= phase_done) then
		count <= count + 1;
		end if;
  	end if;
  	
  	   case (current_state) is
			when start =>
			    input_mult_vect_a(VECTOR_WIDTH-1 downto INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE)<= (others => (others =>'0'));
                input_mult_vect_b(VECTOR_WIDTH-1 downto INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE)<= (others => (others =>'0'));
			    count <= (others=>'0');
                gain_sum <= (others=>'0');
                phase_sum <= (others=>'0');
                input_scalar_mult_valid <= '0';
                next_state <= calc_gain;
                output_phasorcalc_ready <= '0';
                System_phase<=(others=>'0');
                System_gain<=(others=>'0');
    		when calc_gain =>
                  	input_mult_vect_a(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0)<=in_features;
	                input_mult_vect_b(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0)<=weights_gain;
                input_scalar_mult_valid <= '1';
                if(output_scalar_mult_valid = '0')then
                    next_state <= calc_gain;
                else
                    next_state <=gain_done;
                end if;
                output_phasorcalc_ready <= '0';
                System_phase<=(others=>'0');
                System_gain<=(others=>'0');
            when gain_done =>
                    gain_sum <= output_scalar_mult;
                    input_scalar_mult_valid <= '0';
                if(output_scalar_mult_valid = '1')then
                    next_state <= gain_done;
                else
                    next_state <=calc_phase;
                end if;
            when calc_phase =>
                 input_mult_vect_a(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0)<=in_features;
	             input_mult_vect_b(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0)<=weights_phase;
                 input_scalar_mult_valid <= '1';

                if(output_scalar_mult_valid = '0')then
                    next_state <= calc_phase;
                else
                    next_state <=phase_done;
                end if;
                output_phasorcalc_ready <= '0';


            when phase_done =>
                phase_sum <= output_scalar_mult;
                input_scalar_mult_valid <= '1';
                next_state <=done;
                output_phasorcalc_ready <= '0';
                System_phase<=(others=>'0');
                System_gain<=(others=>'0');
            when done =>

                input_scalar_mult_valid <= '0';
                next_state <=done;
                output_phasorcalc_ready <= '1';
                System_phase<=phase_sum;
                System_gain<=gain_sum;
			when others =>
			    input_mult_vect_a(VECTOR_WIDTH-1 downto INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE)<= (others => (others =>'0'));
                input_mult_vect_b(VECTOR_WIDTH-1 downto INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE)<= (others => (others =>'0'));
			    count <= (others=>'0');
                gain_sum <= (others=>'0');
                phase_sum <= (others=>'0');
                input_scalar_mult_valid <= '0';
                next_state <= calc_gain;
                output_phasorcalc_ready <= '0';
                System_phase<=(others=>'0');
                System_gain<=(others=>'0');

		end case;
		
  end if;
  end process update_state;


--  execute_state: process (reset,current_state,count, in_features, weights_gain, weights_phase, output_scalar_mult_valid)
--  begin

--		end process execute_state;

multiplier_feat_weight: Vector_Vector_Scalar_multiplier
		port map(
    clk =>clk,
    reset => reset,
    input_scalar_mult_valid=>input_scalar_mult_valid,
  	input_mult_vect_a=>input_mult_vect_a,
	input_mult_vect_b=>input_mult_vect_b,
  	output_scalar_mult=>output_scalar_mult,
  	output_scalar_mult_valid=>output_scalar_mult_valid
      );

end Behavioral;


