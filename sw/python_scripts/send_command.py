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
def SendCommand_I2C(command, hybrid_id, chip_id, read, page, register_address, write_mask, data):

  raw_command = fc7AddrTable.getItem("command").shiftDataToMask(command)
  raw_hybrid_id = fc7AddrTable.getItem("i2c_hybrid_id").shiftDataToMask(hybrid_id)
  raw_chip_id = fc7AddrTable.getItem("i2c_chip_id").shiftDataToMask(chip_id)
  raw_read = fc7AddrTable.getItem("i2c_read").shiftDataToMask(read)
  raw_page = fc7AddrTable.getItem("i2c_page").shiftDataToMask(page)
  raw_register = fc7AddrTable.getItem("i2c_register_address").shiftDataToMask(register_address)
  raw_mask = fc7AddrTable.getItem("i2c_write_mask").shiftDataToMask(write_mask)
  raw_data = fc7AddrTable.getItem("i2c_data").shiftDataToMask(data)

  cmd1 = raw_command + raw_hybrid_id + raw_chip_id + raw_read + raw_page
  cmd2 = raw_register + raw_mask + raw_data;

  description = "Command: type = " + str(command) + ", hybrid = " + str(hybrid_id) + ", chip = " + str(chip_id)

  #print hex(cmd1)
  #print hex(cmd2)

  # to be sure that command is changed
  fc7.write("command_processor_cmd_in1", 0);
  # always write cmd2 before cmd1 because execution starts when cmd1 changed. cmd2 might be not updated if written after
  fc7.write("command_processor_cmd_in2", cmd2);
  fc7.write("command_processor_cmd_in1", cmd1);
  return description

# Combine and Send FAST Command
def SendCommand_Fast(command, trigger_source,trigger_mode,triggers_to_accept,trigger_divider,trigger_stubs_mask):

  raw_command = fc7AddrTable.getItem("command").shiftDataToMask(command)
  raw_source = fc7AddrTable.getItem("trigger_source").shiftDataToMask(trigger_source)
  raw_mode = fc7AddrTable.getItem("trigger_mode").shiftDataToMask(trigger_mode)

  cmd1 = raw_command + raw_source + raw_mode
  cmd2 = triggers_to_accept
  cmd3 = trigger_divider
  cmd4 = trigger_stubs_mask

  description = "Command: type = " + str(command) + ", trigger_source = " + str(trigger_source) + ", trigger_mode = " + str(trigger_mode)

  #print hex(cmd1)
  #print hex(cmd2)

  # to be sure that command is changed
  fc7.write("command_processor_cmd_in1", 0);
  # always write cmd2/3/4 before cmd1 because execution starts when cmd1 changed. cmd2/3/4 might be not updated if written after
  fc7.write("command_processor_cmd_in4", cmd4);
  fc7.write("command_processor_cmd_in3", cmd3);
  fc7.write("command_processor_cmd_in2", cmd2);
  fc7.write("command_processor_cmd_in1", cmd1);
  return description

def ReadStatus(name = "Current Status"):
  print "============================"
  print name,":"
  print "   -> last command:", fc7.read("status_cmd_command")
  print "   -> processor fsm state:", fc7.read("status_cmd_fsm")
  print "   -> status error block id:", hex(fc7.read("status_cmd_error_block_id"))
  print "   -> status error code:", hex(fc7.read("status_cmd_error_code"))
  print "   -> interpretion: "
  fc7ErrorHandler.getErrorDescription(fc7.read("status_cmd_error_block_id"),fc7.read("status_cmd_error_code"))
  print "   -> data ready:", fc7.read("status_cmd_data_ready")
  temp_source = fc7.read("status_trigger_source")
  temp_source_name = "Unknown"
  if temp_source == 1:
    temp_source_name = "L1-Trigger"
  elif temp_source == 2:
    temp_source_name = "Stubs"
  elif temp_source == 3:
    temp_source_name = "User Frequency"
  print "   -> trigger source:", temp_source_name
  temp_mode = fc7.read("status_trigger_mode")
  temp_mode_name = "Unknown"
  if temp_mode == 0:
    temp_mode_name = "Idle"
  elif temp_mode == 1:
    temp_mode_name = "Continuous Triggering"
  elif temp_mode == 2:
    temp_mode_name = "Single"
  elif temp_mode == 3:
    temp_mode_name = "Finished Single"
  print "   -> trigger mode:", temp_mode_name
  print "============================"

def ReadChipData(hybrid_id):
  if fc7.read("status_cmd_data_ready") == 1:
      print "   Hybrid #", hybrid_id
      print "   ======================================="
      print "   | Chip ID             || DATA         |"
      print "   ======================================="
      for id in range(0,8):
        print '   | %s %-12i || %-12s |' % ("Chip #", id, hex(fc7.read("chip_data_"+str(id)))[:4])
        print "    ---------------------------------------"
      print "   ======================================="
      fc7.write("data_processed",hybrid_id)
  else:
      print "!!! ERROR: The data is not present for Hybrid #", hybrid_id

#############

# command
# 1 - i2c, setting/reading register value to/from a certain hybrid,chip;
# 2 - i2c, setting/reading register value to/from all chips within a certain hybrid;
# 3 - i2c, setting/reading register value to/from all chips all Hybrids;
# 9 - fast, changing triggering settings;

###############
## i2c region #
###############
command_i2c = 3
hybrid_id = 1
chip_id = 1
# 0 - write, 1 - read
read = 1
page = 0
register = 24
mask = 10
data = 13
################

################
## fast region #
################
command_fast = 10
trigger_source = 1
trigger_mode = 1
triggers_to_accept = 10
trigger_divider = 4
trigger_stubs_mask = 3
################

SendCommand_I2C(0,0,0,0,0,0,0,0)
ReadStatus(SendCommand_I2C(command_i2c, hybrid_id, chip_id, read, page, register, mask, data))
if read == 1:
    if command_i2c == 3:
        for hybrid in range(0,3):
            ReadChipData(hybrid)
    else:
        ReadChipData(hybrid_id)

#ReadStatus()
#trigger_source = 2
#trigger_mode = 1
#ReadStatus(SendCommand_Fast(command_fast, trigger_source,trigger_mode,triggers_to_accept,trigger_divider,trigger_stubs_mask))
#sleep(20)
#ReadStatus()


