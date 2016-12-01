from PyChipsUser import *
import sys
import os
from time import sleep
fc7AddrTable = AddressTable("./fc7Addr.dat")

########################################
# IP address
########################################
f = open('./ipaddr.dat', 'r')
ipaddr = f.readline()
f.close()
fc7 = ChipsBusUdp(fc7AddrTable, ipaddr, 50001)
#############
# Combine and Send Command
def SendCommand_I2C(cmd_type, hybrid_id, chip_id, read, page, register_address, write_mask, data):

  raw_cmd_type = fc7AddrTable.getItem("cmd_type").shiftDataToMask(cmd_type)
  raw_hybrid_id = fc7AddrTable.getItem("i2c_hybrid_id").shiftDataToMask(hybrid_id)
  raw_chip_id = fc7AddrTable.getItem("i2c_chip_id").shiftDataToMask(chip_id)
  raw_read = fc7AddrTable.getItem("i2c_read").shiftDataToMask(read)
  raw_page = fc7AddrTable.getItem("i2c_page").shiftDataToMask(page)
  raw_register = fc7AddrTable.getItem("i2c_register_address").shiftDataToMask(register_address)
  raw_mask = fc7AddrTable.getItem("i2c_write_mask").shiftDataToMask(write_mask)
  raw_data = fc7AddrTable.getItem("i2c_data").shiftDataToMask(data)

  cmd1 = raw_cmd_type + raw_hybrid_id + raw_chip_id + raw_read + raw_page
  cmd2 = raw_register + raw_mask + raw_data;

  description = "Command: type = " + str(cmd_type) + ", hybrid = " + str(hybrid_id) + ", chip = " + str(chip_id)

  #print hex(cmd1)
  #print hex(cmd2)

  # to be sure that command is changed
  fc7.write("command_processor_cmd_in1", 0);
  # always write cmd2 before cmd1 because execution starts when cmd1 changed. cmd2 might be not updated if written after
  fc7.write("command_processor_cmd_in2", cmd2);
  fc7.write("command_processor_cmd_in1", cmd1);
  return description

def ReadStatus(name = "Current Status"):
  print "============================"
  print name,":"
  print "   -> status command:", fc7.read("status_cmd_command")
  print "   -> fsm state:", fc7.read("status_cmd_fsm")
  print "   -> status error:", hex(fc7.read("status_cmd_error"))
  print "   -> data ready:", fc7.read("status_cmd_data_ready")
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

# cmd_type
# 1 - setting register value to a certain hybrid,chip;
# 2 - setting register value to all chips within a certain hybrid;
# 3 - setting register value to all chips all Hybrids;
cmd_type = 3
hybrid_id = 1
chip_id = 2
# 0 - write, 1 - read
read = 1
page = 0
register = 24
mask = 10
data = 13

SendCommand_I2C(0,0,0,0,0,0,0,0)
ReadStatus(SendCommand_I2C(cmd_type, hybrid_id, chip_id, read, page, register, mask, data))
if read == 1:
    if cmd_type == 3:
        for hybrid in range(0,3):
            ReadChipData(hybrid)
    else:
        ReadChipData(hybrid_id)


