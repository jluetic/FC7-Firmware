#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m'

if [ -d "./fpga_fc7_daq_firmware/" ]; then
	if [ ! -d "./fpga_fc7_daq_firmware/simulation_console_command_processor/xsim" ]; then
		vivado -mode batch -nolog -nojournal -source create_simulation_command_processor_block.tcl ./fpga_fc7_daq_firmware/fpga_fc7_daq_firmware.xpr
	fi
	cd ./fpga_fc7_daq_firmware/simulation_console_command_processor/xsim
	bash ./sim_command_processor_core.sh -reset_run
	bash ./sim_command_processor_core.sh

	rm ./*.backup.log
	echo -e "${RED}"
	if ! grep -nri "failure\|error" ./*.log
	then
		echo -e "${GREEN}"
		echo -e "${BOLD}Simulation was executed without errors.${NC}";
	else
		echo -e "${BOLD}ERROR! There were errors during execution of the simulation.${NC}";
		exit 1;
	fi 

	cd ../../../
else
	echo -e "${RED}"
	echo -e "${BOLD}ERROR: Vivado Project doesn't exist. Run create_vivado_project.sh first.${NC}"; 
fi
