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

  raw_command = fc7AddrTable.getItem("ctrl_i2c_command_type").shiftDataToMask(command)
  raw_hybrid_id = fc7AddrTable.getItem("ctrl_i2c_command_hybrid_id").shiftDataToMask(hybrid_id)
  raw_chip_id = fc7AddrTable.getItem("ctrl_i2c_command_chip_id").shiftDataToMask(chip_id)
  raw_use_mask = fc7AddrTable.getItem("ctrl_i2c_command_mask").shiftDataToMask(use_mask)
  raw_page = fc7AddrTable.getItem("ctrl_i2c_command_page").shiftDataToMask(page)
  raw_read = fc7AddrTable.getItem("ctrl_i2c_command_read").shiftDataToMask(read)
  raw_register = fc7AddrTable.getItem("ctrl_i2c_command_register").shiftDataToMask(register_address)
  raw_data = fc7AddrTable.getItem("ctrl_i2c_command_data").shiftDataToMask(data)

  cmd = raw_command + raw_hybrid_id + raw_chip_id + raw_use_mask + raw_page + raw_read + raw_register + raw_data;

  description = "Command: type = " + str(command) + ", hybrid = " + str(hybrid_id) + ", chip = " + str(chip_id)

  #print hex(cmd)

  fc7.write("ctrl_i2c_command_fifo", cmd)
  return description

# Send command ctrl
def SendCommand_CTRL(name = "none"):
    if name == "none":
        print "Sending nothing"
    elif name == "global_reset":
        #fc7.write("ctrl_global_reset", 1)
	fc7.write("ctrl_global", fc7AddrTable.getItem("ctrl_global_reset").shiftDataToMask(1))
    elif name == "reset_trigger":
        #fc7.write("ctrl_fast_reset", 1)
	fc7.write("ctrl_fast", fc7AddrTable.getItem("ctrl_fast_reset").shiftDataToMask(1))
    elif name == "start_trigger":
        #fc7.write("ctrl_fast_start", 1)
	fc7.write("ctrl_fast", fc7AddrTable.getItem("ctrl_fast_start").shiftDataToMask(1))
    elif name == "stop_trigger":
        #fc7.write("ctrl_fast_stop", 1)
	fc7.write("ctrl_fast", fc7AddrTable.getItem("ctrl_fast_stop").shiftDataToMask(1))
    elif name == "load_config":
        #fc7.write("ctrl_fast_load_config", 1)
	fc7.write("ctrl_fast", fc7AddrTable.getItem("ctrl_fast_load_config").shiftDataToMask(1))
    elif name == "reset_i2c":
        #fc7.write("ctrl_i2c_reset", 1)
	fc7.write("ctrl_i2c", fc7AddrTable.getItem("ctrl_i2c_reset").shiftDataToMask(1))
    elif name == "reset_i2c_fifos":
        #fc7.write("ctrl_i2c_reset_fifos", 1)
	fc7.write("ctrl_i2c", fc7AddrTable.getItem("ctrl_i2c_reset_fifos").shiftDataToMask(1))
    else:
        print "Unknown Command"

# Configure Fast Block
def Configure_Fast(triggers_to_accept, divider, source, stubs_mask):
  fc7.write("cnfg_fast_triggers_to_accept", triggers_to_accept)
  fc7.write("cnfg_fast_divider", divider)
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
  fc7.write("cnfg_i2c", fc7AddrTable.getItem("cnfg_i2c_mask").shiftDataToMask(mask))
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
  print "   -> i2c commands fifo empty:", fc7.read("stat_i2c_fifo_commands_empty")
  print "   -> i2c replies fifo empty:", fc7.read("stat_i2c_fifo_replies_empty")
  print "   -> i2c fsm state:", fc7.read("stat_i2c_fsm")
  print "============================"

def DataFromMask(data, mask_name):
  return fc7AddrTable.getItem(mask_name).shiftDataFromMask(data)

def ReadChipData():
  print "Reading Out Data:"
  print "   ================================================================"
  print "   | Hybrid ID             || Chip ID             || DATA         |"
  print "   ================================================================"

  while fc7.read("stat_i2c_fifo_replies_empty") == 0:
      reply = fc7.read("ctrl_i2c_reply_fifo")
      hybrid_id = DataFromMask(reply, "ctrl_i2c_reply_hybrid_id")
      chip_id = DataFromMask(reply, "ctrl_i2c_reply_chip_id")
      data = DataFromMask(reply, "ctrl_i2c_reply_data")
      #print bin(fc7.read("ctrl_i2c_command_fifo"))
      #print bin(reply)[4:12]
      print '   | %s %-12i || %s %-12i || %-12s |' % ("Hybrid #", hybrid_id, "Chip #", chip_id, hex(data)[:4])
      print "    --------------------------------------------------------------"
  print "   ================================================================"    

def ReadChipDataTest():
  print "!!!!!!!!!!!!!!!! Reading Out Data (TEST): !!!!!!!!!!!!!"
  print "   ================================================================"
  print "   | Hybrid ID             || Chip ID             || DATA         |"
  print "   ================================================================"
  for i in range(0,8):
      reply = fc7.read("data_chip_"+str(i))
      hybrid_id = DataFromMask(reply, "ctrl_i2c_reply_hybrid_id")
      chip_id = DataFromMask(reply, "ctrl_i2c_reply_chip_id")
      data = DataFromMask(reply, "ctrl_i2c_reply_data")
      print '   | %s %-12i || %s %-12i || %-12s |' % ("Hybrid #", hybrid_id, "Chip #", chip_id, hex(data)[:4])
      print "    --------------------------------------------------------------"
  print "   ================================================================"    

# tests the fast commands
def FastTester():
	################
	## fast config #
	################
	trigger_source = 3
	triggers_to_accept = 0
	trigger_divider = 2
	trigger_stubs_mask = 3
	################
	
	ReadStatus("Before Configuration")
	Configure_Fast(triggers_to_accept, trigger_divider, trigger_source, trigger_stubs_mask)
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
	command_i2c = 1
	hybrid_id = 1
	chip_id = 2
	use_mask = 0
	page = 1
	# 0 - write, 1 - read
	read = 1
	register = 2
	data = 15
	################
	
	ReadStatus("Before I2C Configuration")
	Configure_I2C(255)
	ReadStatus("After I2C Configuration")
	SendCommand_CTRL("reset_i2c")
	ReadStatus("After I2C Reset")
	
	#for i in range (0,3):
	#SendCommand_I2C(0, hybrid_id, chip_id, use_mask, page, read, register, data)
	SendCommand_I2C(command_i2c, hybrid_id, chip_id, use_mask, page, read, register, data)

	
	ReadStatus("After Send Command")
	ReadChipData()
	#ReadChipDataTest()
	ReadStatus("After Read Reply")	

####################
## Program Running #
####################
#FastTester()
I2CTester()
print "IPBus Clock Rate: ", fc7.read("stat_rate_ipb")
print "40MHz Clock Rate: ", fc7.read("stat_rate_40mhz")
