#*****************************************************************************************
# Vivado (TM) v2022.2 (64-bit)
#
# fpga-bap-project.tcl: Tcl script for re-creating project 'fpga-bap-project'
#
# IP Build 3669848 on Fri Oct 14 08:30:02 MDT 2022
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
 "[file normalize "$origin_dir/vivado_project/fpga-bap-project.srcs/utils_1/imports/synth_1/usb_stream_headers.dcp"]"\
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find local file $ifile "
      set status false
    }
  }

  set files [list \
 "[file normalize "$origin_dir/src/IP/fifo_generator_1/fifo_generator_1.xci"]"\
 "[file normalize "$origin_dir/src/IP/fifo_generator_0/fifo_generator_0.xci"]"\
 "[file normalize "$origin_dir/src/IP/fp_divider_X_bit/fp_divider_X_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/fp_subtract_X_bit/fp_subtract_X_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/fp_adder_16_bit/fp_adder_16_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/fp_mult_16_bit/fp_mult_16_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/X_X_Multiplier/X_X_Multiplier.xci"]"\
 "[file normalize "$origin_dir/src/IP/dds_compiler_0/dds_compiler_0.xci"]"\
 "[file normalize "$origin_dir/src/IP/float_to_fixed_32bit_to_16_bit/float_to_fixed_32bit_to_16_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/fp_16_to_32/fp_16_to_32.xci"]"\
 "[file normalize "$origin_dir/src/IP/float_to_fixed_32_bit/float_to_fixed_32_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/floating_point_mult_32_bit/floating_point_mult_32_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/Adder_For_DC_Comp/Adder_For_DC_Comp.xci"]"\
 "[file normalize "$origin_dir/src/IP/adder_17_bit/adder_17_bit.xci"]"\
 "[file normalize "$origin_dir/src/IP/adder_16_bit/adder_16_bit.xci"]"\
 "[file normalize "$origin_dir/src/design/my_types_pkg.vhd"]"\
 "[file normalize "$origin_dir/src/design/Control_Phasor_Generation.vhd"]"\
 "[file normalize "$origin_dir/src/design/Feature_Gen.vhd"]"\
 "[file normalize "$origin_dir/src/design/Map_inputs_DDS.vhd"]"\
 "[file normalize "$origin_dir/src/design/Multiple_time_signal_generation.vhd"]"\
 "[file normalize "$origin_dir/src/design/Phasor_Calc_Toplevel.vhd"]"\
 "[file normalize "$origin_dir/src/design/System_Phasor_Calc.vhd"]"\
 "[file normalize "$origin_dir/src/design/Time_Signal_Generation.vhd"]"\
 "[file normalize "$origin_dir/src/design/Vector_Vector_Scalar_multiplier.vhd"]"\
 "[file normalize "$origin_dir/src/design/adc_buffer.vhd"]"\
 "[file normalize "$origin_dir/src/design/adc_to_usb_stream.vhd"]"\
 "[file normalize "$origin_dir/src/design/control_module.vhd"]"\
 "[file normalize "$origin_dir/src/design/pulse_synchronizer.vhd"]"\
 "[file normalize "$origin_dir/src/design/uart.vhd"]"\
 "[file normalize "$origin_dir/src/design/uart_communication.vhd"]"\
 "[file normalize "$origin_dir/src/design/usb_communication.vhd"]"\
 "[file normalize "$origin_dir/src/design/vector_scalar_multiplier.vhd"]"\
 "[file normalize "$origin_dir/src/design/project_toplevel.vhd"]"\
 "[file normalize "$origin_dir/src/design/usb_stream_headers.vhd"]"\
 "[file normalize "$origin_dir/src/design/raw_adc_usb_stream.vhd"]"\
 "[file normalize "$origin_dir/src/design/usb_dip_counter.vhd"]"\
 "[file normalize "$origin_dir/src/design/dac_buffer.vhd"]"\
 "[file normalize "$origin_dir/src/IP/fifo_generator_2/fifo_generator_2.xci"]"\
 "[file normalize "$origin_dir/constraints/project_toplevel.xdc"]"\
 "[file normalize "$origin_dir/constraints/au_plus_uart_led.xdc"]"\
 "[file normalize "$origin_dir/constraints/adc_to_usb_stream.xdc"]"\
 "[file normalize "$origin_dir/constraints/usb_dip_counter.xdc"]"\
 "[file normalize "$origin_dir/constraints/project_toplevel_v2.xdc"]"\
 "[file normalize "$origin_dir/constraints/adc_to_usb_stream_v2.xdc"]"\
 "[file normalize "$origin_dir/src/testbench/integration_tbs/control_and_math_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/integration_tbs/uart_control_and_siggen_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/adc_buffer_and_usb_comm_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/integration_tbs/uart_and_control_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/uart_communication_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/usb_communication_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/adc_to_usb_stream_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/control_module_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/usb_dip_counter_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/adc_buffer_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/DDS_TB.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/uart_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Feature_Gen_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Feature_Gen_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/DDS_TB.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/control_module_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/uart_communication_tb.vhd"]"\
 "[file normalize "$origin_dir/src/testbench/individual_tbs/uart_tb.vhd"]"\
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find remote file $ifile "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir [file dirname [info script]]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "fpga-bap-project"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "fpga-bap-project.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/vivado_project"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project ${_xil_proj_name_} $origin_dir/vivado_project -part xc7a100tftg256-1 -quiet -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "customized_default_ip_location" -value "C:/Users/thoma/OneDrive - Delft University of Technology/Documenten/UNI/BAP/VHDL/FPGA_4.0/src/IP" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_resource_estimation" -value "0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xc7a100tftg256-1" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator.activehdl_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.activehdl_version" -value "13.0" -objects $obj
set_property -name "simulator.ies_gcc_version" -value "6.2.0" -objects $obj
set_property -name "simulator.ies_version" -value "15.20.083" -objects $obj
set_property -name "simulator.modelsim_gcc_version" -value "7.4.0" -objects $obj
set_property -name "simulator.modelsim_version" -value "2022.2" -objects $obj
set_property -name "simulator.questa_gcc_version" -value "7.4.0" -objects $obj
set_property -name "simulator.questa_version" -value "2022.2" -objects $obj
set_property -name "simulator.riviera_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.riviera_version" -value "2022.04" -objects $obj
set_property -name "simulator.vcs_gcc_version" -value "9.2.0" -objects $obj
set_property -name "simulator.vcs_version" -value "S-2021.09" -objects $obj
set_property -name "simulator.xcelium_gcc_version" -value "9.3.0" -objects $obj
set_property -name "simulator.xcelium_version" -value "21.09.009" -objects $obj
set_property -name "simulator.xsim_gcc_version" -value "6.2.0" -objects $obj
set_property -name "simulator.xsim_version" -value "2022.2" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "sim_compile_state" -value "1" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "20" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "20" -objects $obj
set_property -name "webtalk.modelsim_launch_sim" -value "3" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "20" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "20" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "20" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "20" -objects $obj
set_property -name "webtalk.xsim_launch_sim" -value "521" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 [file normalize "${origin_dir}/src/IP/fifo_generator_1/fifo_generator_1.xci"] \
 [file normalize "${origin_dir}/src/IP/fifo_generator_0/fifo_generator_0.xci"] \
 [file normalize "${origin_dir}/src/IP/fp_divider_X_bit/fp_divider_X_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/fp_subtract_X_bit/fp_subtract_X_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/fp_adder_16_bit/fp_adder_16_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/fp_mult_16_bit/fp_mult_16_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/X_X_Multiplier/X_X_Multiplier.xci"] \
 [file normalize "${origin_dir}/src/IP/dds_compiler_0/dds_compiler_0.xci"] \
 [file normalize "${origin_dir}/src/IP/float_to_fixed_32bit_to_16_bit/float_to_fixed_32bit_to_16_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/fp_16_to_32/fp_16_to_32.xci"] \
 [file normalize "${origin_dir}/src/IP/float_to_fixed_32_bit/float_to_fixed_32_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/floating_point_mult_32_bit/floating_point_mult_32_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/Adder_For_DC_Comp/Adder_For_DC_Comp.xci"] \
 [file normalize "${origin_dir}/src/IP/adder_17_bit/adder_17_bit.xci"] \
 [file normalize "${origin_dir}/src/IP/adder_16_bit/adder_16_bit.xci"] \
 [file normalize "${origin_dir}/src/design/my_types_pkg.vhd"] \
 [file normalize "${origin_dir}/src/design/Control_Phasor_Generation.vhd"] \
 [file normalize "${origin_dir}/src/design/Feature_Gen.vhd"] \
 [file normalize "${origin_dir}/src/design/Map_inputs_DDS.vhd"] \
 [file normalize "${origin_dir}/src/design/Multiple_time_signal_generation.vhd"] \
 [file normalize "${origin_dir}/src/design/Phasor_Calc_Toplevel.vhd"] \
 [file normalize "${origin_dir}/src/design/System_Phasor_Calc.vhd"] \
 [file normalize "${origin_dir}/src/design/Time_Signal_Generation.vhd"] \
 [file normalize "${origin_dir}/src/design/Vector_Vector_Scalar_multiplier.vhd"] \
 [file normalize "${origin_dir}/src/design/adc_buffer.vhd"] \
 [file normalize "${origin_dir}/src/design/adc_to_usb_stream.vhd"] \
 [file normalize "${origin_dir}/src/design/control_module.vhd"] \
 [file normalize "${origin_dir}/src/design/pulse_synchronizer.vhd"] \
 [file normalize "${origin_dir}/src/design/uart.vhd"] \
 [file normalize "${origin_dir}/src/design/uart_communication.vhd"] \
 [file normalize "${origin_dir}/src/design/usb_communication.vhd"] \
 [file normalize "${origin_dir}/src/design/vector_scalar_multiplier.vhd"] \
 [file normalize "${origin_dir}/src/design/project_toplevel.vhd"] \
 [file normalize "${origin_dir}/src/design/usb_stream_headers.vhd"] \
 [file normalize "${origin_dir}/src/design/raw_adc_usb_stream.vhd"] \
 [file normalize "${origin_dir}/src/design/usb_dip_counter.vhd"] \
 [file normalize "${origin_dir}/src/design/dac_buffer.vhd"] \
 [file normalize "${origin_dir}/src/IP/fifo_generator_2/fifo_generator_2.xci"] \
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
set file "$origin_dir/src/IP/fifo_generator_1/fifo_generator_1.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fifo_generator_0/fifo_generator_0.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fp_divider_X_bit/fp_divider_X_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fp_subtract_X_bit/fp_subtract_X_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fp_adder_16_bit/fp_adder_16_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fp_mult_16_bit/fp_mult_16_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/X_X_Multiplier/X_X_Multiplier.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/dds_compiler_0/dds_compiler_0.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/float_to_fixed_32bit_to_16_bit/float_to_fixed_32bit_to_16_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/fp_16_to_32/fp_16_to_32.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/float_to_fixed_32_bit/float_to_fixed_32_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/floating_point_mult_32_bit/floating_point_mult_32_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/Adder_For_DC_Comp/Adder_For_DC_Comp.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/adder_17_bit/adder_17_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/IP/adder_16_bit/adder_16_bit.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}

set file "$origin_dir/src/design/my_types_pkg.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Control_Phasor_Generation.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Feature_Gen.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Map_inputs_DDS.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Multiple_time_signal_generation.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Phasor_Calc_Toplevel.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/System_Phasor_Calc.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Time_Signal_Generation.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/Vector_Vector_Scalar_multiplier.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/adc_buffer.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/adc_to_usb_stream.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/control_module.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/pulse_synchronizer.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/uart.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/uart_communication.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/usb_communication.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/vector_scalar_multiplier.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/project_toplevel.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/usb_stream_headers.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/raw_adc_usb_stream.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/usb_dip_counter.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/design/dac_buffer.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/IP/fifo_generator_2/fifo_generator_2.xci"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "generate_files_for_reference" -value "0" -objects $file_obj
set_property -name "registered_with_manager" -value "1" -objects $file_obj
if { ![get_property "is_locked" $file_obj] } {
  set_property -name "synth_checkpoint_mode" -value "Singular" -objects $file_obj
}


# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "dataflow_viewer_settings" -value "min_width=16" -objects $obj
set_property -name "elab_link_dcps" -value "0" -objects $obj
set_property -name "top" -value "project_toplevel" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/project_toplevel.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/project_toplevel.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj
set_property -name "is_enabled" -value "0" -objects $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/au_plus_uart_led.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/au_plus_uart_led.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj
set_property -name "is_enabled" -value "0" -objects $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/adc_to_usb_stream.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/adc_to_usb_stream.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj
set_property -name "is_enabled" -value "0" -objects $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/usb_dip_counter.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/usb_dip_counter.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj
set_property -name "is_enabled" -value "0" -objects $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/project_toplevel_v2.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/project_toplevel_v2.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constraints/adc_to_usb_stream_v2.xdc"]"
set file_added [add_files -norecurse -fileset $obj [list $file]]
set file "$origin_dir/constraints/adc_to_usb_stream_v2.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "target_part" -value "xc7a100tftg256-1" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "uart_communication" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'integration_tbs' fileset (if not found)
if {[string equal [get_filesets -quiet integration_tbs] ""]} {
  create_fileset -simset integration_tbs
}

# Set 'integration_tbs' fileset object
set obj [get_filesets integration_tbs]
set files [list \
 [file normalize "${origin_dir}/src/testbench/integration_tbs/control_and_math_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/integration_tbs/uart_control_and_siggen_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/adc_buffer_and_usb_comm_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/integration_tbs/uart_and_control_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'integration_tbs' fileset file properties for remote files
set file "$origin_dir/src/testbench/integration_tbs/control_and_math_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets integration_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/integration_tbs/uart_control_and_siggen_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets integration_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/adc_buffer_and_usb_comm_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets integration_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/integration_tbs/uart_and_control_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets integration_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'integration_tbs' fileset file properties for local files
# None

# Set 'integration_tbs' fileset properties
set obj [get_filesets integration_tbs]
set_property -name "top" -value "control_and_math_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Create 'individual_tbs' fileset (if not found)
if {[string equal [get_filesets -quiet individual_tbs] ""]} {
  create_fileset -simset individual_tbs
}

# Set 'individual_tbs' fileset object
set obj [get_filesets individual_tbs]
set files [list \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/uart_communication_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/usb_communication_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/adc_to_usb_stream_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/control_module_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/usb_dip_counter_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/adc_buffer_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/DDS_TB.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/uart_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Feature_Gen_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Set 'individual_tbs' fileset file properties for remote files
set file "$origin_dir/src/testbench/individual_tbs/uart_communication_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/usb_communication_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/adc_to_usb_stream_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/control_module_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/usb_dip_counter_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/adc_buffer_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/DDS_TB.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/uart_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Feature_Gen_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets individual_tbs] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'individual_tbs' fileset file properties for local files
# None

# Set 'individual_tbs' fileset properties
set obj [get_filesets individual_tbs]
set_property -name "top" -value "uart_communication_tb" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
set files [list \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Feature_Gen_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/DDS_TB.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/control_module_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/uart_communication_tb.vhd"] \
 [file normalize "${origin_dir}/src/testbench/individual_tbs/uart_tb.vhd"] \
]
add_files -norecurse -fileset $obj $files

# Add local files from the original project (-no_copy_sources specified)
set files [list \
 [file normalize "${origin_dir}/vivado_project/fpga-bap-project.srcs/utils_1/imports/synth_1/usb_stream_headers.dcp" ]\
]
set added_files [add_files -fileset utils_1 $files]

# Set 'utils_1' fileset file properties for remote files
set file "$origin_dir/src/testbench/individual_tbs/Multiple_time_signal_generation_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Phasor_Calc_Toplevel_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/System_Phasor_Calc_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Vector_Vector_Scalar_multiplier_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Feature_Gen_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/DDS_TB.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/control_module_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/Map_inputs_DDS_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/uart_communication_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "$origin_dir/src/testbench/individual_tbs/uart_tb.vhd"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'utils_1' fileset file properties for local files
set file "synth_1/usb_stream_headers.dcp"
set file_obj [get_files -of_objects [get_filesets utils_1] [list "*$file"]]
set_property -name "netlist_only" -value "0" -objects $file_obj


# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]

set idrFlowPropertiesConstraints ""
catch {
 set idrFlowPropertiesConstraints [get_param runs.disableIDRFlowPropertyConstraints]
 set_param runs.disableIDRFlowPropertyConstraints 1
}

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7a100tftg256-1 -flow {Vivado Synthesis 2022} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2022" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1]
set_property -name "needs_refresh" -value "1" -objects $obj
set_property -name "part" -value "xc7a100tftg256-1" -objects $obj
set_property -name "incremental_checkpoint" -value "$proj_dir/fpga-bap-project.srcs/utils_1/imports/synth_1/usb_stream_headers.dcp" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj
set_property -name "steps.synth_design.args.retiming" -value "1" -objects $obj

# Create 'synth_1_copy_1' run (if not found)
if {[string equal [get_runs -quiet synth_1_copy_1] ""]} {
    create_run -name synth_1_copy_1 -part xc7a100tftg256-1 -flow {Vivado Synthesis 2022} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1_copy_1]
  set_property flow "Vivado Synthesis 2022" [get_runs synth_1_copy_1]
}
set obj [get_runs synth_1_copy_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_copy_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1_copy_1] synth_1_copy_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_copy_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1_copy_1
}
set obj [get_report_configs -of_objects [get_runs synth_1_copy_1] synth_1_copy_1_synth_report_utilization_0]
if { $obj != "" } {

}
set obj [get_runs synth_1_copy_1]
set_property -name "part" -value "xc7a100tftg256-1" -objects $obj
set_property -name "incremental_checkpoint" -value "$proj_dir/fpga-bap-project.srcs/utils_1/imports/synth_1/usb_stream_headers.dcp" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "1" -objects $obj
set_property -name "auto_incremental_checkpoint.directory" -value "$proj_dir/fpga-bap-project.srcs/utils_1/imports/synth_1/synth_1_copy_1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7a100tftg256-1 -flow {Vivado Implementation 2022} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2022" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "options.verbose" -value "1" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.report_unconstrained" -value "1" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "options.warn_on_violation" -value "1" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "needs_refresh" -value "1" -objects $obj
set_property -name "part" -value "xc7a100tftg256-1" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]
catch {
 if { $idrFlowPropertiesConstraints != {} } {
   set_param runs.disableIDRFlowPropertyConstraints $idrFlowPropertiesConstraints
 }
}

# Change current directory to project folder
cd [file dirname [info script]]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1
