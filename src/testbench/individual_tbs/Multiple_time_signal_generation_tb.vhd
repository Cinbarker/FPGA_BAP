library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.my_types_pkg.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiple_time_signal_generation_tb is
end Multiple_time_signal_generation_tb;

architecture Behavioral of Multiple_time_signal_generation_tb is
    -- Constants
    constant clk_period: time := 10 ns; -- Example value, adjust as needed

    -- Signals
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal input_valid : std_logic := '0';
    signal Control_Phase : custom_fp_array(NUM_FREQS-1 downto 0);
    signal Control_Gain : custom_fp_array(NUM_FREQS-1 downto 0);
    signal phase_increase : custom_fp_array_32_bit(NUM_FREQS-1 downto 0);
    signal DAC_IN : std_logic_vector(15 downto 0);

    -- Component instantiations
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

begin
    -- DUT instantiation
    DUT: Multiple_time_signal_generation
        port map(
            clk => clk,
            reset => reset,
            input_valid => input_valid,
            Control_Phase => Control_Phase,
            Control_Gain => Control_Gain,
            phase_increase => phase_increase,
            DAC_IN => DAC_IN
        );

    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop -- Example simulation time, adjust as needed
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Insert test stimuli here
        -- Example:
        reset <= '1';
        wait for 10 ns;
        reset <= '0';

        input_valid <= '1';


        Control_Phase(0) <= "0010101010101010"; -- Example value, adjust as needed
        Control_Phase(1) <= "0010101010101010"; -- Example value, adjust as needed
        Control_Phase(2) <= "1110101010101010"; -- Example value, adjust as needed

        Control_Gain(0) <= "0111111011001100" ; -- Example value, adjust as needed
        Control_Gain(1) <= "1110010011001100" ; -- Example value, adjust as needed
        Control_Gain(2) <= "0011111111111111" ; -- Example value, adjust as needed

        phase_increase(0) <= "00011000000000000000001010101010"; -- Example value, adjust as needed
        phase_increase(1) <= "00010000000000000000001010101010"; -- Example value, adjust as needed
        phase_increase(2) <= "00010000000000000000001010101010"; -- Example value, adjust as needed


        wait for 300 ns;
        input_valid <= '0';
        Control_Phase(1) <= "0010101010101010"; -- Example value, adjust as needed
        Control_Phase(2) <= "0010101010101010"; -- Example value, adjust as needed
        Control_Phase(0) <= "1110101010101010"; -- Example value, adjust as needed

        Control_Gain(1) <= "0111111011001100" ; -- Example value, adjust as needed
        Control_Gain(2) <= "1110010011001100" ; -- Example value, adjust as needed
        Control_Gain(0) <= "0111011111111111" ; -- Example value, adjust as needed

        phase_increase(1) <= "00011000000000000000001010101010"; -- Example value, adjust as needed
        phase_increase(2) <= "00010000000000000000001010101010"; -- Example value, adjust as needed
        phase_increase(0) <= "00010000000000000000001010101010"; -- Example value, adjust as needed


        input_valid <= '1';
        wait for 300 ns;
        wait;
    end process;

end Behavioral;
