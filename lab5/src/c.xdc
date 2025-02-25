set_property PACKAGE_PIN U7 [get_ports {c[0]}]
set_property PACKAGE_PIN W7 [get_ports {c[6]}]
set_property PACKAGE_PIN W6 [get_ports {c[5]}]
set_property PACKAGE_PIN U8 [get_ports {c[4]}]
set_property PACKAGE_PIN V8 [get_ports {c[3]}]
set_property PACKAGE_PIN U5 [get_ports {c[2]}]
set_property PACKAGE_PIN V5 [get_ports {c[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {c[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports a1]
set_property IOSTANDARD LVCMOS33 [get_ports a2]
set_property IOSTANDARD LVCMOS33 [get_ports a3]
set_property IOSTANDARD LVCMOS33 [get_ports a4]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN W4 [get_ports a1]
set_property PACKAGE_PIN V4 [get_ports a2]
set_property PACKAGE_PIN U4 [get_ports a3]
set_property PACKAGE_PIN U2 [get_ports a4]
set_property PACKAGE_PIN W5 [get_ports clk]
set_property PACKAGE_PIN U18 [get_ports rst]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clock_IBUF]

#flash
set_property CFGBVS VCCO [current_design] 
set_property CONFIG_VOLTAGE 3.3 [current_design] 
set_property BITSTREAM.GENERAL.COMPRESS true [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
#flash