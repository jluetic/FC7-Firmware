from PyChipsUser import *
import sys
import os
from ErrorHandler import *
from time import sleep
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
def SendCommand_I2C(command, hybrid_id, chip_id, use_mask, page, read, register_address, data):

  raw_command = fc7AddrTable.getItem("ctrl_command_i2c_command_type").shiftDataToMask(command)
  raw_hybrid_id = fc7AddrTable.getItem("ctrl_command_i2c_command_hybrid_id").shiftDataToMask(hybrid_id)
  raw_chip_id = fc7AddrTable.getItem("ctrl_command_i2c_command_chip_id").shiftDataToMask(chip_id)
  raw_use_mask = fc7AddrTable.getItem("ctrl_command_i2c_command_mask").shiftDataToMask(use_mask)
  raw_page = fc7AddrTable.getItem("ctrl_command_i2c_command_page").shiftDataToMask(page)
  raw_read = fc7AddrTable.getItem("ctrl_command_i2c_command_read").shiftDataToMask(read)
  raw_register = fc7AddrTable.getItem("ctrl_command_i2c_command_register").shiftDataToMask(register_address)
  raw_data = fc7AddrTable.getItem("ctrl_command_i2c_command_data").shiftDataToMask(data)

  cmd = raw_command + raw_hybrid_id + raw_chip_id + raw_use_mask + raw_page + raw_read + raw_register + raw_data;

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

# Configure I2C
def Configure_I2C(mask):
  fc7.write("cnfg_command_i2c", fc7AddrTable.getItem("cnfg_command_i2c_mask").shiftDataToMask(mask))
  SendCommand_CTRL("reset_i2c")
  SendCommand_CTRL("reset_i2c_fifos")

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
  print "   ================================================================"
  print "   | Hybrid ID             || Chip ID             || DATA         |"
  print "   ================================================================"

  while fc7.read("stat_command_i2c_fifo_replies_empty") == 0:
      reply = fc7.read("ctrl_command_i2c_reply_fifo")
      hybrid_id = DataFromMask(reply, "ctrl_command_i2c_reply_hybrid_id")
      chip_id = DataFromMask(reply, "ctrl_command_i2c_reply_chip_id")
      data = DataFromMask(reply, "ctrl_command_i2c_reply_data")
      #print bin(fc7.read("ctrl_i2c_command_fifo"))
      #print bin(reply)[4:12]
      print '   | %s %-12i || %s %-12i || %-12s |' % ("Hybrid #", hybrid_id, "Chip #", chip_id, hex(data)[:4])
      print "    --------------------------------------------------------------"
  print "   ================================================================"    

# tests the fast commands
def FastTester():
	################
	## fast config #
	################
	# trigger_source: 1 - L1, 2 - Stubs Coincidence, 3 - User Frequency
	trigger_source = 3
	# triggers_to_accept: 0 - continious triggering, otherwise sends neeeded amount and turns off
	triggers_to_accept = 0
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
	command_i2c = 1
	hybrid_id = 0
	chip_id = 4
	# mask has to be configured with Configure_I2C(--mask--) command, then used or not used using the paramter below
	use_mask = 0
	page = 1
	# 0 - write, 1 - read
	read = 1
	register = 23
	data = 15
	################
	
	ReadStatus("Before I2C Configuration")
	Configure_I2C(255)
	ReadStatus("After I2C Configuration")

	SendCommand_I2C(command_i2c, hybrid_id, chip_id, use_mask, page, read, register, data)
	
	sleep(1)

	ReadStatus("After Send Command")
	ReadChipData()
	ReadStatus("After Read Reply")	

####################
## Program Running #
####################
SendCommand_CTRL("global_reset")
sleep(0.5)

# to test I2C Commands (see method definition)
I2CTester()

# to test Fast Command Block 
#FastTester()

# set of commands one may need but not used in FastTester
#SendCommand_CTRL("fast_orbit_reset")
#SendCommand_CTRL("fast_trigger")
#SendCommand_CTRL("fast_fast_reset")
#SendCommand_CTRL("fast_test_pulse")

CheckClockFrequencies()
