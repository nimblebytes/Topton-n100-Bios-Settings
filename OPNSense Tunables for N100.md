Following options can be configured within OPNSense to decrease the power usage.

```
hw.acpi.cpu.cx_lowest = C3
hw.ibrs_disable = 1          ## Disable Spectre V2 mitigation. Both AMD and Intel CPU affect.
hw.igc.eee_setting = 0       ## Enables energy efficient NIC settings in the driver.
vm.pmap.pti = 0              ## Disable Meltdown mitigation (PTI). Safe for AMD CPUs
dev.igc.0.epp = 0
dev.igc.1.epp = 0
dev.igc.2.epp = 0
dev.igc.3.epp = 0
```
> [:NOTE]
> These changes only make sense on a direct install, or if in Proxmox the processor is type "host" and the NICs are directly passed through.
> Additional information regarding the CPU mitigations: ![OPNSense - Hardening](https://docs.opnsense.org/troubleshooting/hardening.html#spectre-and-meltdown)

# Optional - Power savings

Prevent the random number generator from using the network as an entropy source[^1].
[^1]: [FressBSD - Network Performance Tuning](https://wiki.freebsd.org/NetworkPerformanceTuning)

Additional line in `/etc/rc.conf`
```
harvest_mask="351"
```

