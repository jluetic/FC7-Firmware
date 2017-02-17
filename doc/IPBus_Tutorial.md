## Introduction

This short guide is to help developer to establish IPBus transactions for his block (extend existing interface)


## 1. Bus Declaration

There are 3 general types of registers: configuration, control and status.
They are placed in **fw/src/usr/ipbus_slaves/**:

* ipbus_decoder_cnfg.vhd
* ipbus_decoder_ctrl.vhd
* ipbus_decoder_stat.vhd

Data buses has to be established: control and configuration buses from IPBus slaves to the block, and status bus from the block to the ipbus_decoder_stat.vhd file.

The buses have to be defined in **fw/src/usr/usr/user_package_basic.vhd** file.
The general template is:

```javascript
-- Configuration bus from IPBus to the block_name
type cnfg_block_name_type is
record
 	dummy_vector        : std_logic_vector(3 downto 0); 
end record; 
    
-- Control bus from IPBus to the block_name
type ctrl_block_name_type is
record
	dummy_vector        : std_logic_vector(3 downto 0);
end record;
  
-- Status bus from IPBus to the block_name  
type stat_block_name is
record
	dummy_vector        : std_logic_vector(3 downto 0);
end record;
```

Then they have to be added to the ipbus_decoder_cnfg.vhd, ipbus_decoder_ctrk.vhd, ipbus_decoder_stat.vhd and connected in **fw/src/usr/usr/user_core.vhd

## 2. Memory Allocation

Then IPBus registers have to be allocated in the **fw/src/usr/ipbus_slaves/register_map_package.vhd** file.
There is the register map defined there:


```javascript
--================================================================================================================================================--
-- Set amount of allocated registers here
--================================================================================================================================================--
constant fc7_register_map : register_map :=
    (0  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  2,      block_name  =>  "global__" ),
    1   => ( register_width_cnfg =>  8,      register_width_ctrl =>  8,      register_width_stat =>  8,      block_name  =>  "command_" ),
    2   => ( register_width_cnfg =>  8,      register_width_ctrl =>  8,      register_width_stat =>  8,      block_name  =>  "fast____" ),
    3   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "phy_____" ),
    4   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "hybrid__" ),
    5   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "data____" ),
    6   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    7   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    8   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    9   => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    10  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    11  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    12  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    13  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    14  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  0,      block_name  =>  "na______" ),
    15  => ( register_width_cnfg =>  0,      register_width_ctrl =>  0,      register_width_stat =>  4,      block_name  =>  "test_clk" )
); 
--================================================================================================================================================--
```

Parameters **register_width_cnfg, register_width_ctrl, register_width_stat** are responsible for the amount of 32bit registers allocated.

## 3. Connecting Buses to the IPBus Lines

Go to one of the IPBus slave, for instance **fw/src/usr/ipbus_slaves/ipbus_decoder_cnfg.vhd**.
Sample address mapping is below:
```javascript
-- i2c mask to write the register
constant COMMAND_BLOCK_I2C_WRITE_MASK_SEL           : integer := convert_address(x"1_001",reg_type);
constant COMMAND_BLOCK_I2C_WRITE_MASK_OFFSET        : integer := 0;
constant COMMAND_BLOCK_I2C_WRITE_MASK_WIDTH          : integer := 8;
```
The address is given in the format **x"1_001"**, where **1_** is the number of the block (0 to F currently), **_001** is the address of the register inside the block (has to correspond the allocated memory width) 

Then at the end of the file register has to be connected to the corresponding bus:
```javascript
cnfg_command_block_o.i2c_mask <= regs(COMMAND_BLOCK_I2C_WRITE_MASK_SEL)(COMMAND_BLOCK_I2C_WRITE_MASK_OFFSET + COMMAND_BLOCK_I2C_WRITE_MASK_WIDTH -1 downto COMMAND_BLOCK_I2C_WRITE_MASK_OFFSET);
```

*** The same has to be done in the control and status registers ***

Good Luck.
