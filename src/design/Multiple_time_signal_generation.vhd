-------------------------------------------------------------------------------
-- MULTIPLE TIME SIGNAL GENERATION
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiple_time_signal_generation is port(
    clk : in std_logic;
  	reset : in std_logic;
  	input_valid : in std_logic;
  	Control_Phase   : in  custom_fp_array(NUM_FREQS-1 downto 0);
  	Control_Gain : in custom_fp_array(NUM_FREQS-1 downto 0);
  	phase_increase : in custom_fp_array_32_bit(NUM_FREQS-1 downto 0); -- sent by PC

    DAC_IN : out std_logic_vector(15 downto 0)
  	);
end Multiple_time_signal_generation;

architecture Behavioral of Multiple_time_signal_generation is
component Time_Signal_Generation is
port(
        clk : in std_logic;
  	reset : in std_logic;
  	input_valid : in std_logic;
  	Control_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
  	Control_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
  	phase_increase : in std_logic_vector(31 downto 0); -- sent by PC

    SINGLE_FREQ_SIG : out std_logic_vector(15 downto 0);
    time_sig_valid: out std_logic
  	);end component;

  	component adder_16_bit is
  Port (
    A : in STD_LOGIC_VECTOR ( 15 downto 0 );
    B : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S : out STD_LOGIC_VECTOR ( 16 downto 0 )
  );
  end component;

  component adder_17_bit is
  Port (
    A : in STD_LOGIC_VECTOR ( 16 downto 0 );
    B : in STD_LOGIC_VECTOR ( 16 downto 0 );
    S : out STD_LOGIC_VECTOR ( 17 downto 0 )
  );
  end component;

  	signal single_freq_sig: custom_fp_array_16_bit(NUM_FREQS-1 downto 0);
  	--signal single_freq_sig_VALID: custom_array_1_bit(NUM_FREQS-1 downto 0);
  	signal double_freq_sig1: std_logic_vector(16 downto 0);
  	signal double_freq_sig2: std_logic_vector(16 downto 0);
  	signal quad_freq_sig: std_logic_vector(17 downto 0);
begin

generate_time_sigs: for i in NUM_FREQS-1 downto 0 generate
    add_freq: Time_Signal_Generation port map(
            clk => clk,
            reset => reset,
            input_valid => input_valid,
            Control_Phase => Control_Phase(i),
            Control_Gain => Control_Gain(i),
            phase_increase => phase_increase(i),
            single_freq_sig => single_freq_sig(i)
        );
end generate;

add_freqs1: adder_16_bit port map(
    A => single_freq_sig(0),
    B => single_freq_sig(1),
    S => double_freq_sig1
);
add_freqs2: adder_16_bit port map(
    A => single_freq_sig(2),
    B => "0000000000000000",
    S => double_freq_sig2
);

add_freqs3: adder_17_bit port map(
    A => double_freq_sig1,
    B => double_freq_sig2,
    S => quad_freq_sig
);

DAC_IN <= quad_freq_sig(17 downto 2);

end Behavioral;
