library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;

entity Map_inputs_DDS_tb is
end Map_inputs_DDS_tb;

architecture Behavioral of Map_inputs_DDS_tb is
    -- Constants
    constant clk_period: time := 10 ns; -- Example value, adjust as needed

    -- Signals
    signal clk: std_logic := '0';
    signal input_Map_inputs_DDS_valid: std_logic := '0';
    signal Control_Phase: std_logic_vector(FP_SIZE-1 downto 0);
    signal Control_Gain: std_logic_vector(FP_SIZE-1 downto 0);
    signal DDS_Phase: std_logic_vector(27 downto 0);
    signal DDS_Gain: std_logic_vector(15 downto 0);
    signal output_Map_inputs_DDS_valid: std_logic;

    -- Component instantiation
    component Map_inputs_DDS is
        port(
            clk: in std_logic;
            input_Map_inputs_DDS_valid : in std_logic;
            Control_Phase   : in  std_logic_vector(FP_SIZE-1 downto 0);
            Control_Gain : in std_logic_vector(FP_SIZE-1 downto 0);
            DDS_Phase: out  std_logic_vector(27 downto 0);
            DDS_Gain : out std_logic_vector(15 downto 0);
            output_Map_inputs_DDS_valid: out std_logic
        );
    end component;

begin
    -- DUT instantiation
    DUT: Map_inputs_DDS
        port map (
            clk => clk,
            input_Map_inputs_DDS_valid => input_Map_inputs_DDS_valid,
            Control_Phase => Control_Phase,
            Control_Gain => Control_Gain,
            DDS_Phase => DDS_Phase,
            DDS_Gain => DDS_Gain,
            output_Map_inputs_DDS_valid => output_Map_inputs_DDS_valid
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
        input_Map_inputs_DDS_valid <= '0';
        Control_Phase <= "0100010111011100"; -- Example value, adjust as needed
        Control_Gain <=  "0100010011001100"; -- Example value, adjust as needed

        wait for 50 ns;
        input_Map_inputs_DDS_valid <= '1';
        wait for 200 ns;
        input_Map_inputs_DDS_valid <= '0';

        wait;
    end process;

end Behavioral;