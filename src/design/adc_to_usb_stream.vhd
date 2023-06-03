library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adc_to_usb_stream is
    port(   clk         : in std_logic;
            rst_n       : in std_logic;
            send_data   : in std_logic_vector(15 downto 0);
            data_valid  : in std_logic;
            ft_clk      : in std_logic;
            ft_data     : out std_logic_vector(15 downto 0);
            ft_wr_n     : out std_logic;
            ft_rd_n     : out std_logic;
            ft_be       : out std_logic_vector(1 downto 0);
            ft_oe       : out std_logic);
end adc_to_usb_stream;

architecture Behavioral of adc_to_usb_stream is
  component usb_communication
      port (  clk         : in std_logic;
              rst_n       : in std_logic;
              send_data   : in std_logic_vector(15 downto 0);
              data_valid  : in std_logic;
              ft_clk      : in std_logic;
              ft_data     : out std_logic_vector(15 downto 0);
              ft_wr_n     : out std_logic;
              ft_rd_n     : out std_logic;
              ft_be       : out std_logic_vector(1 downto 0);
              ft_oe       : out std_logic);
  end component;
begin
  usb_comm: usb_communication port map ( clk        => clk,
                                    rst_n      => rst_n,
                                    send_data  => send_data,
                                    data_valid => data_valid,
                                    ft_clk     => ft_clk,
                                    ft_data    => ft_data,
                                    ft_wr_n    => ft_wr_n,
                                    ft_rd_n    => ft_rd_n,
                                    ft_be      => ft_be,
                                    ft_oe      => ft_oe );

end Behavioral;
