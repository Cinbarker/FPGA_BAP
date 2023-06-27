-------------------------------------------------------------------------------
-- RAW ADC TO USB STREAM
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.my_types_pkg.all;


entity raw_adc_usb_stream is
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
end raw_adc_usb_stream;

architecture Behavioral of raw_adc_usb_stream is
  
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
   
  signal usb_full       : std_logic;
  signal usb_write      : std_logic;
  signal usb_data       : std_logic_vector(15 downto 0);

  

begin
  led <= "000000" & ft_txe_n & usb_full;
  usb_data <= "00" & adc_data_in;
  

  usb_comm: usb_communication port map( clk        => adc_clk,
                                        rst_n      => rst_n,
                                        usb_data   => usb_data,
                                        usb_write  => '1',
                                        usb_full   => usb_full,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);
                                        



end Behavioral;
