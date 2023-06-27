library IEEE;
use IEEE.Std_logic_1164.all;
use work.my_types_pkg.all;

entity usb_stream_headers is
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
            led                 : out std_logic_vector(7 downto 0));
end usb_stream_headers;

architecture Behavioral of usb_stream_headers is
   
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
  
  signal bin_update : std_logic;

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
                                    led                 => led,
                                    bin_update          => bin_update,
                                    bin_extra_feature   => x"1234", -- 18, 52
                                    bin_model_id        => "000000" & x"69"); -- 105

end Behavioral;
