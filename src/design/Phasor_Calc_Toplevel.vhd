----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/17/2023 10:47:28 AM
-- Design Name:
-- Module Name: Phasor_Calc_Toplevel - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.my_types_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Phasor_Calc_Toplevel is
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

end Phasor_Calc_Toplevel;

architecture Behavioral of Phasor_Calc_Toplevel is

component Feature_Gen is
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

component System_Phasor_Calc is
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

component Control_Phasor_Generation is
port(
    clk : in std_logic;
    reset : in std_logic;
    input_ready : in std_logic;
  	System_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
	System_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
	input_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
	input_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Phase   : out  std_logic_vector(FP_SIZE-1 downto 0);
	Control_Gain : out std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Phasor_valid : out std_logic);
end component;

signal final_features: custom_fp_array(INPUT_FEATURE_LENGTH*ORDER_EXTRA_FEATURE-1 downto 0);
signal Feature_Gen_Done, output_phasorcalc_ready : std_logic;
signal System_gain, System_phase : std_logic_vector(FP_SIZE-1 downto 0);


begin
Feature_Gen_map: Feature_Gen port map
                ( clk                 => clk,
                  reset               => reset,
                  Generate_Features    => input_Phasor_calc_valid,
                  input_features      => input_features,
                  extra_feature_value => extra_feature_value,
                  final_features     => final_features,
                  Feature_Gen_Done    => Feature_Gen_Done );

System_Phasor_calc_map: System_Phasor_Calc port map
                ( clk                     => clk,
                 reset                   => reset,
                 input_ready             => Feature_Gen_Done,
                 in_features             => final_features,
                 weights_gain            => weights_gain,
                 weights_phase           => weights_phase,
                 System_phase                   => System_phase,
                 System_gain                    => System_gain,
                 output_phasorcalc_ready => output_phasorcalc_ready );

Control_Phasor_Generation_map: Control_Phasor_Generation port map(
                    clk => clk,
                    reset=> reset,
                    input_ready =>output_phasorcalc_ready,
                    System_Phase   => System_phase,
                    System_Gain    => System_gain,
                    input_Phase   => input_phase,
                    input_Gain => input_gain,
                    Control_Phase   => Control_Phase,
                    Control_Gain => Control_Gain,
                    Control_Phasor_valid => Control_Phasor_valid
);


end Behavioral;