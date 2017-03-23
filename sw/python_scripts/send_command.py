from PyChipsUser import *
import sys
import os
from ErrorHandler import *
from time import sleep
import numpy as np
fc7AddrTable = AddressTable("./fc7Addr.dat")
fc7ErrorHandler = ErrorHandler()
########################################
# IP address
########################################
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
fc7 = ChipsBusUdp(fc7AddrTable, ipaddr, 50001)
#############
# Combine and Send I2C Command
def SendCommand_I2C(command, hybrid_id, chip_id, use_mask, page, read, register_address, data, ReadBack):

  raw_command = fc7AddrTable.getItem("ctrl_command_i2c_command_type").shiftDataToMask(command)
  raw_hybrid_id = fc7AddrTable.getItem("ctrl_command_i2c_command_hybrid_id").shiftDataToMask(hybrid_id)
  raw_chip_id = fc7AddrTable.getItem("ctrl_command_i2c_command_chip_id").shiftDataToMask(chip_id)
  raw_readback = fc7AddrTable.getItem("ctrl_command_i2c_command_readback").shiftDataToMask(ReadBack)
  raw_use_mask = fc7AddrTable.getItem("ctrl_command_i2c_command_mask").shiftDataToMask(use_mask)
  raw_page = fc7AddrTable.getItem("ctrl_command_i2c_command_page").shiftDataToMask(page)
  raw_read = fc7AddrTable.getItem("ctrl_command_i2c_command_read").shiftDataToMask(read)
  raw_register = fc7AddrTable.getItem("ctrl_command_i2c_command_register").shiftDataToMask(register_address)
  raw_data = fc7AddrTable.getItem("ctrl_command_i2c_command_data").shiftDataToMask(data)

  cmd = raw_command + raw_hybrid_id + raw_chip_id + raw_readback + raw_use_mask + raw_page + raw_read + raw_register + raw_data;

  description = "Command: type = " + str(command) + ", hybrid = " + str(hybrid_id) + ", chip = " + str(chip_id)

  #print hex(cmd)

  fc7.write("ctrl_command_i2c_command_fifo", cmd)
  return description

# Send command ctrl
def SendCommand_CTRL(name = "none"):
    if name == "none":
        print "Sending nothing"
    elif name == "global_reset":
	fc7.write("ctrl_command_global_reset", 1)
    elif name == "reset_trigger":
	fc7.write("ctrl_fast_reset", 1)
    elif name == "start_trigger":
	fc7.write("ctrl_fast_start", 1)
    elif name == "stop_trigger":
	fc7.write("ctrl_fast_stop", 1)
    elif name == "load_config":
	fc7.write("ctrl_fast_load_config", 1)
    elif name == "reset_i2c":
	fc7.write("ctrl_command_i2c_reset", 1)
    elif name == "reset_i2c_fifos":
	fc7.write("ctrl_command_i2c_reset_fifos", 1)
    elif name == "fast_orbit_reset":
	fc7.write("ctrl_fast_signal_orbit_reset", 1)
    elif name == "fast_fast_reset":
	fc7.write("ctrl_fast_signal_fast_reset", 1)
    elif name == "fast_trigger":
	fc7.write("ctrl_fast_signal_trigger", 1)
    elif name == "fast_test_pulse":
	fc7.write("ctrl_fast_signal_test_pulse", 1)
    elif name == "fast_i2c_refresh":
	fc7.write("ctrl_fast_signal_i2c_refresh", 1)
    else:
        print "Unknown Command"

# Configure Fast Block
def Configure_Fast(triggers_to_accept, user_frequency, source, stubs_mask):
  fc7.write("cnfg_fast_triggers_to_accept", triggers_to_accept)
  fc7.write("cnfg_fast_user_frequency", user_frequency)
  ready_source = fc7AddrTable.getItem("cnfg_fast_source").shiftDataToMask(source)
  fc7.write("cnfg_fast_source_full", ready_source)
  fc7.write("cnfg_fast_mask", stubs_mask)
  #sleep(1)
  SendCommand_CTRL("reset_trigger")
  sleep(1)
  SendCommand_CTRL("load_config")
  sleep(1)

def Configure_TestPulse(delay_after_fast_reset, delay_after_test_pulse):
  fc7.write("cnfg_fast_delay_after_fast_reset", delay_after_fast_reset)
  fc7.write("cnfg_fast_delay_after_test_pulse", delay_after_test_pulse)
  SendCommand_CTRL("load_config")
  sleep(1)

# Configure I2C
def Configure_I2C(mask):
  fc7.write("cnfg_command_i2c", fc7AddrTable.getItem("cnfg_command_i2c_mask").shiftDataToMask(mask))
  SendCommand_CTRL("reset_i2c")
  SendCommand_CTRL("reset_i2c_fifos")

###################################################################################################
# CBC Related Methods   									  #
###################################################################################################
# data needs to be shifted if the mask is not from zero
def ShiftDataToMask(mask, data):	
	shiftingMask = mask
	bitShiftRequired = 0
	while (shiftingMask & 0x1) == 0:
	    shiftingMask >>= 1
	    bitShiftRequired += 1
	return (data & 0xff) << bitShiftRequired

# class used for setting the map of different CBC parameters
class Parameter():
	def __init__(self, page_i, reg_address_str, mask_str):
		self.page = page_i-1
      		self.reg_address = int(reg_address_str,0)
      		self.mask = int(mask_str,16)

# writing parameter to all cbc
def SetParameterI2C(parameter_name, data):	
	# 0 - write, 1 - read
	write = 0
	read = 1
	cbc2_map = {}

	# map of needed parameters
	cbc2_map["trigger_latency"] = Parameter(1, "0x01", "FF")
	cbc2_map["hit_detect"] = Parameter(1, "0x02", "60")
	cbc2_map["vcth"] = Parameter(1,"0x0C", "FF")
	cbc2_map["test_pulse_potentiometer"] = Parameter(1,"0x0D", "FF")
	cbc2_map["test_pulse_delay_select"] = Parameter(1,"0x0E", "F8") # LSB00000MSB - minimal, LSB11001MSB - maximal
	cbc2_map["select_channel_group"] = Parameter(1,"0x0E", "07") # LSB 000 MSB
	cbc2_map["test_pulse_control"] = Parameter(1,"0x0F", "C0") # 7 - polarity (1 = positive edge); 6 - enable test pulse
	cbc2_map["mask_channels_8_1"] = Parameter(1,"0x20", "FF") 

	write_data = data
	use_mask = 0
	if cbc2_map[parameter_name].mask != 255:
		fc7.write("cnfg_command_i2c_mask", cbc2_map[parameter_name].mask)
		write_data = ShiftDataToMask(cbc2_map[parameter_name].mask, data)
		use_mask = 1

	SendCommand_I2C(2, 0, 0, use_mask, cbc2_map[parameter_name].page, write, cbc2_map[parameter_name].reg_address, write_data, 0)
	sleep(0.5)

def CBC_Config():
	SetParameterI2C("trigger_latency", 195)
	SetParameterI2C("hit_detect", 1) # mode = single, enable = on
	SetParameterI2C("vcth", 127) #default
	SetParameterI2C("test_pulse_potentiometer", 0) # default 1.1V
	SetParameterI2C("test_pulse_delay_select", 24) # 11000
	SetParameterI2C("select_channel_group", 0)
	SetParameterI2C("test_pulse_control", 1) # polarity negative, test pulse enabled
	
	# unmask all channels
	i_start = 32	# 32
	i_finish = 64	# 64
	for i in range(i_start, i_finish):
		SendCommand_I2C(2, 0, 0, 0, 0, 0, i, 255, 0)
	sleep(2)

def CBC_ConfigTXT():	
	# 0 - write, 1 - read
	write = 0
	read = 1

	use_mask = 0
	cbc_config = np.genfromtxt('Cbc2_default_hole.txt', skiprows=2, dtype='str')

	#for i in range(0, cbc_config.shape[0]): # including offset
	for i in range(0, 52): # excluding offset
		SendCommand_I2C(2, 0, 0, use_mask, int(cbc_config[i][1],0), write, int(cbc_config[i][2],0), int(cbc_config[i][4],0), 0)
	sleep(2)

###################################################################################################

# tests test pulse request and temporary ipbus data readout
def TempReadTriggeredData():
	hybrid1_general = fc7.read("hybrid1_general")
	lat_err = DataFromMask(hybrid1_general, "hybrid1_general_lat_err")
	overflow = DataFromMask(hybrid1_general, "hybrid1_general_overflow") 
	pipe_address = DataFromMask(hybrid1_general, "hybrid1_general_pipe_address") 
	latency = DataFromMask(hybrid1_general, "hybrid1_general_latency") 
	trigger_counter = DataFromMask(hybrid1_general, "hybrid1_general_trigger_counter")

	temp_channel_data = []
	for i in range(1,9):
		temp_channel_data.append(fc7.read(("hybrid1_channels_"+str(i))))

        full_channel_data = 0
	for i in range(0,8):
		full_channel_data = full_channel_data + temp_channel_data[i]*((2**32)**i)
	
	# now full_channel_data_str[0] = ch1
	full_channel_data_str = format(full_channel_data, '0254b')

	print "======================================================================================================"
	print "Triggered Data:"
	print "   -> Latency Error:	", lat_err
	print "   -> Overflow:	", overflow
	print "   -> Pipe Address:	", pipe_address
	print "   -> Latency Counter:", latency
	print "   -> Number of triggers:", trigger_counter
	for i in range(0,31):
		print '   | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s |' % (1+8*i, full_channel_data_str[0+8*i], 2+8*i, full_channel_data_str[1+8*i], 3+8*i, full_channel_data_str[2+8*i], 4+8*i, full_channel_data_str[3+8*i], 5+8*i, full_channel_data_str[4+8*i], 6+8*i, full_channel_data_str[5+8*i], 7+8*i, full_channel_data_str[6+8*i], 8+8*i, full_channel_data_str[7+8*i])
	i = 31
	print '   | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s | Ch(%-3i) = %-1s |' % (1+8*i, full_channel_data_str[0+8*i], 2+8*i, full_channel_data_str[1+8*i], 3+8*i, full_channel_data_str[2+8*i], 4+8*i, full_channel_data_str[3+8*i], 5+8*i, full_channel_data_str[4+8*i], 6+8*i, full_channel_data_str[5+8*i])  
	print "======================================================================================================"

def ReadStatus(name = "Current Status"):
  print "============================"
  print name,":"
  print "   -> status error block id:", hex(fc7.read("stat_error_block_id"))
  print "   -> status error code:", hex(fc7.read("stat_error_code"))
  print "   -> interpretion: "
  fc7ErrorHandler.getErrorDescription(fc7.read("stat_error_block_id"),fc7.read("stat_error_code"))
  temp_source = fc7.read("stat_fast_fsm_source")
  temp_source_name = "Unknown"
  if temp_source == 1:
    temp_source_name = "L1-Trigger"
  elif temp_source == 2:
    temp_source_name = "Stubs"
  elif temp_source == 3:
    temp_source_name = "User Frequency"
  print "   -> trigger source:", temp_source_name
  temp_state = fc7.read("stat_fast_fsm_state")
  temp_state_name = "Unknown"
  if temp_state == 0:
    temp_state_name = "Idle"
  elif temp_state == 1:
    temp_state_name = "Running"
  print "   -> trigger state:", temp_state_name
  print "   -> trigger configured:", fc7.read("stat_fast_fsm_configured")
  print	"   -> --------------------------------"
  print "   -> i2c commands fifo empty:", fc7.read("stat_command_i2c_fifo_commands_empty")
  print "   -> i2c replies fifo empty:", fc7.read("stat_command_i2c_fifo_replies_empty")
  print "   -> i2c nreplies available:", fc7.read("stat_command_i2c_nreplies_present")
  print "   -> i2c fsm state:", fc7.read("stat_command_i2c_fsm")
  print "============================"

def CheckClockFrequencies():
  print "IPBus Clock Rate: ", fc7.read("stat_rate_ipb")/10000.0, "MHz"
  print "40MHz Clock Rate: ", fc7.read("stat_rate_40mhz")/10000.0, "MHz"
  print "Trigger Rate: ", fc7.read("stat_rate_trigger")/10.0, "KHz"

def DataFromMask(data, mask_name):
  return fc7AddrTable.getItem(mask_name).shiftDataFromMask(data)

def ReadChipData():
  print "Reading Out Data:"
  print "   =========================================================================================="
  print "   | Hybrid ID             || Chip ID             || Register                || DATA         |"
  print "   =========================================================================================="

  while fc7.read("stat_command_i2c_fifo_replies_empty") == 0:
      reply = fc7.read("ctrl_command_i2c_reply_fifo")
      hybrid_id = DataFromMask(reply, "ctrl_command_i2c_reply_hybrid_id")
      chip_id = DataFromMask(reply, "ctrl_command_i2c_reply_chip_id")
      data = DataFromMask(reply, "ctrl_command_i2c_reply_data")
      register = DataFromMask(reply, "ctrl_command_i2c_reply_register")
      #print bin(fc7.read("ctrl_i2c_command_fifo"))
      #print bin(reply)[4:12]
      print '   | %s %-12i || %s %-12i || %s %-12s || %-12s |' % ("Hybrid #", hybrid_id, "Chip #", chip_id, "Register #", hex(register)[:4], hex(data)[:4])
      print "    -----------------------------------------------------------------------------------------"
  print "   =========================================================================================="

# tests the fast commands
def FastTester():
	################
	## fast config #
	################
	# trigger_source: 1 - L1, 2 - Stubs Coincidence, 3 - User Frequency
	trigger_source = 3
	# triggers_to_accept: 0 - continious triggering, otherwise sends neeeded amount and turns off
	triggers_to_accept = 10
	# trigger_user_frequency: in kHz 1 to 1000.
	trigger_user_frequency = 3
	# trigger_stubs_mask: can set a stubs coincidence, 5 means that stubs from hybrids id=2 and id=0 are required: 1b'101
	trigger_stubs_mask = 5
	################
	
	ReadStatus("Before Configuration")
	Configure_Fast(triggers_to_accept, trigger_user_frequency, trigger_source, trigger_stubs_mask)
	ReadStatus("Configured")
	SendCommand_CTRL("start_trigger")
	ReadStatus("Trigger Started")
	sleep(2)
	ReadStatus("After Checker")
	SendCommand_CTRL("stop_trigger")
	ReadStatus("Trigger Stopped")

# tests i2c master
def I2CTester():
	###############
	## i2c config #
	###############
	# command_i2c: 0 - send command to certain hybrid/chip, 1 - send command to all chips on hybrid, 2 - send command to all chips on all hybrids
	#command_i2c = 0
	#hybrid_id = 0
	#chip_id = 0
	# mask has to be configured with Configure_I2C(--mask--) command, then used or not used using the paramter below
	use_mask = 0
	#page = 0
	# 0 - write, 1 - read
	write = 0
	read = 1
	#register = 2
	#data = 7
	ReadBack = 0
	################
	
	ReadStatus("Before I2C Configuration")
	Configure_I2C(255)
	ReadStatus("After I2C Configuration")

	num_i2c_registersPage1 = 35
	num_i2c_registersPage2 = 2
       #                       i2c_command , hybrid_id ,  chip_id, use_mask, page , read , register_address , data;

	for i in range(0, num_i2c_registersPage1):
		SendCommand_I2C(          2,         0,       0, use_mask,    0, read,        1,    10, ReadBack)	
	for i in range(0, num_i2c_registersPage2):
		SendCommand_I2C(          2,         0,       0, use_mask,    1, read,        i,    10, ReadBack)
	for i in range(1, num_i2c_registersPage1):
		SendCommand_I2C(          2,         0,       0, use_mask,    0, write,       i,    5, ReadBack)
	for i in range(1, num_i2c_registersPage2):
		SendCommand_I2C(          2,         0,       15, use_mask,    1, write,       i,    7, ReadBack)
	for i in range(0, num_i2c_registersPage1):
		SendCommand_I2C(          2,         0,       0, use_mask,    0, read,        i,    10, ReadBack)
	for i in range(0, num_i2c_registersPage2):
		SendCommand_I2C(          2,         0,       0, use_mask,    1, read,        i,    10, ReadBack)
	
	sleep(1)

	ReadStatus("After Send Command")
	ReadChipData()
	ReadStatus("After Read Reply")

# test Temp CBC2 Readout
def ReadoutTester():
	delay_after_fast_reset = 50
	delay_after_test_pulse = 200
	Configure_TestPulse(delay_after_fast_reset, delay_after_test_pulse)
	CBC_ConfigTXT()
	SetParameterI2C("select_channel_group", 0)
	
	sleep(1)
	SendCommand_CTRL("fast_test_pulse")
	sleep(0.5)
	TempReadTriggeredData()

####################
## Program Running #
####################
SendCommand_CTRL("global_reset")
sleep(1)

# to test I2C Commands (see method definition)
#I2CTester()

# to test Fast Command Block
#FastTester()
 
# to test CBC test pulse injection
ReadoutTester()

# set of commands one may need but not used in FastTester
#SendCommand_CTRL("fast_orbit_reset")
#SendCommand_CTRL("fast_trigger")
#SendCommand_CTRL("fast_fast_reset")
#SendCommand_CTRL("fast_test_pulse")
#SendCommand_CTRL("fast_i2c_refresh")

#CheckClockFrequencies()
