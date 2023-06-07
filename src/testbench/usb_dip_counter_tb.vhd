library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity usb_dip_counter_tb is
end;

architecture bench of usb_dip_counter_tb is

  component usb_dip_counter
      port( clk         : in std_logic;
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
  end component;

  signal clk: std_logic;
  signal rst_n: std_logic;
  signal dip: std_logic_vector(11 downto 0);
  signal ft_clk: std_logic;
  signal ft_data: std_logic_vector(15 downto 0);
  signal ft_wr_n: std_logic;
  signal ft_rd_n: std_logic;
  signal ft_be: std_logic_vector(1 downto 0);
  signal ft_oe_n: std_logic;
  signal ft_txe_n: std_logic;

  constant clock_period: time := 10 ns;
  constant ft_clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  usb_count: usb_dip_counter port map ( clk        => clk,
                                        rst_n      => rst_n,
                                        dip        => dip,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);
    
  stimulus: process
  begin
    rst_n <= '0';
    ft_txe_n <= '1';
    wait for 3 ns;
    wait for clock_period*6;
    rst_n <= '1';
    wait for clock_period*6;
    
    wait for clock_period*20;
    ft_txe_n <= '1';
    wait for clock_period*20;
    ft_txe_n <= '1';

    --wait for clock_period*1000000;
    --stop_the_clock <= TRUE;
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
    
  ft_clocking: process
  begin
    wait for 3 ns;
    while not stop_the_clock loop
      ft_clk <= '1', '0' after ft_clock_period / 2;
      wait for ft_clock_period;
    end loop;
    wait;
  end process;
end;