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
            bin_update          : out std_logic;
            bin_calc_en         : out std_logic;
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
              adc_data_read   : in std_logic;
              adc_data_empty  : out std_logic;
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
  
  component pulse_synchronizer is
    port (  clk_fast    : in std_logic;
            slow_pulse  : in std_logic; 
            sync_pulse  : out std_logic);
  end component;
   
  signal adc_data_out   : std_logic_vector(13 downto 0);
  signal data_valid     : std_logic;
  signal send_data      : std_logic_vector(15 downto 0);
  signal adc_data_read  : std_logic;
  signal usb_full       : std_logic;
  signal usb_write      : std_logic;
  
  signal reg_bin_update, adc_bin_update : std_logic;
  signal bin_size_counter       : integer range 0 to (BIN_SIZE+SETTLING_CYCLES-1);
  signal reg_bin_extra_feature  : std_logic_vector(FP_SIZE-1 downto 0);
  signal reg_bin_model_id       : std_logic_vector(13 downto 0);
  signal adc_data_empty         : std_logic;
  
  signal last_adc_data_out   : std_logic_vector(13 downto 0);
  
  type data_types is (RAW_ADC, MODEL_ID, EXTRA_FEATURE_B1, EXTRA_FEATURE_B2);
  signal dtype : data_types := RAW_ADC;
  

  
begin
  led <= "0000000" & reg_bin_update;
  
  adc_buff: adc_buffer port map( clk            => clk,
                                 rst_n          => rst_n,
                                 adc_clk        => adc_clk,
                                 adc_data_in    => adc_data_in,
                                 adc_data_out   => adc_data_out,
                                 adc_data_read  => adc_data_read,
                                 adc_data_empty => adc_data_empty,
                                 data_valid     => data_valid);

  usb_comm: usb_communication port map( clk        => clk,
                                        rst_n      => rst_n,
                                        usb_data   => send_data,
                                        usb_write  => usb_write,
                                        usb_full   => usb_full,
                                        ft_clk     => ft_clk,
                                        ft_data    => ft_data,
                                        ft_wr_n    => ft_wr_n,
                                        ft_rd_n    => ft_rd_n,
                                        ft_be      => ft_be,
                                        ft_oe_n    => ft_oe_n,
                                        ft_txe_n   => ft_txe_n);
  sync: pulse_synchronizer port map(    clk_fast    => clk,
                                        slow_pulse  => adc_bin_update,
                                        sync_pulse  => reg_bin_update);
  bin_update <= reg_bin_update;
  process(clk)
  begin
    if rst_n = '0' then
        dtype <= RAW_ADC;
        send_data <= (others => '0');
        adc_data_read <= '0';
    elsif rising_edge(clk) then
        usb_write <= '1';
        case dtype is
            when RAW_ADC =>
                usb_write <= data_valid;
                adc_data_read <= '1';
                send_data <= "00" & adc_data_out;
                if reg_bin_update = '1' then
                    reg_bin_extra_feature <= bin_extra_feature;
                    reg_bin_model_id <= bin_model_id;
                    dtype <= MODEL_ID;
                else 
                    dtype <= RAW_ADC;
                end if;
            when MODEL_ID =>
                adc_data_read <= '0';
                send_data <= "01" & reg_bin_model_id;
                dtype <= EXTRA_FEATURE_B1;
            when EXTRA_FEATURE_B1 =>
                adc_data_read <= '0';
                send_data <= "10" & "000000" & reg_bin_extra_feature(15 downto 8);
                dtype <= EXTRA_FEATURE_B2;
            when EXTRA_FEATURE_B2 =>
                adc_data_read <= '0';
                send_data <= "11" & "000000" & reg_bin_extra_feature(7 downto 0);
                dtype <= RAW_ADC;
        end case;
    end if;
  end process;

  process(adc_clk)
    begin
        if rst_n = '0' then                      
            bin_size_counter    <= 0;
        elsif rising_edge(adc_clk) then
            if bin_size_counter >= BIN_SIZE + SETTLING_CYCLES - 1 then
                adc_bin_update <= '1';
                bin_size_counter <= 0;
            else
                adc_bin_update <= '0';
                bin_size_counter <= bin_size_counter + 1;
            end if;
            if bin_size_counter <= SETTLING_CYCLES then
                bin_calc_en <= '1';
            else
                bin_calc_en <= '0';
            end if;
        end if;
    end process;
end Behavioral;
