# 固化烧录

- tools -> Settings -> Bitstream -> `--bin-file`

- Hardware manager -> 右键 -> Add Configuration memory device -> s25fl032p

Add to constraints:

```xdc
#flash
set_property CFGBVS VCCO [current_design] 
set_property CONFIG_VOLTAGE 3.3 [current_design] 
set_property BITSTREAM.GENERAL.COMPRESS true [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
#flash
```
