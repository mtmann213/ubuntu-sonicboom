# MASTER SHOPPING LIST: High-Performance SIGINT/EW System
**Project: "APEX PROWLER" | Budget Strategy: Required vs. Optional**

This document details the procurement authority for the APEX PROWLER system. Prices and links are verified as of early 2026 (Verified March 2026).

---

# PART I: MINIMUM REQUIRED LIST
*These items constitute the minimum viable high-performance system for ingest, processing, and control.*

## 1. Core Mission Hardware (The "Brain" & "Sensors")
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Sidekiq X4 PDK Bundle**](https://epiqsolutions.com/modules/sidekiq-x4) | 1 | ES024-101 | **Primary Ingest:** Includes X4 card, TB3 chassis, FPGA carrier, and Dev Laptop. | $51,544 |
| [**Sidekiq Maintenance**](https://epiqsolutions.com/modules/sidekiq-x4) | 1 | ES024-599-1 | **Support:** 1 additional year of maintenance/support (2 years total). | $4,779 |
| [**Crystal 3U GPU Server**](https://www.crystalrugged.com/products/rugged-servers/rs378-rugged-3u-server/) | 2 | CMS-00891 (Dual A40) | **DSP/ML Engine:** Rugged hosts for NVIDIA A40s. *Estimated @ $95k/ea.* | $190,000 |
| [**USRP N310**](https://www.ettus.com/all-products/usrp-n310/) | 1 | Ettus 785067-01 | **High-Fidelity Sensor:** 4-channel phase-coherent SDR. | $20,826 |
| [**Ruckus ICX Switch**](https://www.alldataresource.com/CommScope-ICX7850-48F-E2-Fiber-Aggregation-Switch-48sfpsfp28-1025gbps-Ports_p_642646.html) | 1 | ICX7850-48F-E2 | **The Backplane:** 40/100GbE data mover. | $17,689 |
| [**Keysight MXG**](https://www.keysight.com/us/en/product/N5182A/mxg-vector-signal-generator-100-khz-to-6-ghz.html) | 1 | N5182A-506 | **Validation:** Vector Signal Generator for calibration. *Refurbished/Certified.* | $12,500 |
| [**Brandywine NFS220**](https://satcomsolutions.org/product/brandywine-nfs220-10-mhz-reference-gps-synchronized-clock/) | 1 | 95000001 | **Grandmaster Clock:** Ultra-stable 10MHz/1PPS. | $4,200 |
| [**USRP B210**](https://www.ettus.com/all-products/ub210-kit/) | 1 | Ettus B210 | **Local Monitoring:** Portable SDR for bench testing. | $1,600 |
| [**SeaLevel Serial Card**](https://www.sealevel.com/ultra-comm-8-pcie-pci-express-8-port-rs-232-rs-422-rs-485-serial-interface/) | 1 | 7804EC | **System Control:** Interface for external sensors/rotors. | $487 |
| [**Archival Storage Node**](https://www.truenas.com/m-series/) | 1 | 4U 24-Bay Server (120TB) | **Capacity Tier:** Long-term storage for mission data. | $16,500 |
| **Shipping & Handling** | 1 | Quote #342624 | Procurement logistics for Sidekiq PDK. | $284 |
| **SUBTOTAL SECTION 1** | | | | **$320,409** |

## 2. Timing & Power Infrastructure
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**GPS Timing Antenna**](https://www.talleycom.com/product/MXRGPS-TMG-HR-26N) | 1 | PCTEL GPS-TMG-HR-26N | **REQUIRED:** High-rejection antenna for GPS L1 lock. | $237 |
| [**LMR-240 Coax (50ft)**](https://www.timesmicrowave.com/LMR-240) | 1 | N(M) to BNC(M) | Low-loss antenna feed cable. | $120 |
| [**Mean Well 12V PSU**](https://www.meanwell.com/webapp/product/search.aspx?prod=RCP-1000) | 1 | RCP-1000-12 (1U) | Clean DC source for USRP N310. | $320 |
| [**Mean Well 1U Shelf**](https://www.meanwell.com/webapp/product/search.aspx?prod=RCP-1UI) | 1 | RCP-1UI | Secure mounting for the DC supply. | $210 |
| [**Tripp-Lite 20A PDU**](https://www.tripplite.com/metered-pdu-20a-120v-1u-rackmount-l5-20p-12-5-15-20r-outlets~PDUMH20) | 1 | PDUMH20 (Metered) | Rack power distribution and monitoring. | $350 |
| **SUBTOTAL SECTION 2** | | | | **$1,237** |

## 3. Physical Mounting & Housing
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**24U Deep Server Rack**](https://www.server-rack-online.com/ar3104/) | 1 | APC AR3104 | 42" deep enclosure for GPU chassis. | $2,029 |
| [**USRP N3xx Rack Kit**](https://www.ettus.com/all-products/usrp-n3xx-rack-mount-accessory/) | 1 | Ettus 786467-01 | Adapts half-wide N310 to 1U rack slot. | $610 |
| [**Keysight 2U Rack Kit**](https://www.newark.com/keysight-technologies/1cm010a/1cm010a-rack-mount-flange-kit/dp/05X9265) | 1 | Keysight 1CM010A | Adapts MXG benchtop unit to rack rails. | $153 |
| [**M6 Rack Hardware**](https://www.startech.com/en-us/server-management/cabscrewm6) | 1 | 50-Pack Cage Nuts | Essential fasteners for rack assembly. | $40 |
| [**Ventilated 2U Shelf**](https://www.startech.com/en-us/server-management/cantshelf22) | 1 | StarTech Cantilever | Utility space for tools and USRP B210. | $60 |
| **SUBTOTAL SECTION 3** | | | | **$2,892** |

## 4. Connectivity, Protection & Tools
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**30dB SMA Attenuators**](https://www.fairviewmicrowave.com/30db-fixed-attenuator-sma-male-sma-female-2-watts-sa18e-30-p.aspx) | 4 | Signal "Pads" | **HARDWARE SAFETY:** Prevents frontend damage. | $150 |
| [**SMA Torque Wrench**](https://www.digikey.com/en/products/detail/cinch-connectivity-solutions-johnson/141-0000-929/600196) | 1 | 8 in-lb Precision | Ensures perfectly seated RF connections. | $220 |
| [**40G QSFP+ Active Optical Cable (3m)**](https://www.fs.com/products/30856.html) | 6 | **ACTIVE** Interconnect | **Signal Integrity:** Active links for zero-error IQ streaming. | $480 |
| [**BNC to SMA Timing**](https://www.pasternack.com/bnc-male-sma-male-rg58cu-cable-assembly-pe3067-p.aspx) | 6 | 3ft Shielded Coax | Distributes 10MHz/1PPS heartbeat. | $180 |
| [**SSMC to SMA Pigtails**](https://www.fairviewmicrowave.com/ssmc-male-sma-female-cable-rg316-ds-coax-fmc0108316ds-p.aspx) | 4 | 6" LMR-100 | Brings Sidekiq's internal ports to rack face. | $250 |
| [**Cat6a Shielded Patch**](https://www.monoprice.com/product?p_id=15147) | 10 | 1ft/3ft Management | Connects control/management network. | $100 |
| [**10G SFP+ to RJ45 Transceiver**](https://www.fs.com/products/66613.html) | 1 | Switch-to-Workstation | Required to connect Workstation to Ruckus switch. | $65 |
| **SUBTOTAL SECTION 4** | | | | **$1,445** |

## 5. ESD & Lab Safety (The "Insurance")
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**ESD Workstation Kit**](https://www.uline.com/Product/Detail/H-1132/Anti-Static-Mats/Anti-Static-Table-Mat-2-x-4-Blue) | 1 | 24x48 Mat + Straps | Protects sensitive silicon during assembly. | $450 |
| [**ESD Shielding Bags**](https://www.uline.com/BL_42/Static-Shielding-Bags) | 1 | 10-Pack | Safe storage for removed PCIe blades. | $50 |
| **SUBTOTAL SECTION 5** | | | | **$500** |

## 6. System Robustness Upgrades
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**3kVA Rack UPS**](https://www.apc.com/shop/us/en/products/APC-Smart-UPS-SRT-3000VA-RM-120V/P-SRT3000RMXLA) | 1 | APC Smart-UPS SRT | Prevents corruption during power sags. | $2,800 |
| [**NVMe Recording Tier**](https://www.westerndigital.com/products/internal-drives/wd-black-sn850x-nvme-ssd) | 2 | 16TB RAID-0 (Gen4) | Handles 1.6GB/s raw IQ ingest streams. *Based on $750/8TB.* | $3,000 |
| [**1U Fan Tray**](https://acinfinity.com/component-cooling/rack-fan-systems/cloudplate-t1-quiet-rack-cooling-fan-system-1u-exhaust/) | 1 | AC Infinity CLOUDPLATE | Thermal stability for sustained GPU loads. | $200 |
| [**IP-KVM Switch**](https://www.raritan.com/products/kvm-switches/dominion-kx-iii) | 1 | Raritan Dominion KX III | Remote BIOS-level system control. | $850 |
| **SUBTOTAL SECTION 6** | | | | **$6,850** |

## 7. Operator Interface (Control & Analysis)
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Engineering Workstation**](https://www.dell.com/en-us/shop/dell-laptops/precision-7680-workstation/spd/precision-16-7680-laptop) | 1 | Dell Precision 7680 | Primary visualization/ML point (i9/64GB/RTX). | $5,800 |
| [**10GbE TB4 Adapter**](https://www.owc.com/solutions/thunderbolt-3-10g-ethernet-adapter) | 1 | OWC Thunderbolt 3/4 | High-BW data ingest for visualization. | $220 |
| [**Rugged Transit Case**](https://www.pelican.com/us/en/product/cases/air/1535) | 1 | Pelican 1535 Air | Protective housing for workstation. | $280 |
| **SUBTOTAL SECTION 7** | | | | **$6,300** |

---

# PART II: RECOMMENDED IMPROVEMENTS
*These items are highly recommended for Full Mission Capability (FMC) and advanced RF calibration.*

## 8. RF Distribution & Signal Routing
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**RF Matrix Switch**](https://www.minicircuits.com/WebStore/RF-Switch-Matrices.html) | 1 | RC-Series USB/Eth | Software-controlled antenna routing. | $2,500 |
| [**RF Patch Panel**](https://www.pasternack.com/rf-patch-panels-category.aspx) | 1 | 1U SMA-to-N Type | Strain relief for sensitive SDR ports. | $400 |

## 9. Calibration & Mission Software
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**USB VNA**](https://coppermountaintech.com/vnas/m5065-2-port-6-5-ghz-analyzer/) | 1 | Copper Mountain M5065 | Phase-matching RF paths and antenna tuning. | $8,500 |
| [**Keysight VSA Software**](https://www.keysight.com/us/en/products/software/pathwave-signal-generation-analysis-software/pathwave-vector-signal-analysis-vsa-software.html) | 1 | 89601B (Annual Sub) | Gold-standard vector signal analysis. | $12,000 |
| [**MATLAB / DSP Suite**](https://www.mathworks.com/products/matlab.html) | 1 | Standard + Toolboxes | Advanced DSP and ML prototyping. | $6,000 |

## 10. Environmental Security & Spares
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Rack Monitor**](https://www.apc.com/shop/us/en/products/NetBotz-Rack-Monitor-250/P-NBRK0250) | 1 | APC NetBotz 250 | Real-time temp/humidity health monitoring. | $850 |
| [**RF "Survival Kit"**](https://www.pasternack.com/adapters-category.aspx) | 1 | Adapters/Terminators | Essential testing loads and connectors. | $800 |
| [**Spare Cable Set**](https://www.fs.com/products/30856.html) | 1 | DAC/SMA/Cat6a | Critical spares for high-wear components. | $1,200 |

---

# PART III: REDUNDANCY & CAPABILITY UPGRADES
*These items provide 1:1 hardware failover and enable advanced 8-channel coherent operations.*

## 11. Redundant Sensors & Guard Channels
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Sidekiq X4 PDK (Redundant)**](https://epiqsolutions.com/modules/sidekiq-x4) | 1 | ES024-101 | **Failover:** 1:1 redundancy. Includes 2yr Maint/Ship. | $56,607 |
| [**USRP N310 (Secondary)**](https://www.ettus.com/all-products/usrp-n310/) | 1 | Ettus 785067-01 | **8-Ch MIMO:** Enables high-precision beamforming. | $20,826 |
| [**USRP B210 (Guard)**](https://www.ettus.com/all-products/ub210-kit/) | 2 | Ettus B210 | **Persistent Mon:** Always-on monitoring of specific SOIs. | $3,200 |
| [**Secondary Timing Std.**](https://satcomsolutions.org/product/brandywine-nfs220-10-mhz-reference-gps-synchronized-clock/) | 1 | Brandywine NFS220 | **System Heartbeat:** Redundant clock source. | $4,200 |

---

# PART IV: ANTENNAS (IF NECESSARY)
*These items are the "ears" of the system, selected based on specific mission frequencies.*

## 12. Mission Antennas
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Wideband Discone**](https://www.diamondantenna.net/d130nj.html) | 1 | Diamond D130NJ | Omni coverage from 25MHz to 3GHz. | $150 |
| [**Log-Periodic Array**](https://www.dxengineering.com/search/product-line/creative-design-clp5130-series-log-periodic-antennas) | 1 | Creative Design CLP-5130 | High-gain directional target isolation. | $450 |
| [**4-Channel DF Array**](https://www.aaronia.com/products/antennas/) | 1 | Custom Phase-Coherent | Required for Direction Finding apps. | $3,500 |

---

# BUDGET SUMMARY

| Requirement Level | Subtotal |
| :--- | :--- |
| **PART I: MINIMUM REQUIRED LIST** | **$339,634** |
| **PART II: RECOMMENDED IMPROVEMENTS** | **$32,250** |
| **PART III: REDUNDANCY & CAPABILITY UPGRADES** | **$84,833** |
| **PART IV: ANTENNAS (IF NECESSARY)** | **$4,100** |
| **GRAND TOTAL (MAXIMUM CAPABILITY)** | **$460,817** |

---

## Final Technical Notes:
*   **Active Optical Cables (AOC):** All high-speed 40G links are now specified as Active Optical to ensure signal integrity across the rack.
*   **The Sidekiq Bundle:** Note that the PDK includes a dedicated dev laptop. The $5,800 Dell in Part I remains as the primary **visualization/10GbE network workstation** for the rack.
*   **Thermal Plan:** GPU servers must be spaced at least 1U apart; use the CLOUDPLATE fan tray for active exhaust.
*   **Safety:** Never operate the Keysight MXG without verified attenuation in the path.
*   **Coherence:** All timing cables (BNC-SMA) for the N310 and Sidekiq must be the exact same length to avoid phase skew.
*   **Procurement Strategy:** Prioritize the **Brandywine NFS220** and **Crystal Servers** as they have the longest lead times (8-12 weeks).
