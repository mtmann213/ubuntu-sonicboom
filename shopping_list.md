# MASTER SHOPPING LIST: High-Performance SIGINT/EW System
**Project: "A40 Deep-Scan" | Budget Strategy: Required vs. Optional**

This document details the procurement authority for the A40 Deep-Scan system. It is divided into the core "Required" infrastructure and the "Recommended" mission upgrades.

---

# PART I: MINIMUM REQUIRED LIST
*These items constitute the minimum viable high-performance system for ingest, processing, and control.*

## 1. Core Mission Hardware (The "Brain" & "Sensors")
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Sidekiq X4 PCIe Blade** | 1 | Epiq ES024-110-02 | **Primary Wideband Ingest:** 400MHz instantaneous BW. | $33,000 |
| **Crystal 3U GPU Server** | 2 | CMS-00891 (Dual A40) | **DSP/ML Engine:** Rugged hosts for NVIDIA A40s. | $80,000 |
| **USRP N310** | 1 | Ettus 785067-01 | **High-Fidelity Sensor:** 4-channel phase-coherent SDR. | $13,500 |
| **Ruckus ICX Switch** | 1 | ICX7850-48FS-E2 | **The Backplane:** 40/100GbE data mover. | $18,000 |
| **Keysight MXG** | 1 | N5182A-506 | **Validation:** Vector Signal Generator for calibration. | $20,000 |
| **Brandywine NFS220** | 1 | 95000001 | **Grandmaster Clock:** Ultra-stable 10MHz/1PPS. | $6,500 |
| **USRP B210** | 1 | Ettus B210 | **Local Monitoring:** Portable SDR for bench testing. | $1,600 |
| **SeaLevel Serial Card** | 1 | 7804EC | **System Control:** Interface for external sensors/rotors. | $700 |
| **Archival Storage Node** | 1 | 4U 24-Bay Server (120TB) | **Capacity Tier:** Long-term storage for mission data. | $14,500 |

## 2. Timing & Power Infrastructure
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **GPS Timing Antenna** | 1 | PCTEL GPS-TMG-HR-26N | High-rejection antenna for GPS L1 lock. | $250 |
| **LMR-240 Coax (50ft)** | 1 | N(M) to BNC(M) | Low-loss antenna feed cable. | $120 |
| **Mean Well 12V PSU** | 1 | RCP-1000-12 (1U) | Clean DC source for USRP N310. | $320 |
| **Mean Well 1U Shelf** | 1 | RCP-1UI | Secure mounting for the DC supply. | $210 |
| **Tripp-Lite 20A PDU** | 1 | PDUMH20 (Metered) | Rack power distribution and monitoring. | $350 |

## 3. Physical Mounting & Housing
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **24U Deep Server Rack** | 1 | APC AR3104 | 42" deep enclosure for GPU chassis. | $1,500 |
| **USRP N3xx Rack Kit** | 1 | Ettus 786467-01 | Adapts half-wide N310 to 1U rack slot. | $610 |
| **Keysight 2U Rack Kit** | 1 | Keysight 1CP010A | Adapts MXG benchtop unit to rack rails. | $350 |
| **M6 Rack Hardware** | 1 | 50-Pack Cage Nuts | Essential fasteners for rack assembly. | $40 |
| **Ventilated 2U Shelf** | 1 | StarTech Cantilever | Utility space for tools and USRP B210. | $60 |

## 4. Connectivity, Protection & Tools
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **30dB SMA Attenuators** | 4 | Signal "Pads" | **HARDWARE SAFETY:** Prevents frontend damage. | $150 |
| **SMA Torque Wrench** | 1 | 8 in-lb Precision | Ensures perfectly seated RF connections. | $220 |
| **40G QSFP+ DAC (2m)** | 6 | High-Speed Interconnect | Moves IQ data between servers and switch. | $300 |
| **BNC to SMA Timing** | 6 | 3ft Shielded Coax | Distributes 10MHz/1PPS heartbeat. | $180 |
| **SSMC to SMA Pigtails** | 4 | 6" LMR-100 | Brings Sidekiq's internal ports to rack face. | $250 |
| **Cat6a Shielded Patch** | 10 | 1ft/3ft Management | Connects control/management network. | $100 |

## 5. ESD & Lab Safety (The "Insurance")
| Item | Qty | Description | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **ESD Workstation Kit** | 1 | 24x48 Mat + Straps | Protects sensitive silicon during assembly. | $450 |
| **ESD Shielding Bags** | 1 | 10-Pack | Safe storage for removed PCIe blades. | $50 |

## 6. System Robustness Upgrades
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **3kVA Rack UPS** | 1 | APC Smart-UPS SRT | Prevents corruption during power sags. | $3,200 |
| **NVMe Recording Tier** | 2 | 16TB RAID-0 (Gen4) | Handles 1.6GB/s raw IQ ingest streams. | $4,800 |
| **1U Fan Tray** | 1 | AC Infinity CLOUDPLATE | Thermal stability for sustained GPU loads. | $200 |
| **IP-KVM Switch** | 1 | Raritan Dominion KX III | Remote BIOS-level system control. | $850 |

## 7. Operator Interface (Control & Analysis)
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Engineering Workstation** | 1 | Dell Precision 7680 | Primary control point (i9/64GB/RTX). | $5,800 |
| **10GbE TB4 Adapter** | 1 | OWC Thunderbolt 3/4 | High-BW data ingest for visualization. | $220 |
| **Rugged Transit Case** | 1 | Pelican 1535 Air | Protective housing for workstation. | $280 |

---

# PART II: RECOMMENDED IMPROVEMENTS
*These items are highly recommended for Full Mission Capability (FMC) and advanced RF calibration.*

## 8. Mission Antennas & RF Distribution
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Wideband Discone** | 1 | Diamond D130NJ | Omni coverage from 25MHz to 3GHz. | $150 |
| **Log-Periodic Array** | 1 | Creative Design CLP-5130 | High-gain directional target isolation. | $450 |
| **4-Channel DF Array** | 1 | Custom Phase-Coherent | Required for Direction Finding apps. | $3,500 |
| **RF Matrix Switch** | 1 | Mini-Circuits USB/Eth | Software-controlled antenna routing. | $2,500 |
| **RF Patch Panel** | 1 | 1U SMA-to-N Type | Strain relief for sensitive SDR ports. | $400 |

## 9. Calibration & Mission Software
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **USB VNA** | 1 | Copper Mountain M5065 | Phase-matching RF paths and antenna tuning. | $8,500 |
| **Keysight VSA Software** | 1 | 89601B (Annual Sub) | Gold-standard vector signal analysis. | $12,000 |
| **MATLAB / DSP Suite** | 1 | Standard + Toolboxes | Advanced DSP and ML prototyping. | $6,000 |

## 10. Environmental Security & Spares
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Rack Monitor** | 1 | APC NetBotz 250 | Real-time temp/humidity health monitoring. | $850 |
| **RF "Survival Kit"** | 1 | Adapters/Terminators | Essential testing loads and connectors. | $800 |
| **Spare Cable Set** | 1 | DAC/SMA/Cat6a | Critical spares for high-wear components. | $1,200 |

---

# PART III: REDUNDANCY & CAPABILITY UPGRADES
*These items provide 1:1 hardware failover and enable advanced 8-channel coherent operations.*

## 11. Redundant Sensors & Guard Channels
| Item | Qty | Model/Part # | Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Sidekiq X4 (Redundant)** | 1 | Epiq ES024-110-02 | **Failover:** 1:1 redundancy for the primary wideband ingest. | $33,000 |
| **USRP N310 (Secondary)** | 1 | Ettus 785067-01 | **8-Ch MIMO:** Enables high-precision beamforming and 8-port DF. | $13,500 |
| **USRP B210 (Guard)** | 2 | Ettus B210 | **Persistent Mon:** Always-on monitoring of specific SOIs. | $3,200 |
| **Secondary Timing Std.** | 1 | Brandywine NFS220 | **System Heartbeat:** Redundant clock source to prevent total sync loss. | $6,500 |

---

# BUDGET SUMMARY

| Requirement Level | Subtotal |
| :--- | :--- |
| **PART I: MINIMUM REQUIRED LIST** | **$208,660** |
| **PART II: RECOMMENDED IMPROVEMENTS** | **$36,350** |
| **PART III: REDUNDANCY & CAPABILITY UPGRADES** | **$56,200** |
| **GRAND TOTAL (MAXIMUM CAPABILITY)** | **$301,210** |

---

## Final Technical Notes:
*   **Thermal Plan:** GPU servers must be spaced at least 1U apart; use the CLOUDPLATE fan tray for active exhaust.
*   **Safety:** Never operate the Keysight MXG without verified attenuation in the path.
*   **Coherence:** All timing cables (BNC-SMA) for the N310 and Sidekiq must be the exact same length to avoid phase skew.
*   **Procurement Strategy:** Prioritize the **Brandywine NFS220** and **Crystal Servers** as they have the longest lead times (8-12 weeks).
