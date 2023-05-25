library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.my_types_pkg.all;

entity Feature_Gen is

  port (
	clk : in std_logic;
	reset : in std_logic;
	Generate_Features: in std_logic;
	input_features : in   custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
	extra_feature_value : in  std_logic_vector(FP_SIZE-1 downto 0);
	final_features   : out  custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
	Feature_Gen_Done : out std_logic
    );
end Feature_Gen;

architecture behavior of Feature_Gen is

  component vector_scalar_multiplier
    port (
    clk : in std_logic;
    input_valid : in STD_LOGIC;
  	input_mult_vect : in custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0); -- partial features
	input_mult1 : in std_logic_vector(FP_SIZE-1 downto 0);
  	output_mult : out custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
  	mult_valid : out std_logic
      );
  end component;

	type state is (idle,start, calc, done);
	signal current_state : state ;
	signal next_state : state;
	signal count, next_count : unsigned(4 downto 0);
	signal input_mult_vect : custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0); -- partial features
	signal input_mult1 : std_logic_vector(FP_SIZE-1 downto 0);                  -- the extra feature
	signal feat_partial : custom_fp_array((INPUT_FEATURE_LENGTH-1) downto 0);
    signal output_features_next: custom_fp_array(INPUT_FEATURE_LENGTH*2*ORDER_EXTRA_FEATURE-1 downto 0);
    signal output_features_temp:  custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
    signal mult_valid: std_logic;

begin

  update_state: process (clk, reset)
  begin
  if(reset='1' or Generate_Features='0') then
    current_state <= idle;
    count <= "00000";
    next_count <= count +1;
    output_features_temp<= (others => (others=>'0'));
  else
 	if rising_edge(clk) and mult_valid='1'  then

		if(current_state /= done) then
		  count <= next_count;
		  next_count <= count + 1;
		  output_features_temp <= output_features_next(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
		else
		  count <= next_count;
		  next_count <= count + 1;
		end if;
		 current_state <= next_state;

  	end if;
  end if;
  end process update_state;


  execute_state: process (reset,count)
  begin
   case (current_state) is
            when idle =>
                next_state <= start;
                Feature_Gen_Done <= '0';


			when start =>

                input_mult_vect <= input_features;
                input_mult1 <= "0011110000000000";--"00111111100000000000000000000000";

                Feature_Gen_Done <= '0';
                next_state <= calc;


    		when calc =>
    		    output_features_next(INPUT_FEATURE_LENGTH*(ORDER_EXTRA_FEATURE+1)-1 downto INPUT_FEATURE_LENGTH) <= output_features_temp;
    		    output_features_next(INPUT_FEATURE_LENGTH-1 downto 0) <= feat_partial;
                input_mult_vect <= feat_partial;
                input_mult1 <= extra_feature_value;


                if(count<ORDER_EXTRA_FEATURE+1)then
                    next_state <= calc;
                else
                    next_state <=done;
                end if;
                Feature_Gen_Done <= '0';

			when done =>
			     final_features <= output_features_temp;
			     Feature_Gen_Done <= '1';
			when others =>


		end case;
		end process execute_state;

uu1: vector_scalar_multiplier port map(
    clk => clk,
    input_valid=>Generate_Features,
    input_mult_vect=>input_mult_vect,
	input_mult1=>input_mult1,
  	output_mult=>feat_partial,
  	mult_valid=>mult_valid);

end behavior;