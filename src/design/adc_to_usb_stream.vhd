library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adc_to_usb_stream is
    port(   clk         : in std_logic;
            rst_n       : in std_logic;
            adc_clk     : in std_logic;
            adc_data_in : in std_logic_vector(13 downto 0);
            ft_clk      : in std_logic;
            ft_data     : out std_logic_vector(15 downto 0);
            ft_wr_n     : out std_logic;
            ft_rd_n     : out std_logic;
            ft_be       : out std_logic_vector(1 downto 0);
            ft_oe       : out std_logic;
            led         : out std_logic_vector(7 downto 0));
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
  signal usb_full: std_logic;
  signal ft_oe_n: std_logic;
  signal ft_txe_n: std_logic;

begin
send_data <= "00" & adc_data_out;
led <= adc_data_in(7 downto 0);
  adc_buff: adc_buffer port map( clk          => clk,
                                 rst_n        => rst_n,
                                 adc_clk      => adc_clk,
                                 adc_data_in  => adc_data_in,
                                 adc_data_out => adc_data_out,
                                 data_valid   => data_valid );
  
  usb_comm: usb_communication port map( clk        => clk,
                                        rst_n      => rst_n,
                                        usb_data   => send_data,
                                        usb_write  => data_valid,
                                        usb_full   => usb_full,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);

end Behavioral;