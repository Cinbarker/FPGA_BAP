-------------------------------------------------------------------------------
-- MY TYPES PACKAGE
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package my_types_pkg is

--When using this still replace all IP for different float size
--when changing FP size make sure to also change MAP_INPUT_DDS
  constant FP_SIZE :integer := 16;

  type array8 is array (natural range <>) of std_logic_vector(7 downto 0);
  type custom_fp_array is array (natural range <>) of std_logic_vector(FP_SIZE-1 downto 0);
  type custom_fp_array_32_bit is array (natural range <>) of std_logic_vector(32-1 downto 0);
  type custom_fp_array_14_bit is array (natural range <>) of std_logic_vector(14-1 downto 0);
  type custom_fp_array_16_bit is array (natural range <>) of std_logic_vector(16-1 downto 0);
  type custom_array_1_bit is array (natural range <>) of std_logic;
  type int_array is array (natural range <>) of integer range -2**15 to 2**15 -1;


  constant NUM_FREQS : integer := 3;
  -- Vector Vector scalar multiplier only works for 64>ORDER_EXTRA_FEATURE*INPUT_FEATURE_LENGTH
  constant ORDER_EXTRA_FEATURE : integer := 5;
  constant INPUT_FEATURE_LENGTH : integer := 10;
  constant VECTOR_WIDTH : integer := 64; --Max value is 64
  constant ADDER_TREE_DEPTH_SCALAR: integer := 6;
  constant INPUT_SIZE_ADDER_TREE: integer := 2**ADDER_TREE_DEPTH_SCALAR;

  -- Nic's types
  constant POLY_DIM : integer := 10;  -- Order of initial feature vector polynomial
  constant EXTRA_DIM : integer := 5;  -- Amount of times to multiply the initial feature vector with the extra feature
  constant FREQ_DIM : integer := 3;   -- Amount of frequencies used
  constant BIN_SIZE : integer := 4096; -- Size of FFT bin on PC
  constant SETTLING_CYCLES : integer := 50; -- Amount of extra cycles to include in each bin for settling
  type custom_fp_array_2D is array (natural range <>, natural range <>) of std_logic_vector(FP_SIZE-1 downto 0);

end package;

