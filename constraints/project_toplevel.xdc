# clk => 100 MHz
create_clock -period 10.000 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
create_clock -period 10.000 -name clk_dac -waveform {0.000 5.000} [get_ports dac_clk]

set_output_delay -max -clock clk_dac 9  [get_ports dac_out]
set_output_delay -min -clock clk_dac -1.5  [get_ports dac_out]
set_multicycle_path -setup -from [get_clocks clk_dac] -to [get_ports dac_out] 2

set_false_path -from [get_clocks clk_0] -to [get_clocks clk_dac]
set_false_path -from [get_ports rst_n]
set_false_path -to [get_ports led]
set_false_path -to [get_ports uart_tx]
set_false_path -from [get_ports uart_rx]

set_property PACKAGE_PIN N14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN P6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

set_property PACKAGE_PIN K13 [get_ports {led[0]}]
set_property PACKAGE_PIN K12 [get_ports {led[1]}]
set_property PACKAGE_PIN L14 [get_ports {led[2]}]
set_property PACKAGE_PIN L13 [get_ports {led[3]}]
set_property PACKAGE_PIN M16 [get_ports {led[4]}]
set_property PACKAGE_PIN M14 [get_ports {led[5]}]
set_property PACKAGE_PIN M12 [get_ports {led[6]}]
set_property PACKAGE_PIN N16 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports led]

set_property PACKAGE_PIN T7 [get_ports uart_tx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]

set_property PACKAGE_PIN T8 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]

set_property PACKAGE_PIN F4 [get_ports dac_clk]
set_property IOSTANDARD LVCMOS33 [get_ports dac_clk]

set_property PACKAGE_PIN C4 [get_ports {dac_out[0]}]
set_property PACKAGE_PIN E3 [get_ports {dac_out[1]}]
set_property PACKAGE_PIN D3 [get_ports {dac_out[2]}]
set_property PACKAGE_PIN C3 [get_ports {dac_out[3]}]
set_property PACKAGE_PIN C2 [get_ports {dac_out[4]}]
set_property PACKAGE_PIN C1 [get_ports {dac_out[5]}]
set_property PACKAGE_PIN B1 [get_ports {dac_out[6]}]
set_property PACKAGE_PIN D1 [get_ports {dac_out[7]}]
set_property PACKAGE_PIN E2 [get_ports {dac_out[8]}]
set_property PACKAGE_PIN A2 [get_ports {dac_out[9]}]
set_property PACKAGE_PIN B2 [get_ports {dac_out[10]}]
set_property PACKAGE_PIN E1 [get_ports {dac_out[11]}]
set_property PACKAGE_PIN F2 [get_ports {dac_out[12]}]
set_property PACKAGE_PIN F3 [get_ports {dac_out[13]}]
#set_property PACKAGE_PIN K3 [get_ports {dac_out[14]}]
#set_property PACKAGE_PIN K2 [get_ports {dac_out[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports dac_out]