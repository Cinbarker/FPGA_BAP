library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity adc_buffer_tb is
end;

architecture bench of adc_buffer_tb is

  component adc_buffer
      port(   clk             : in std_logic;
              rst_n           : in std_logic;
              adc_clk         : in std_logic;
              adc_data_in     : in std_logic_vector(13 downto 0);
              adc_data_out    : out std_logic_vector(13 downto 0);
              data_valid      : out std_logic);
  end component;

  signal clk: std_logic;
  signal rst_n: std_logic;
  signal adc_clk: std_logic;
  signal adc_data_in: std_logic_vector(13 downto 0);
  signal adc_data_out: std_logic_vector(13 downto 0);
  signal data_valid: std_logic;
  
  constant clock_period : time := 10 ns;
  constant adc_clock_period : time := 15 ns;
  signal stop_the_clock : boolean;

begin

  adc_buff: adc_buffer port map ( clk          => clk,
                             rst_n        => rst_n,
                             adc_clk      => adc_clk,
                             adc_data_in  => adc_data_in,
                             adc_data_out => adc_data_out,
                             data_valid   => data_valid );

  stimulus: process
  begin
    rst_n <= '0';
    wait for adc_clock_period*5;
    rst_n <= '1';
    wait for adc_clock_period*6;
    
    for i in 0 to 50 loop
        adc_data_in <= std_logic_vector(to_unsigned(i, adc_data_in'length));
        wait for adc_clock_period;
    end loop;

    wait for adc_clock_period*5;
    stop_the_clock <= TRUE;
    wait;
  end process;
  
  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '1', '0' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;
  
  adc_clocking: process
  begin
    while not stop_the_clock loop
      adc_clk <= '1', '0' after adc_clock_period / 2;
      wait for adc_clock_period;
    end loop;
    wait;
  end process;


end;