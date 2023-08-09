Following options can be configured within OPNSense to decrease the power usage.

```
hw.acpi.cpu.cx_lowest = C3
hw.ibrs_disable = 1
vm.pmap.pti = 0
dev.hwpstate_intel.0.epp = 99
dev.hwpstate_intel.1.epp = 99
dev.hwpstate_intel.2.epp = 99
dev.hwpstate_intel.3.epp = 99
```
