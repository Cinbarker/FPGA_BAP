library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.my_types_pkg.all;

entity adc_to_usb_stream_tb is
end;

architecture bench of adc_to_usb_stream_tb is

  component adc_to_usb_stream
      port( clk                 : in std_logic;
            rst_n               : in std_logic;
            adc_clk             : in std_logic;
            adc_data_in         : in std_logic_vector(13 downto 0);
            ft_clk              : in std_logic;
            ft_data             : out std_logic_vector(15 downto 0);
            ft_wr_n             : out std_logic;
            ft_rd_n             : out std_logic;
            ft_be               : out std_logic_vector(1 downto 0);
            ft_oe_n             : out std_logic;
            ft_txe_n            : in std_logic;
            led                 : out std_logic_vector(7 downto 0);
            bin_update          : out std_logic;
            bin_calc_en         : out std_logic;
            bin_extra_feature   : in std_logic_vector(FP_SIZE-1 downto 0);
            bin_model_id        : in std_logic_vector(13 downto 0));
  end component;

  signal clk                : std_logic;
  signal rst_n              : std_logic;
  signal adc_clk            : std_logic;
  signal adc_data_in        : std_logic_vector(13 downto 0);
  signal ft_clk             : std_logic;
  signal ft_data            : std_logic_vector(15 downto 0);
  signal ft_wr_n            : std_logic;
  signal ft_rd_n            : std_logic;
  signal ft_be              : std_logic_vector(1 downto 0);
  signal ft_oe_n            : std_logic;
  signal ft_txe_n           : std_logic;
  signal bin_update         : std_logic;
  signal bin_calc_en        : std_logic;
  signal bin_extra_feature  : std_logic_vector(FP_SIZE-1 downto 0);
  signal bin_model_id       : std_logic_vector(13 downto 0);
  
  constant clock_period : time := 10 ns;
  constant adc_clock_period : time := 45 ns;
  constant ft_clock_period : time := 10 ns;
  signal stop_the_clock : boolean;

begin

  stream: adc_to_usb_stream port map( clk                 => clk,
                                    rst_n               => rst_n,
                                    adc_clk             => adc_clk,
                                    adc_data_in         => adc_data_in,
                                    ft_clk              => ft_clk,
                                    ft_data             => ft_data,
                                    ft_wr_n             => ft_wr_n,
                                    ft_rd_n             => ft_rd_n,
                                    ft_be               => ft_be,
                                    ft_oe_n             => ft_oe_n,
                                    ft_txe_n            => ft_txe_n,
                                    bin_update          => bin_update,
                                    bin_calc_en         => bin_calc_en,
                                    bin_extra_feature   => bin_extra_feature,
                                    bin_model_id        => bin_model_id);

  stimulus: process
  begin
    bin_extra_feature <= (others => '0');
    bin_model_id <= (others => '0');
    rst_n <= '0';
    ft_txe_n <= '0';
    wait for adc_clock_period*5;
    rst_n <= '1';
    wait for adc_clock_period*6;
    
    for i in 0 to 3000 loop
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
  
  ft_clocking: process
  begin
    wait for ft_clock_period/4;
    while not stop_the_clock loop
      ft_clk <= '1', '0' after ft_clock_period / 2;
      wait for ft_clock_period;
    end loop;
    wait;
  end process;
end;