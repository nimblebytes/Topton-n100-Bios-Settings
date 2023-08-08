# Topton-n100-Bios-Settings
Bios settings for the CWWK/Topton N100 mini PC  for efficient power usage.

The purpose of this list, is to summarize and document all the BIOS setting proposed on the ServerTheHome.com forum for ***power efficent*** usage on the N100.

## References
- The N100 mini PC: [serverthehome.com N100 Review](https://www.servethehome.com/fanless-intel-n100-firewall-and-virtualization-appliance-review/)
- Inspiration for BIOS settings: [serverthehome.com N100 Forum](https://forums.servethehome.com/index.php?threads/cwwk-topton-nxxx-quad-nic-router.39685/)

## Devices on the motherboard
Running the ``lsusb`` command
```
  Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
  Bus 001 Device 003: ID 05e3:0751 Genesys Logic, Inc. microSD Card Reader
  Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

# N100 BIOS Sections
Each main page will be discussed as it's own section. Submenus are discussed in the subsection that follows
(Photos of Bios)[https://forums.servethehome.com/index.php?threads/cwwk-topton-nxxx-quad-nic-router.39685/page-2]
- **Not all settings are listed, just the ones that are relevant or changed**
## Section 1

| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| Turbo Ratio Limit Options    | <Submenu>   | - | Max CPU multiplier during turbo boost, affecting performance for intensive tasks.|
| Energy Efficient P-state     | ``Enabled`` | - | Dynamically adjusts CPU power state for balanced performance and energy efficiency.|
| Package Power Limit MSR Lock | `Disabled`` | - | Prevents user changes to CPU package power limits for enhanced system stability.|
| Power Limit 1 Override       | ``Enabled`` | - | Overrides default CPU power limit, potentially improving performance at higher power usage.|
| Power Limit 1                | ~~10000~~ 8000 | x | Sets max sustainable CPU power (in milliwatts) under normal conditions, influencing performance and thermal behavior. |
| Power Limit 1 Time Window    | 0           | - | Determines duration for CPU power consumption at Power Limit 1 before adjustments, affecting short-term performance. |
| Power Limit 2 Override       | ``Enabled`` | - | Overrides secondary CPU power limit for brief performance boosts.|
| Power Limit 2                | 25000       | x | Establishes secondary CPU power threshold (in milliwatts), potentially higher than Power Limit 1, for short-duration tasks. |
| Energy Efficient Turbo       | ``Enabled`` |   | Optimizes turbo boost for balanced energy usage and performance during sustained workloads. |
> [!NOTE]
> Power Limit 1 (PL1) and Power Limit 2 (PL2) are parameters commonly found in modern CPUs' power management systems. These parameters play a significant role in determining how much power the CPU can consume and for how long under different operating conditions.
> - PL1 is used to define the maximum sustainable power consumption of the CPU over a longer period of time. It helps control the CPU's average power usage under typical workloads.
> - PL2 is designed to accommodate brief periods of increased CPU power usage, such as during bursts of intense computational tasks or short-term performance boosts.
> - The Power Limit 1 Time Window (PL1 Time Window) is a CPU parameter that dictates the duration during which the CPU can operate near its maximum power limit (PL1), balancing short bursts of high-performance tasks while preventing prolonged overheating. It enables efficient power management by allowing controlled performance boosts within defined time intervals while respecting thermal and power constraints.

## Section 2
## Section 3
