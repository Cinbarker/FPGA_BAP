library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity usb_communication is
    port (  clk         : in std_logic;     -- System clk
            rst_n       : in std_logic;     -- System rst
            send_data   : in std_logic_vector(15 downto 0);     -- Data sent to output fifo
            data_valid  : in std_logic;     -- Valid signal for input data
            ft_clk      : in std_logic;     -- FT600 clk
            ft_data     : out std_logic_vector(15 downto 0);    -- Data sent to FT600
            ft_wr_n     : out std_logic;    -- FT600 write flag (1 = inactive, 0 = write)
            ft_rd_n     : out std_logic;    -- FT600 read flag (1 = inactive, 0 = read)
            ft_be       : out std_logic_vector(1 downto 0);     -- FT600 byte enable (1 = valid)
            ft_oe       : out std_logic);   -- FT600 output enable (1 = FPGA output, 0 = FT600 output)
    
end usb_communication;

architecture Behavioral of usb_communication is
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

    signal full     : std_logic;
    signal empty    : std_logic;
    signal rst      : std_logic;
    signal enable   : integer := 0;
    signal wr_en    : std_logic := '0';
    signal rd_en    : std_logic := '0';
    
    signal valid : std_logic;
begin
    rst <= NOT(rst_n);
    ft_wr_n <= NOT(valid);
    ft_rd_n <= '1';
    ft_be   <= "11";
    ft_oe   <= '1';
    process(clk)
    begin
        -- The FIFO is picky and needs a 5 cycle reset followed by 5 cycles of not using the FIFO
        if rising_edge(clk) then
            if rst = '1' then
                enable <= 0;
            elsif enable > 10 then
                wr_en <= data_valid;
                rd_en <= '1';
            else
                enable <= enable + 1;
                wr_en <= '0';
                rd_en <= '0';
            end if;
        end if;
    end process;
    ft_fifo: fifo_generator_1  port map(rst     => rst,
                                        wr_clk  => clk,
                                        rd_clk  => ft_clk,
                                        din     => send_data,
                                        wr_en   => wr_en,
                                        rd_en   => rd_en,
                                        dout    => ft_data,
                                        full    => full,
                                        empty   => empty,
                                        valid   => valid);

end Behavioral;
