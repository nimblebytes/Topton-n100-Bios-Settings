Following options can be configured within OPNSense to decrease the power usage.

```
hw.acpi.cpu.cx_lowest = C3
hw.ibrs_disable = 1
hw.igc.eee_setting = 0       \#\# enables energy efficient NIC settings in the driver
vm.pmap.pti = 0
dev.igc.0.epp = 0
dev.igc.1.epp = 0
dev.igc.2.epp = 0
dev.igc.3.epp = 0

```

#Optional - Power savings

The random data generator uses multiple sources as input, and two of them are interrupts and net data. The mask removes these two from the list. I haven't found details about security issues with a less good random seed, so...

Additional line in `/etc/rc.conf`
```
harvest_mask="351"
```

- The random data generator uses multiple sources as input, and two of them are interrupts and net data. The mask removes these two from the list. I haven't found details about security issues with a less good random seed, so...
more info: https://papers.freebsd.org/2018/asi...reebsd_for_routing_and_firewalling-slides.pdf
