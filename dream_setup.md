# PROJECT "A40 ULTRA-HORIZON" | THE $500,000 DREAM SETUP
**Strategic SIGINT/EW Sovereign Environment**

This configuration represents the absolute pinnacle of current open-architecture RF engineering. It builds upon the "Deep-Scan" foundation but scales the frequency range to **40GHz (K/Ka-Band)**, doubles the AI compute density, and adds laboratory-grade instrumentation.

---

## 1. Advanced Ingest Tier (Expansion to 40GHz)
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Foundation Kit** | 1 | A40 Deep-Scan Part I-III | All items from the "Maximum Capability" $301k list. | $301,210 |
| **Millimeter Wave Downconverters** | 2 | Custom 18-40GHz | **Frequency Expansion:** Allows the N310/Sidekiq to "see" into the K and Ka bands (Satellite/5G Backhaul). | $24,000 |
| **High-Gain Horn Antennas** | 2 | 18-40GHz Dual-Pol | Directional microwave collection for high-frequency targets. | $4,500 |

## 2. The "Super-Compute" Backplane
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Crystal 3U GPU Node (L40S)** | 2 | CMS-00891 (Dual L40S) | **AI Powerhouse:** Upgrades the GPU tier to NVIDIA L40S. Faster inference for multi-channel ML classification. | $95,000 |
| **Mellanox 100GbE NICs** | 4 | ConnectX-6 | **Zero Bottleneck:** Upgrades internal server links to 100GbE to handle the massive data from the RTSA. | $3,200 |

## 3. Laboratory-Grade Instrumentation
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **Real-Time Spectrum Analyzer** | 1 | R&S FSVA3030 | **Gapless Monitoring:** 30GHz RTSA with 400MHz RTBW. Detects "LPI" (Low Probability of Intercept) signals that SDRs might miss. | $65,000 |
| **Rubidium Frequency Standard** | 1 | Microchip SA.22c | **Atomic Stability:** Upgrades the Brandywine's internal oscillator to a Rubidium physics package. Essential for long-term phase stability. | $4,500 |

## 4. Hardened Infrastructure & Physicals
| Item | Qty | Model/Part # | Big Picture / Justification | Approx. Price |
| :--- | :---: | :--- | :--- | :--- |
| **EMI/RFI Shielded Rack** | 1 | Equipto R6 Series | **Operational Security:** 24U rack with 80dB+ of attenuation. Prevents "leakage" and protects sensors from external noise. | $1,800 |
| **10kVA Double-Conversion UPS** | 1 | Eaton 9PX | **Total Isolation:** Completely isolates the rack from facility power "noise" and provides 30min+ runtime at full load. | $5,800 |

---

## BUDGET SUMMARY: THE DREAM SETUP

| Category | Subtotal |
| :--- | :--- |
| **Deep-Scan Baseline (Minimum + Upgrades + Redundancy)** | $301,210 |
| **Microwave/mmWave Expansion (to 40GHz)** | $28,500 |
| **Super-Compute Tier (L40S Upgrades)** | $98,200 |
| **Instrumentation Tier (R&S RTSA)** | $65,000 |
| **Atomic Timing & Shielded Infrastructure** | $7,100 |
| **GRAND TOTAL ESTIMATED COST** | **$500,010** |

---

## Technical Notes for "Ultra-Horizon":
*   **The 40GHz Edge:** At these frequencies, cable loss is extreme. All mmWave downconverters must be mounted at the antenna head or used with high-cost phase-stable semi-rigid coax.
*   **Cooling:** The L40S GPUs generate significantly more heat than the A40s. The rack must be located in a dedicated HVAC environment with at least 5 tons of cooling capacity.
*   **Data Rates:** A 100GbE backplane is mandatory. The Ruckus switch must be fully populated with QSFP28 modules to prevent packet drops during wideband captures.
