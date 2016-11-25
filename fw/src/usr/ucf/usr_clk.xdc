########################################################
set_property IOSTANDARD LVDS_25                [get_ports fabric_clk_p]
set_property PACKAGE_PIN AK18                  [get_ports fabric_clk_p]
create_clock -period 24.000 -name fabric_clk   [get_ports fabric_clk_p]
########################################################
set_clock_groups -asynchronous \
    -group [get_clocks -include_generated_clocks eth_txoutclk] \
    -group [get_clocks -include_generated_clocks osc125_a] \
    -group [get_clocks -include_generated_clocks osc125_b] \
    -group [get_clocks -include_generated_clocks fabric_clk]
########################################################
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]
########################################################
set_operating_conditions -airflow 0
set_operating_conditions -heatsink low
########################################################
set_property PACKAGE_PIN AA8                   [get_ports ttc_mgt_xpoint_b_p]
set_property PACKAGE_PIN AA7                   [get_ports ttc_mgt_xpoint_b_n]
create_clock -period 24.000 -name ttc_mgt_xpoint_b      [get_ports ttc_mgt_xpoint_b_p]