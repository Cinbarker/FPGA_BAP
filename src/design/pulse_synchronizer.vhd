library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulse_synchronizer is
    port (  clk_fast    : in std_logic;
            slow_pulse  : in std_logic; 
            sync_pulse  : out std_logic);
end pulse_synchronizer;

architecture Behavioral of pulse_synchronizer is
    signal last_level: std_logic := '0';
    signal sync_detected: boolean := false;
begin
    process(clk_fast)
    begin
        if rising_edge(clk_fast) then
            last_level <= slow_pulse;
            if last_level = '0' and slow_pulse = '1' then
                sync_pulse <= '1'; 
            else
                sync_pulse <= '0';
            end if;
        end if;
    end process;
end Behavioral;
