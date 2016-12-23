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
def SendCommand_I2C(command, hybrid_id, chip_id, use_mask, page, read register_address, data):

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

  fc7.write("ctrl_i2c_command_fifo", cmd);
  return description

# Send command ctrl
def SendCommand_CTRL(command = "none")
    if name == "none":
        print "Sending nothing"
    elif name == "global_reset":
        fc7.write("ctrl_global_reset", 1);
    elif name == "reset_trigger":
        fc7.write("ctrl_fast_reset", 1);
    elif name == "start_trigger":
        fc7.write("ctrl_fast_start", 1);
    elif name == "stop_trigger":
        fc7.write("ctrl_fast_stop", 1);
    elif name == "load_config":
        fc7.write("ctrl_fast_load_config", 1);
    elif name == "reset_i2c":
        fc7.write("ctrl_i2c_reset", 1);
    elif name == "reset_i2c_fifos":
        fc7.write("ctrl_i2c_reset_fifos", 1);
    else:
        print "Unknown Command"

# Configure Fast Block
def Configure_Fast(triggers_to_accept, divider, source, stubs_mask):

  fc7.write("cnfg_fast_triggers_to_accept", triggers_to_accept)
  fc7.write("cnfg_fast_divider", divider)
  ready_source = fc7AddrTable.getItem("cnfg_fast_source").shiftDataToMask(source)
  fc7.write("cnfg_fast_source", ready_source)
  fc7.write("cnfg_fast_mask", stubs_mask)
  SendCommand_CTRL("global_reset")
  sleep(1)
  SendCommand_CTRL("load_config")


def ReadStatus(name = "Current Status"):
  print "============================"
  print name,":"
  print "   -> status error block id:", hex(fc7.read("stat_error_block_id"))
  print "   -> status error code:", hex(fc7.read("stat_error_code"))
  print "   -> interpretion: "
  fc7ErrorHandler.getErrorDescription(fc7.read("stat_error_block_id"),fc7.read("stat_error_code"))
  print "   -> data ready:", fc7.read("status_cmd_data_ready")
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
  print "============================"

#def ReadChipData(hybrid_id):
#  print "Reading Out Data:"
#  while fc7.read("status_cmd_data_ready") == 1:
#      print "   Hybrid #", hybrid_id
#      print "   ======================================="
#      print "   | Chip ID             || DATA         |"
#      print "   ======================================="
#      for id in range(0,8):
#        print '   | %s %-12i || %-12s |' % ("Chip #", id, hex(fc7.read("chip_data_"+str(id)))[:4])
#        print "    ---------------------------------------"
#      print "   ======================================="


#############

###############
## i2c region #
###############
command_i2c = 0
hybrid_id = 1
chip_id = 1
use_mask = 0
page = 0
# 0 - write, 1 - read
read = 1
register = 24
data = 13
################

################
## fast region #
################
trigger_source = 1
triggers_to_accept = 0
trigger_divider = 4
trigger_stubs_mask = 3
################

#ReadStatus(SendCommand_I2C(command_i2c, hybrid_id, chip_id, use_mask, page, read, register, data))

ReadStatus()
Configure_Fast(triggers_to_accept, trigger_divider, trigger_source, trigger_stubs_mask)
ReadStatus()
SendCommand_CTRL("start_trigger")
ReadStatus()
