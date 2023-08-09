# Topton-n100-Bios-Settings
Bios settings for the CWWK/Topton N100 mini PC for efficient power usage.

The purpose of this list, is to document _most_ of the BIOS settings of the N100 mini PC [^1] and track the necessary settings for ***power efficent*** usage. Most of the selected setting were proposed and gather from the ServerTheHome.com forums [^2].
 
## References
- [^1]: The N100 mini PC - [serverthehome.com N100 Review](https://www.servethehome.com/fanless-intel-n100-firewall-and-virtualization-appliance-review/)
- [^2]: Inspiration for BIOS settings: [serverthehome.com N100 Forum](https://forums.servethehome.com/index.php?threads/cwwk-topton-nxxx-quad-nic-router.39685/)

# Summary of Implemented BIOS changes
1. Main
   - System Lanuage => `English`
   - System Date => `<Current Date>`
   - System Time => `<Current Time>`
2. Advanced
   - ?? ➡️ ??
     - Power Limit 4 => `Override`
   - ?? ➡️ ??
     - Platform PL1 => `Disabled`
     - Platform PL2 => `Disabled`
   - ?? ➡️ ??
     - Package PL1 => `12500`
     - Package PL2 => `25000`
     - Energy Efficient Turbo => `Enable`
   - ?? C States => `Enable`
   - ??Package limit => `C10`
   - ?? PECI => `Disabled`
   - ?? ➡️ EPB override over PECI => `Enable`
4. Chipset
   - PCH-IO Config ➡️ PCI Express Config
     - PCI Root \#1-6;8-10
       - ASPM => `Auto`
       - L1 Substates => `L1.1&L1.2`
       - L1 low => `Enable`          
     - PCI Root \#7 ℹ️ Needed for networking within Ubuntu
       - ASPM => `Auto`
       - L1 Substates => `Disabled`
       - L1 low => `Enable`   
5. Security
   - ?? ➡️ SM3_256 PCR Bank => `Disabled` ❗

- All unneeded hardware off: sound, emmc, sata, tpm
~~- PECI off (found in the N5105 thread)~~
~~- EPB override over PECI enabled~~
- Platform PL1&2 disabled (no time yet to play with)
~~- power limit 4 override disabled~~
~~- Package PL1 = 10000, PL2 = 25000, Energy eff- turbo enabled~~
~~- C-States enabled, Package limit C10~~

~~Chipset -> PCH-IO Config -> PCI Express Config: every PCI root except #7 : ASPM auto, L1 Substates L1.1&L1.2, L1 low = enabled. On port 7 ASPM auto, L1 substaes disabled, L1 low enabled - otherwise network under Ubuntu wasn't working.~~


## Devices on the motherboard
Running the `lsusb` command
```
  Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
  Bus 001 Device 003: ID 05e3:0751 Genesys Logic, Inc. microSD Card Reader
  Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

# N100 BIOS Sections
Each main page will be discussed as it's own section. Submenus are discussed in the subsection that follows
[Photos of Bios](https://forums.servethehome.com/index.php?threads/cwwk-topton-nxxx-quad-nic-router.39685/page-2)
- **Not all settings are listed, just the ones that are relevant or changed**

## Main 
| Setting | Value  | Adjusted | 
|-|-|-|
| System Lanuage   | `English` | x | 
| System Date     | `<Current Date>` | x | 
| System Time | `<Current Time>` | x | 
 
## Advanced
| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| Efficient-Core Information   | _\<submenu\>_ | - | Indicates whether efficient (low-power) CPU cores are available and functioning. |
| Performance-Core Information | _\<submenu\>_ | - | Indicates whether high-performance CPU cores are available and functioning. |
| _\<static values\>_          | - | - | _Unchanging parameter values in the BIOS_. |
| C6DRAM                       | `Enabled` | - | Activates the C6DRAM power-saving state to reduce memory controller power consumption. |
| CPU Flex Ratio Override      | `Disabled` | - | Allows manual control over the CPU's frequency ratio, potentially impacting performance. |
| CPU Flex Ratio Settings      | 8  | - | Provides settings for adjusting the CPU's frequency ratio under different operating conditions. |
| Hardware Prefetch            | `Enabled` | - | Enables hardware-based prefetching of data to improve CPU performance. |
| Intel (VMX) Virtualization Technology | `Enabled` | - | Enables hardware-assisted virtualization support for virtual machine performance optimization. |
| PECI                         | `Enabled` | - | Enables Platform Environment Control Interface (PECI) communication for thermal monitoring. |
| AVX                          | `Enabled` | - | Enables support for Advanced Vector Extensions (AVX) instructions for enhanced performance. |
| Active Efficient-cores       | `All` | - | Indicates the current activation status of efficient (low-power) CPU cores. |
| BIST                         | `Disabled` | - | Built-In Self-Test (BIST) checks for CPU functionality during boot to detect potential issues. |
| AP Threads Idle Manner       | `MWAIT Loop`  | - | Determines the idle behavior of Application Processor (AP) threads, potentially affecting power. |
| AES                          | `Enabled` | - | Enables Advanced Encryption Standard (AES) instruction support for improved encryption performance. |
| Machine Check                | `Enabled` | - | Enables the Machine Check Architecture (MCA) for hardware error detection and correction. |
| MonitorMWait                 | `Enabled` | - | Enables support for the MONITOR and MWAIT instructions, enhancing power management efficiency. |

## Section 2

| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| \<more\>                                | - | - | _Placeholder for additional BIOS settings_. |
| Intel Speed Shift Technology  | `Enabled` | - | Enables dynamic adjustment of CPU frequency and voltage for faster response to workload changes. |
| Per Core p State OS control mode | `Enabled` | - | Allows the operating system to manage individual core power states for optimized performance. |
| HwP Autonomous Per Core P State | `Enabled` | - | Enables each core to autonomously select its power state based on workload demands. |
| HwpP Autonomous EPP Grouping | `Enabled` | - | Provides hardware-based Energy Performance Preference (EPP) grouping for efficient power management. |
| EPB override over PECI | `Disabled` | - | Allows the OS to override Energy Performance Bias (EPB) settings via Platform Environment Control Interface (PECI). |
| HwP Lock                  | `Enabled` | - | Locks hardware-controlled core power states to prevent autonomous changes by the CPU. |
| HDC Control               | `Enabled` | - | Allows Host-Directed Communication (HDC) between the OS and the Intel Management Engine (ME). |
| Turbo Mode                | `Enabled` | - | Enables or disables the CPU's turbo boost mode for improved performance under heavy workloads. |
| View/Configure Turbo Options | _\<submenu\>_ | - | Accesses options to view and configure turbo boost parameters for the CPU. |
| CPU VR Settings           | _\<submenu\>_ | - | Controls the CPU voltage regulator (VR) settings for managing CPU power delivery. |
| Platform PL 1 Enable      | `Enabled` | - | Enables or disables the first platform power limit (PL1) for controlling CPU power consumption. |
| Platform PL1 Power        | 12500 | - | Specifies the maximum power consumption allowed under the first platform power limit (PL1), controlling sustained CPU performance and thermal behavior. |
| Platform PL 1 Time Window | 0 | - | Sets the time duration for the first platform power limit (PL1) to regulate CPU power consumption. |
| Platform PL2 Enable       | `Enabled` | - | Enables or disables the second platform power limit (PL2) for managing short-term CPU power. |
| Platform PL2 Power        | 25000 | - | Defines the maximum power consumption allowed under the second platform power limit (PL2). |
| Power Limit 4 Override    | `Disabled` | - | Allows overriding power limit 4 (PL4) settings for fine-tuning CPU power consumption. |
| C States                  | `Enabled` | - | Controls the processor's C states (idle power states) to manage power consumption during inactivity. |
| Enhanced c-States         | `Enabled` | - | Enables advanced, deeper CPU idle power states (C states) for more efficient energy usage. |
| C-States Auto Demotion    | `C1` | - | Allows automatic demotion of C states to reduce latency and improve performance under light loads. |
| C-State Un-Demotion       | `C1` | - | Allows automatic un-demotion of C states to optimize power and performance transitions. |

### <section> ➡️ Advanced

| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| Turbo Ratio Limit Options    | _\<submenu\>_   | - | Max CPU multiplier during turbo boost, affecting performance for intensive tasks. |
| Energy Efficient P-state     | `Enabled` | - | Dynamically adjusts CPU power state for balanced performance and energy efficiency. |
| Package Power Limit MSR Lock | `Disabled` | - | Prevents user changes to CPU package power limits for enhanced system stability. |
| Power Limit 1 Override       | `Enabled` | - | Overrides default CPU power limit, potentially improving performance at higher power usage. |
| Power Limit 1                | ~~10000~~ 8000 | x | Sets max sustainable CPU power (in milliwatts) under normal conditions, influencing performance and thermal behavior. |
| Power Limit 1 Time Window    | 0           | - | Determines duration for CPU power consumption at Power Limit 1 before adjustments, affecting short-term performance. |
| Power Limit 2 Override       | `Enabled` | - | Overrides secondary CPU power limit for brief performance boosts. |
| Power Limit 2                | 25000       | x | Establishes secondary CPU power threshold (in milliwatts), potentially higher than Power Limit 1, for short-duration tasks. |
| Energy Efficient Turbo       | `Enabled` |   | Optimizes turbo boost for balanced energy usage and performance during sustained workloads. |
> [!NOTE]
> - Platform PL1 vs Power Limit 1 (PL1): Platform PL1 refers to the first platform power limit, which is a power consumption threshold defined for the entire platform, including the CPU, integrated graphics, and other components; while Power Limit 1, is a power consumption limit specifically associated with the CPU.
> - Power Limit 1 (PL1) and Power Limit 2 (PL2) are parameters commonly found in modern CPUs' power management systems. These parameters play a significant role in determining how much power the CPU can consume and for how long under different operating conditions.
> - PL1 is used to define the maximum sustainable power consumption of the CPU over a longer period of time. It helps control the CPU's average power usage under typical workloads.
> - PL2 is designed to accommodate brief periods of increased CPU power usage, such as during bursts of intense computational tasks or short-term performance boosts.
> - The Power Limit 1 Time Window (PL1 Time Window) is a CPU parameter that dictates the duration during which the CPU can operate near its maximum power limit (PL1), balancing short bursts of high-performance tasks while preventing prolonged overheating. It enables efficient power management by allowing controlled performance boosts within defined time intervals while respecting thermal and power constraints.


## Chipset
| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| PCI Express Configuration                | _\<submenu\>_ | - | Configures various settings related to PCI Express interfaces. |
| SATA Configuration                       | _\<submenu\>_ | - | Configures settings for Serial ATA (SATA) interfaces and drives. |
| USB Configuration                        | _\<submenu\>_ | - | Configures USB (Universal Serial Bus) settings and behavior. |
| Security Configuration                   | _\<submenu\>_ | - | Manages security-related settings, such as password protection and authentication. |
| HD Audio Configuration                   | _\<submenu\>_ | - | Configures settings for High Definition Audio (HD Audio) interfaces and devices. |
| THC Configuration                        | _\<submenu\>_ | - | Configures settings for Trusted Hardware Configuration (THC) features. |
| SerialIO Configuration                   | _\<submenu\>_ | - | Configures settings for Serial I/O interfaces, such as UART and SPI. |
| SCS Configuration                        | _\<submenu\>_ | - | Configures settings for System Control and Services (SCS) interfaces. |
| ISH Configuration                        | _\<submenu\>_ | - | Configures settings for Intel Sensor Hub (ISH) interfaces. |
| PCH Thermal Throttling Control           | _\<submenu\>_ | - | Manages thermal throttling and protection mechanisms for the Platform Controller Hub (PCH). |
| Skip VCCIN_AUX Configuration            | `Disabled` | - | Configures settings related to VCCIN_AUX voltage rail. |
| FIVR Configuration                      | _\<submenu\>_ | - | Configures settings for Fully Integrated Voltage Regulator (FIVR) if present. |
| PMC Configuration                        | _\<submenu\>_ | - | Configures settings for Platform Management Controller (PMC) features. |
| PCH LAN Controller                      | _<static>_ | - | Configures settings for the Platform Controller Hub (PCH) LAN controller. |
| Sensor Hub Type                         | `None` | - | Specifies the type and behavior of the sensor hub on the motherboard. |
| DeepSx Power Policies                   | `Disabled` | - | Configures power policies for system states with deep power savings (e.g., S3, S4). |
| Wake On WLAN and BT Enable              | `Disabled` | - | Enables or disables Wake On WLAN and Bluetooth functionality. |
| Disable DSX ACPRESENT Pulldown          | `Disabled` | - | Manages the pulldown behavior of the DSX ACPRESENT signal. |
| Port 80h Redirection                    | `LPC Bus` | - | Controls the redirection of Port 80h POST code display to different interfaces. |
| Enhanced Port 80h LPC Decoding          | `Enabled` | - | Enhances Port 80h POST code decoding for LPC (Low Pin Count) interfaces. |
| Compatible Revision ID                  | `Disabled` | - | Specifies the revision ID compatibility for PCIe devices. |
| \<more\>                                | - | - | _Placeholder for additional BIOS settings_. |

## Security

### <section> ➡️ Advanced
| Setting | Value  | Adjusted | Description |
|-|-|-|-|
| SHA256 PCR Bank             | `Enabled` | - | Specifies the bank of Platform Configuration Registers (PCRs) used for SHA-256 hashing. |
| SHA384 PCR Bank             | `Disabled` | - | Specifies the bank of PCRs used for SHA-384 hashing. |
| SM3_256 PCR Bank            | `Disabled` | - | Specifies the bank of PCRs used for SM3_256 hashing. SM3-256 is standardized and widely used in China, for applications involving data security and cryptographic protocols. |
| Pending Operation           | `None` | - | Indicates a pending operation that requires physical presence or authorization. A security feature in TPM-enabled systems that helps ensure that critical operations are performed only when the proper authorization is provided, enhancing the overall security and integrity of the system's cryptographic functions and sensitive data.|
| Platform Hierarchy          | `Enabled` | - | Configures the hierarchy of platform-level authorization and access. |
| Storage Hierarchy           | `Enabled` | - | Configures the hierarchy of storage-level authorization and access. |
| Endorsement Hierarchy       | `Enabled` | - | Configures the hierarchy of endorsement-level authorization and access. |
| Physical Presence Spec Version | `1.3` | - | Specifies the version of the physical presence specification supported by the platform. |
| TPM 2.0 InterfaceType       | `CRB` | - | Defines the type of interface used to communicate with the Trusted Platform Module (TPM) 2.0. |
| Device Select               | `Auto` | - | Selects a specific device for configuration or interaction within the BIOS settings. |


## Boot



