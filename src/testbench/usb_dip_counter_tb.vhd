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
  component fifo_generator_1 is
        port (  rst     : IN STD_LOGIC;
                wr_clk  : IN STD_LOGIC;
                rd_clk  : IN STD_LOGIC;
                din     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
                wr_en   : IN STD_LOGIC;
                rd_en   : IN STD_LOGIC;
                dout    : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
                full    : OUT STD_LOGIC;
                empty   : OUT STD_LOGIC;
                valid   : OUT STD_LOGIC);
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
  
   signal rst: std_logic;
   signal x_clk: std_logic;
   constant x_clock_period: time := 5 ns;
   signal ft_wr: std_logic;
   signal ft_rd: std_logic;
   signal ft_empty: std_logic;
   signal ft_valid: std_logic;
   signal final_out: STD_LOGIC_VECTOR(15 DOWNTO 0);
   signal i: integer := 0;
begin
  rst <= NOT(rst_n);
  ft_wr <= not(ft_wr_n);
  
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
  ft_600: fifo_generator_1  
        port map(   rst     => rst,
                    wr_clk  => ft_clk,
                    rd_clk  => x_clk,
                    din     => ft_data,
                    wr_en   => ft_wr,
                    rd_en   => ft_rd,
                    dout    => final_out,
                    full    => ft_txe_n,
                    empty   => ft_empty,
                    valid   => ft_valid);
                    
  stimulus: process
  begin
    rst_n <= '0';
    ft_rd <= '0';
    wait for 3 ns;
    wait for clock_period*6;
    rst_n <= '1';
    wait for clock_period*6;
    
    wait for clock_period*1100;
    ft_rd <= '1';
    
    wait for clock_period*1100;
    ft_rd <= '0';
    
    wait for clock_period*1100;
    ft_rd <= '1';
    --wait for clock_period*1000000;
    --stop_the_clock <= TRUE;
    wait;
  end process;
  
  output_check: process
  begin
    i <= 11;
    while true loop
        wait until rising_edge(x_clk);
        if i = 16384 then
            i <= 0;
        end if;
        if ft_rd = '1' and ft_valid = '1' then
            wait for 1 ns;
            if final_out = std_logic_vector(to_unsigned(i, final_out'length)) then
                i <= i + 1;
            end if;
            assert final_out = std_logic_vector(to_unsigned(i, final_out'length)) 
                report "Mismatch at index " & integer'image(i) 
                severity error;
        end if;
    end loop;
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

x_clocking: process
  begin
    wait for 2 ns;
    while not stop_the_clock loop
      x_clk <= '1', '0' after x_clock_period / 2;
      wait for x_clock_period;
    end loop;
    wait;
  end process;
  
end;