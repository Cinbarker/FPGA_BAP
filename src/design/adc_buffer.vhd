library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adc_buffer is
    port(   clk             : in std_logic;
            rst_n           : in std_logic;
            adc_clk         : in std_logic;
            adc_data_in     : in std_logic_vector(13 downto 0);
            adc_data_out    : out std_logic_vector(13 downto 0);
            data_valid      : out std_logic);
end adc_buffer;

architecture Behavioral of adc_buffer is
    component fifo_generator_0 is
        port (
        rst     : IN STD_LOGIC;
        wr_clk  : IN STD_LOGIC;
        rd_clk  : IN STD_LOGIC;
        din     : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
        wr_en   : IN STD_LOGIC;
        rd_en   : IN STD_LOGIC;
        dout    : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
        full    : OUT STD_LOGIC;
        empty   : OUT STD_LOGIC;
        valid   : OUT STD_LOGIC
      );
    end component;

    signal full: std_logic;
    signal empty: std_logic;
    signal rst: std_logic;
    signal enable: integer := 0;
    signal wr_en: std_logic := '0';
    signal rd_en: std_logic := '0';
begin
rst <= NOT(rst_n);
    process(adc_clk)
    begin
        -- The FIFO is picky and needs a >=5 cycle reset followed by 5 cycles of not using the FIFO
        if rising_edge(adc_clk) then
            if rst = '1' then
                enable <= 0;
            elsif enable > 10 then
                wr_en <= '1';
                rd_en <= '1';
            else
                enable <= enable + 1;
                wr_en <= '0';
                rd_en <= '0';
            end if;
        end if;
    end process;
    adc_fifo: fifo_generator_0  port map (rst       => rst,
                                          wr_clk    => adc_clk,
                                          rd_clk    => clk,
                                          din       => adc_data_in,
                                          wr_en     => wr_en,
                                          rd_en     => rd_en,
                                          dout      => adc_data_out,
                                          full      => full,
                                          empty     => empty,
                                          valid     => data_valid);
                                          
end Behavioral;
