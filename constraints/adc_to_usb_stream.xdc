# clk => 100 MHz
create_clock -period 10.000 -name clk_0 -waveform {0.000 5.000} [get_ports clk]
create_clock -period 10.000 -name clk_ft -waveform {0.000 5.000} [get_ports ft_clk]
create_clock -period 1000.000 -name clk_adc -waveform {0.000 500.000} [get_ports adc_clk]

# Non timing critial paths
set_false_path -from [get_clocks clk_ft] -to [get_clocks clk_0]
set_false_path -from [get_clocks clk_ft] -to [get_clocks clk_adc]
set_false_path -from [get_clocks clk_0] -to [get_clocks clk_adc]
set_false_path -from [get_ports rst_n]
set_false_path -to [get_ports led]


set_property PACKAGE_PIN N14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN P6 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

set_property PACKAGE_PIN L5 [get_ports {adc_data_in[0]}]
set_property PACKAGE_PIN P5 [get_ports {adc_data_in[1]}]
set_property PACKAGE_PIN N4 [get_ports {adc_data_in[2]}]
set_property PACKAGE_PIN M5 [get_ports {adc_data_in[3]}]
set_property PACKAGE_PIN M4 [get_ports {adc_data_in[4]}]
set_property PACKAGE_PIN L4 [get_ports {adc_data_in[5]}]
set_property PACKAGE_PIN P3 [get_ports {adc_data_in[6]}]
set_property PACKAGE_PIN P4 [get_ports {adc_data_in[7]}]
set_property PACKAGE_PIN N2 [get_ports {adc_data_in[8]}]
set_property PACKAGE_PIN N3 [get_ports {adc_data_in[9]}]
set_property PACKAGE_PIN R2 [get_ports {adc_data_in[10]}]
set_property PACKAGE_PIN R1 [get_ports {adc_data_in[11]}]
set_property PACKAGE_PIN R3 [get_ports {adc_data_in[12]}]
set_property PACKAGE_PIN T2 [get_ports {adc_data_in[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports adc_data_in]

set_property PACKAGE_PIN T3 [get_ports adc_clk]
set_property IOSTANDARD LVCMOS33 [get_ports adc_clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets adc_clk_IBUF]

set_property PACKAGE_PIN F5 [get_ports ft_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ft_clk]

set_property PACKAGE_PIN B7 [get_ports {ft_data[0]}]
set_property PACKAGE_PIN A7 [get_ports {ft_data[1]}]
set_property PACKAGE_PIN B6 [get_ports {ft_data[2]}]
set_property PACKAGE_PIN B5 [get_ports {ft_data[3]}]
set_property PACKAGE_PIN A5 [get_ports {ft_data[4]}]
set_property PACKAGE_PIN A4 [get_ports {ft_data[5]}]
set_property PACKAGE_PIN B4 [get_ports {ft_data[6]}]
set_property PACKAGE_PIN A3 [get_ports {ft_data[7]}]
set_property PACKAGE_PIN C7 [get_ports {ft_data[8]}]
set_property PACKAGE_PIN C6 [get_ports {ft_data[9]}]
set_property PACKAGE_PIN D6 [get_ports {ft_data[10]}]
set_property PACKAGE_PIN D5 [get_ports {ft_data[11]}]
set_property PACKAGE_PIN G5 [get_ports {ft_data[12]}]
set_property PACKAGE_PIN G4 [get_ports {ft_data[13]}]
set_property PACKAGE_PIN G2 [get_ports {ft_data[14]}]
set_property PACKAGE_PIN G1 [get_ports {ft_data[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports ft_data]

set_property PACKAGE_PIN H2 [get_ports {ft_be[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_be[0]}]
set_property PACKAGE_PIN H1 [get_ports {ft_be[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ft_be[1]}]

set_property PACKAGE_PIN H4 [get_ports ft_rd_n]
set_property IOSTANDARD LVCMOS33 [get_ports ft_rd_n]

set_property PACKAGE_PIN H5 [get_ports ft_wr_n]
set_property IOSTANDARD LVCMOS33 [get_ports ft_wr_n]

set_property PACKAGE_PIN E5 [get_ports ft_oe_n]
set_property IOSTANDARD LVCMOS33 [get_ports ft_oe_n]

set_property PACKAGE_PIN M6 [get_ports ft_txe_n]
set_property IOSTANDARD LVCMOS33 [get_ports ft_txe_n]


set_property PACKAGE_PIN K13 [get_ports {led[0]}]
set_property PACKAGE_PIN K12 [get_ports {led[1]}]
set_property PACKAGE_PIN L14 [get_ports {led[2]}]
set_property PACKAGE_PIN L13 [get_ports {led[3]}]
set_property PACKAGE_PIN M16 [get_ports {led[4]}]
set_property PACKAGE_PIN M14 [get_ports {led[5]}]
set_property PACKAGE_PIN M12 [get_ports {led[6]}]
set_property PACKAGE_PIN N16 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports led]


set_input_delay -clock [get_clocks clk_ft] -min 3.000 [get_ports ft_txe_n]
set_input_delay -clock [get_clocks clk_ft] -max -3.500 [get_ports ft_txe_n]
set_output_delay -clock [get_clocks clk_ft] -min -4.800 [get_ports ft_data]
set_output_delay -clock [get_clocks clk_ft] -max 1.000 [get_ports ft_data]
set_output_delay -clock [get_clocks clk_ft] -min -4.800 [get_ports ft_wr_n]
set_output_delay -clock [get_clocks clk_ft] -max 1.000 [get_ports ft_wr_n]

set_input_delay -clock clk_adc -max 3.000 [get_ports adc_data_in]
set_input_delay -clock clk_adc -min -3.000 [get_ports adc_data_in]
