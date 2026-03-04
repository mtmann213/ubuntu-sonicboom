# PROJECT "APEX PROWLER" | THE $500,000 DREAM SETUP
**Strategic SIGINT/EW Sovereign Environment**

This configuration represents the absolute pinnacle of current open-architecture RF engineering. It scales the baseline to **40GHz**, doubles the AI compute throughput, and provides a total of **240TB** of archival mission storage.

---

## 1. Advanced Ingest Tier (Expansion to 40GHz)
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Foundation Kit**](Project_APEX_PROWLER_Documentation.html) | 1 | APEX PROWLER Part I, II, IV | Core Infrastructure + Rec Improvements + Antennas. | $375,984 |
| [**Millimeter Wave Downconverters**](https://www.pmi-rf.com/categories/down-converters) | 2 | Custom 18-40GHz | **Frequency Expansion:** Extends monitoring into K/Ka-Band. | $24,000 |
| [**High-Gain Horn Antennas**](https://www.ahsystems.com/catalog/horn-antennas.php) | 2 | 18-40GHz Dual-Pol | Directional collection for high-frequency targets. | $4,500 |
| [**40GHz Phase-Stable Cables**](https://www.gore.com/products/categories/cables-cable-assemblies) | 1 | Lab Set (Semi-Rigid) | **Precision:** Required for low-loss 40GHz signal transport. | $5,000 |

## 2. The "Super-Compute" & Storage Backplane
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**GPU Upgrade (A40 -> L40S)**](https://www.nvidia.com/en-us/data-center/l40s/) | 2 | NVIDIA L40S | **AI Powerhouse:** Upgrades Part I servers to L40S GPUs (~$9k ea). | $18,000 |
| [**Mellanox 100GbE NICs**](https://www.nvidia.com/en-us/networking/ethernet-adapters/) | 4 | ConnectX-6 | **Zero Bottleneck:** 100GbE links for massive data. | $3,200 |
| [**100G QSFP28 AOC (3m)**](https://www.fs.com/products/50497.html) | 4 | **ACTIVE** Interconnect | **Signal Integrity:** 100G Active Optical links for servers. | $600 |
| [**Archival Storage (Tier 2)**](https://www.truenas.com/m-series/) | 1 | 4U 24-Bay (120TB) | **Expansion:** Adds a second node for **240TB total storage**. | $16,500 |

## 3. Laboratory-Grade Instrumentation
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**Real-Time Spectrum Analyzer**](https://www.rohde-schwarz.com/us/products/test-and-measurement/analyzers/rs-fsva3000-signal-and-spectrum-analyzer_63493-599540.html) | 1 | R&S FSVA3030 | **Gapless Monitoring:** 30GHz RTSA with 400MHz RTBW. *Refurb/Used.* | $20,000 |
| [**Rubidium Frequency Standard**](https://www.microchip.com/en-us/product/sa-22c) | 1 | Microchip SA.22c | **Atomic Stability:** Upgrades timing to Rubidium physics. | $4,500 |

## 4. Hardened Infrastructure & Field OPSEC
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| [**EMI/RFI Shielded Rack**](https://www.equipto.com/r6-series/) | 1 | Equipto R6 Series | **Security:** 24U rack with 80dB+ of attenuation. | $1,800 |
| [**10kVA Double-Conversion UPS**](https://www.eaton.com/us/en-us/catalog/backup-power-ups-surge-it-power-distribution/eaton-9px-ups.html) | 1 | Eaton 9PX | **Total Isolation:** Clean power and 30min+ runtime. | $5,800 |
| [**Portable Shielded Tent**](https://select-fabricators.com/rf-emi-shielding-tents/) | 1 | Select Fabricators | **Field OPSEC:** Portable RF-quiet workspace for field ops. | $8,000 |

---

## BUDGET SUMMARY: THE DREAM SETUP

| Category | Subtotal |
| :--- | :--- |
| **Foundation (Part I, II, IV)** | $375,984 |
| **Microwave/mmWave Expansion (to 40GHz)** | $33,500 |
| **Super-Compute & Storage Expansion** | $38,300 |
| **Instrumentation Tier (RTSA + Rubidium)** | $24,500 |
| **Hardened Infrastructure** | $7,600 |
| **GRAND TOTAL ESTIMATED COST** | **$479,884** |

---

## Technical Notes for "Ultra-Horizon":
*   **Active Optical Cables (AOC):** All high-speed 100G links are specified as Active Optical to eliminate bit errors during 40GHz captures.
*   **The 40GHz Edge:** Use the semi-rigid cable set for all 40GHz connections; standard coax will attenuate the signal too heavily.
*   **RTSA Pricing:** To stay under $500k, the RTSA budget is capped at $20k (Assumes high-end refurbished unit).
*   **Storage Density:** With 240TB of archival storage, the system can hold ~40 hours of continuous 400MHz raw IQ recordings.
