library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;

entity usb_dip_counter is
    port(   clk         : in std_logic;
            rst_n       : in std_logic;
            dip         : in std_logic_vector(11 downto 0);
            ft_clk      : in std_logic;
            ft_data     : out std_logic_vector(15 downto 0);
            ft_wr_n     : out std_logic;
            ft_rd_n     : out std_logic;
            ft_be       : out std_logic_vector(1 downto 0);
            ft_oe_n     : out std_logic;
            ft_txe_n    : in std_logic;
            led         : out std_logic_vector(7 downto 0));
end usb_dip_counter;

architecture Behavioral of usb_dip_counter is
  
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

  signal output: integer range 0 to ((2**14) - 1) := 0 ;
  
  signal usb_data: std_logic_vector(15 downto 0);
  signal usb_write: std_logic;
  signal usb_full: std_logic;

begin
  usb_comm: usb_communication port map( clk        => clk,
                                        rst_n      => rst_n,
                                        usb_data   => usb_data,
                                        usb_write  => usb_write,
                                        usb_full   => usb_full,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);

process(clk)
begin
    if rising_edge (clk) then
        usb_write <= '0';
        output <= output;
        if rst_n = '0' then
            usb_write <= '0';
        elsif usb_full = '0' then
            usb_write <= '1';
            output <= output + 1;
        end if;
    end if;
end process;

usb_data <= std_logic_vector(to_unsigned(output, usb_data'length));
led(7) <= usb_full;
led(6) <= ft_txe_n;
led(5 downto 0) <= (others => '0');

end Behavioral;
