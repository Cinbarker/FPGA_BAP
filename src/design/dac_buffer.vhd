library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity dac_buffer is
    port (  clk     : in std_logic;
            rst_n   : in std_logic;
            dac_clk : in std_logic;
            dac_data: in std_logic_vector(13 downto 0);
            dac_out : out std_logic_vector(13 downto 0));
            
end dac_buffer;

architecture Behavioral of dac_buffer is
 component fifo_generator_2 is
        port (
            rst     : IN STD_LOGIC;
            wr_clk  : IN STD_LOGIC;
            rd_clk  : IN STD_LOGIC;
            din     : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
            wr_en   : IN STD_LOGIC;
            rd_en   : IN STD_LOGIC;
            dout    : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
            valid   : OUT STD_LOGIC);
    end component;
    
  signal rst, valid, rd_en, wr_en : std_logic;
  signal dout, prev_dout  : std_logic_vector(13 downto 0);
  signal enable: integer range 0 to 11 := 0;
  
begin
    rst <= not(rst_n);
    dac_fifo: fifo_generator_2  port map (rst       => rst,
                                          wr_clk    => clk,
                                          rd_clk    => dac_clk,
                                          din       => dac_data,
                                          wr_en     => wr_en,
                                          rd_en     => rd_en,
                                          dout      => dac_out,
                                          valid     => valid);
        
    process (dac_clk)
    begin
        if rising_edge(dac_clk) then
            if rst_n = '0' then
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
end Behavioral;
