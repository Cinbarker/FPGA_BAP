library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity usb_communication_tb is
end;

architecture bench of usb_communication_tb is

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
              ft_oe_n     : out std_logic;
              ft_txe_n    : in std_logic);
  end component;

  signal clk: std_logic;
  signal rst_n: std_logic;
  signal send_data: std_logic_vector(15 downto 0);
  signal data_valid: std_logic;
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

  usb_comm: usb_communication port map ( clk        => clk,
                                    rst_n      => rst_n,
                                    send_data  => send_data,
                                    data_valid => data_valid,
                                    ft_clk     => ft_clk,
                                    ft_data    => ft_data,
                                    ft_wr_n    => ft_wr_n,
                                    ft_rd_n    => ft_rd_n,
                                    ft_be      => ft_be,
                                    ft_oe_n    => ft_oe_n,
                                    ft_txe_n   => ft_txe_n);

  stimulus: process
  begin
    data_valid <= '0';
    rst_n <= '0';
    ft_txe_n <= '1';
    wait for clock_period*6;
    rst_n <= '1';
    wait for clock_period*6;
    
    for i in 0 to 20 loop
        send_data <= std_logic_vector(to_unsigned(i, send_data'length));
        data_valid <= '1';
        wait for clock_period;
    end loop;
    data_valid <= '0';
    ft_txe_n   <= '0';
    wait for clock_period*5;
    for i in 21 to 40 loop
        send_data <= std_logic_vector(to_unsigned(i, send_data'length));
        data_valid <= '1';
        wait for clock_period;
    end loop;
    data_valid <= '0';

    wait for clock_period*20;
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
    
  ft_clocking: process
  begin
    wait for 4 ns;
    while not stop_the_clock loop
      ft_clk <= '1', '0' after ft_clock_period / 2;
      wait for ft_clock_period;
    end loop;
    wait;
  end process;
end;