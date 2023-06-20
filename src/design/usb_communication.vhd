-------------------------------------------------------------------------------
-- USB COMMUNICATION
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;

entity usb_communication is
    port (  clk         : in std_logic;     -- System clk
            rst_n       : in std_logic;     -- System rst
            usb_data    : in std_logic_vector(15 downto 0);     -- Data sent to output fifo
            usb_write   : in std_logic;     -- Valid signal for input data
            usb_full    : out std_logic;    -- Buffer is full, no data can be written
            ft_clk      : in std_logic;     -- FT600 clk
            ft_data     : out std_logic_vector(15 downto 0);    -- Data sent to FT600
            ft_wr_n     : out std_logic;    -- FT600 write flag (1 = inactive, 0 = write)
            ft_rd_n     : out std_logic;    -- FT600 read flag (1 = inactive, 0 = read)
            ft_be       : out std_logic_vector(1 downto 0);     -- FT600 byte enable (1 = valid)
            ft_oe_n     : out std_logic;    -- FT600 output enable (1 = FPGA outputs data, 0 = FT600 outputs data)
            ft_txe_n    : in std_logic);   -- FT600 Transmit FIFO Empty (1 = FIFO full, 0 = Space available)
            
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
    signal en_count : integer range 0 to 11 := 0;
    signal EN       : std_logic := '0';
    signal rd_en    : std_logic := '0';
    signal wr_en    : std_logic := '0';
    
    signal valid : std_logic;
    
    signal was_full : std_logic := '0';
    signal ft_data_int  : std_logic_vector(15 downto 0);
    signal ft_data_int_reg  : std_logic_vector(15 downto 0);
    signal ft_data_reg  : std_logic_vector(15 downto 0);
begin
    rst <= NOT(rst_n);
    ft_fifo: fifo_generator_1  
        port map(   rst     => rst,
                    wr_clk  => clk,
                    rd_clk  => ft_clk,
                    din     => usb_data,
                    wr_en   => wr_en,
                    rd_en   => rd_en,
                    dout    => ft_data_int,
                    full    => full,
                    empty   => empty,
                    valid   => valid);
    wr_en   <= EN and usb_write and not(full);
    usb_full <= full;
    
    ft_rd_n <= '1';
    ft_be   <= "11";
    ft_oe_n <= '1';
    
    rd_en <= EN and NOT(ft_txe_n) and not(was_full);
    ft_wr_n <= not(EN and NOT(ft_txe_n) and not(empty));
    
    process(ft_clk)
    begin
        -- The FIFO is picky and needs a 5 cycle reset followed by 5 cycles of not using the FIFO
        if rising_edge(ft_clk) then
            ft_data_reg <= ft_data_reg;
            ft_data_int_reg <= ft_data_int;
            if rst_n = '0' then
                en_count <= 0;
                EN <= '0';
            elsif en_count > 10 then
                EN <= '1';
            else
                en_count <= en_count + 1;
                EN <= EN;
            end if;
            
            if ft_txe_n = '0' then
                if was_full = '1' then
                    ft_data <= ft_data_reg;
                    was_full <= '0';
                else 
                    ft_data <= ft_data_int;
                end if;
            else
                if was_full = '0' then
                    ft_data_reg <= ft_data_int_reg;
                end if;
                was_full <= '1';
            end if;
        end if;
    end process;

end Behavioral;
