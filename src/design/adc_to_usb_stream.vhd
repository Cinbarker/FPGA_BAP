-------------------------------------------------------------------------------
-- ADC TO USB STREAM
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;


entity adc_to_usb_stream is
    port(   clk                 : in std_logic;
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
            bin_update          : in std_logic;
            bin_extra_feature   : in std_logic_vector(FP_SIZE-1 downto 0);
            bin_model_id        : in std_logic_vector(13 downto 0));
end adc_to_usb_stream;

architecture Behavioral of adc_to_usb_stream is
  component adc_buffer
      port(   clk             : in std_logic;
              rst_n           : in std_logic;
              adc_clk         : in std_logic;
              adc_data_in     : in std_logic_vector(13 downto 0);
              adc_data_out    : out std_logic_vector(13 downto 0);
              data_valid      : out std_logic);
  end component;
  
  component usb_communication
      port (  clk         : in std_logic;
              rst_n       : in std_logic;
              usb_data    : in std_logic_vector(15 downto 0);
              usb_write   : in std_logic;
              usb_full    : out std_logic;
              ft_clk      : in std_logic;
              ft_data     : out std_logic_vector(15 downto 0);
              ft_wr_n     : out std_logic;
              ft_rd_n     : out std_logic;
              ft_be       : out std_logic_vector(1 downto 0);
              ft_oe_n     : out std_logic;
              ft_txe_n    : in std_logic);
  end component;
  signal adc_data_out: std_logic_vector(13 downto 0);
  signal data_valid: std_logic;
  signal send_data: std_logic_vector(15 downto 0);
  
  signal reg_bin_extra_feature   : std_logic_vector(FP_SIZE-1 downto 0);
  signal reg_bin_model_id        : std_logic_vector(13 downto 0);
  
  type data_types is (RAW_ADC, MODEL_ID, EXTRA_FEATURE_B1, EXTRA_FEATURE_B2);
  signal dtype : data_types := RAW_ADC;
  
begin
  led <= adc_data_in(7 downto 0);
  adc_buff: adc_buffer port map( clk          => clk,
                                 rst_n        => rst_n,
                                 adc_clk      => adc_clk,
                                 adc_data_in  => adc_data_in,
                                 adc_data_out => adc_data_out,
                                 data_valid   => data_valid);
  
  usb_comm: usb_communication port map( clk        => adc_clk,
                                        rst_n      => rst_n,
                                        usb_data   => send_data,
                                        usb_write  => '1',
                                        usb_full   => data_valid,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);

  process(clk)
  begin
    if rst_n = '0' then
        dtype <= RAW_ADC;
        send_data <= (others => '0');
    elsif rising_edge(clk) then
        case dtype is
            when RAW_ADC =>
                send_data <= "00" & adc_data_out;
                if bin_update = '1' then
                    reg_bin_extra_feature <= bin_extra_feature;
                    reg_bin_model_id <= bin_model_id;
                    dtype <= MODEL_ID;
                else 
                    dtype <= RAW_ADC;
                end if;
            when MODEL_ID =>
                send_data <= "01" & reg_bin_model_id;
                dtype <= EXTRA_FEATURE_B1;
            when EXTRA_FEATURE_B1 =>
                send_data <= "10" & reg_bin_extra_feature(15 downto 8);
                dtype <= EXTRA_FEATURE_B2;
            when EXTRA_FEATURE_B2 =>
                send_data <= "11" & reg_bin_extra_feature(7 downto 0);
                dtype <= RAW_ADC;
        end case;
    end if;
  end process;
end Behavioral;
