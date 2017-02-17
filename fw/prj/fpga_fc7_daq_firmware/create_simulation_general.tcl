current_fileset -simset [ get_filesets sim_general ]
export_simulation  -directory "./fpga_fc7_daq_firmware/simulation_console_all" -simulator xsim -runtime 15us -ip_user_files_dir "./fpga_fc7_daq_firmware/fpga_fc7_daq_firmware.ip_user_files" -ipstatic_source_dir "./fpga_fc7_daq_firmware/fpga_fc7_daq_firmware.ip_user_files/ipstatic" -use_ip_compiled_libs

