library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;

entity uart_tb is
    generic (
        baud        : positive := 115200;
        clock_hz    : positive := 100000000
    );
end entity;

architecture beh of uart_tb is
    component uart is
        generic (
            baud                : positive;
            clock_frequency     : positive
        );
        port (
            -- general
            clk                 :   in      std_logic;
            reset               :   in      std_logic;
            data_stream_in      :   in      std_logic_vector(7 downto 0);
            data_stream_in_stb  :   in      std_logic;
            data_stream_in_ack  :   out     std_logic := '0';
            data_stream_out     :   out     std_logic_vector(7 downto 0);
            data_stream_out_stb :   out     std_logic;
            tx                  :   out     std_logic;
            rx                  :   in      std_logic
        );
    end component;

    signal local_clock          : std_logic := '0';
    signal local_data           : std_logic_vector(7 downto 0);
    signal local_data_in_stb    : std_logic := '0';
    signal local_data_in_ack    : std_logic := '0';
    signal local_data_out       : std_logic_vector(7 downto 0);
    signal local_data_out_stb   : std_logic;
    signal local_tx             : std_logic;
    signal local_rx             : std_logic;
    signal done                 : boolean := False;

    constant bit_period : time := ((1.0 / real(115200)) * real(1e9)) * 1 ns;
    constant clk_period : time := ((1.0 / real(clock_hz)) * real(1e9)) * 1 ns;
    signal tx_data      : std_logic_vector(7 downto 0):= "00000000";
begin
    ---------------------------------------------------------------------------
    -- LOCAL UART
    ---------------------------------------------------------------------------
    local_uart : uart
    generic map(
        baud                => baud,
        clock_frequency     => clock_hz
    )
    port map(
        -- general
        clk                 => local_clock,
        reset               => '0',
        data_stream_in      => local_data,
        data_stream_in_stb  => local_data_in_stb,
        data_stream_in_ack  => local_data_in_ack,
        data_stream_out     => local_data_out,
        data_stream_out_stb => local_data_out_stb,
        tx                  => local_tx,
        rx                  => local_rx
    );
    ---------------------------------------------------------------------------
    -- GENERATE CLOCK
    ---------------------------------------------------------------------------
    clock_gen : process
    begin
        while not done loop
          local_clock <= not local_clock after clk_period/2;
          wait for clk_period/2;
        end loop;
        wait;
    end process;
    ---------------------------------------------------------------------------
    -- STIMULUS
    ---------------------------------------------------------------------------

    stimulus : process
    begin
        local_rx <= '1'; -- Rx idle
        local_data <= "00000000";
        wait for bit_period*2;

        -- Send message
        local_data_in_stb <= '1';
        local_data <= "01000001";
        while local_data_in_ack = '0' loop
            wait for clk_period;
        end loop;
        local_data_in_stb <= '0';
        wait for bit_period*20;


        -- Send data to uart module
        tx_data <= "10101010";
        local_rx <= '0'; -- Send start
        wait for bit_period;
        for i in 0 to 7 loop    -- Send data
            local_rx <= tx_data(i);
            wait for bit_period;
        end loop;
        local_rx <= '1'; -- Send stop
        while local_data_out_stb = '0' loop
            wait for clk_period;
        end loop;

        wait for bit_period*2;

        done <= true;
        wait;
    end process;

end beh;