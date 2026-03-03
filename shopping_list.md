# MASTER SHOPPING LIST: High-Performance SIGINT/EW System
**Project: "A40 Deep-Scan" | Budget Estimate: ~$175,000 - $210,000**

This document is the final procurement authority for the system. It covers the core sensors, the compute backplane, and the "last mile" infrastructure required for a turn-key build.

---

## 1. Core Mission Hardware (The "Brain" & "Sensors")
| Item | Qty | Model/Part # | Big Picture / Justification | Link | Approx. Price |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **Sidekiq X4 PCIe Blade** | 1 | Epiq ES024-110-02 | **Primary Wideband Ingest:** 400MHz instantaneous BW. Captures massive swaths of spectrum simultaneously. | [Epiq](https://epiqsolutions.com/modules/sidekiq-x4) | $33,000 |
| **Crystal 3U GPU Server** | 2 | CMS-00891 (Dual A40) | **DSP/ML Engine:** Rugged hosts for NVIDIA A40s. 96GB total VRAM handles huge FFTs & AI signal class. | [Crystal](https://www.crystalrugged.com/contact/request-a-quote/) | $80,000 |
| **USRP N310** | 1 | Ettus 785067-01 | **High-Fidelity Sensor:** 4-channel phase-coherent SDR for Direction Finding and MIMO apps. | [Ettus](https://www.ettus.com/all-products/usrp-n310/) | $13,500 |
| **Ruckus ICX Switch** | 1 | ICX7850-48FS-E2 | **The Backplane:** 40/100GbE data mover. Prevents bottlenecks between SDRs and GPU servers. | [Ruckus](https://www.commscope.com/product-type/enterprise-networking/ethernet-switches/icx7850/) | $18,000 |
| **Keysight MXG** | 1 | N5182A-506 | **Validation:** Generates "known-good" complex vectors to calibrate and test the entire system. | [Keysight](https://www.keysight.com/us/en/product/N5182A/mxg-vector-signal-generator-100-khz-to-6-ghz.html) | $20,000 |
| **Brandywine NFS220** | 1 | 95000001 | **Grandmaster Clock:** Distributes ultra-stable 10MHz/1PPS. Essential for phase-coherent operations. | [Brandywine](https://www.brandywinecomm.com/products/time-frequency-standards) | $6,500 |
| **USRP B210** | 1 | Ettus B210 | **Local Monitoring:** Portable SDR for bench testing and low-bandwidth guard-channel monitoring. | [Ettus](https://www.ettus.com/all-products/ub210-kit/) | $1,600 |
| **SeaLevel Serial Card** | 1 | 7804EC | **System Control:** Legacy interface for controlling external antennas, rotors, or sensors. | [SeaLevel](https://www.sealevel.com/product/7804ec-pci-express-8-port-rs-232-rs-422-rs-485-serial-interface/) | $700 |

---

## 2. Timing & Power Infrastructure
| Item | Qty | Description | Big Picture / Justification | Link | Approx. Price |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **GPS Timing Antenna** | 1 | PCTEL GPS-TMG-HR-26N | **Source of Truth:** High-rejection antenna for GPS L1 lock even in noisy RF environments. | [PCTEL](https://www.pctel.com/products/gps-tmg-hr-26n/) | $250 |
| **LMR-240 Coax (50ft)** | 1 | N(M) to BNC(M) | **Antenna Feed:** Low-loss cable to connect the roof/window antenna to the Brandywine. | [Times Microwave](https://www.timesmicrowave.com/LMR-240) | $120 |
| **Mean Well 12V PSU** | 1 | RCP-1000-12 (1U) | **Clean DC Power:** Reliable 12V source for the USRP N310, replacing unstable "wall-warts." | [Mean Well](https://www.meanwell.com/webapp/product/search.aspx?prod=RCP-1000) | $320 |
| **Mean Well 1U Shelf** | 1 | RCP-1UI | **PSU Housing:** Securely mounts the DC supply in the rack. | [Mean Well](https://www.meanwell.com/webapp/product/search.aspx?prod=RCP-1UI) | $210 |
| **Tripp-Lite 20A PDU** | 1 | PDUMH20 (Metered) | **Power Monitor:** Ensures the total draw of the dual-A40 servers doesn't trip the facility breaker. | [Tripp-Lite](https://www.tripplite.com/metered-pdu-20a-120v-1u-rackmount-l5-20p-12-5-15-20r-outlets~PDUMH20) | $350 |

---

## 3. Physical Mounting & Housing
| Item | Qty | Model/Part # | Big Picture / Justification | Link | Approx. Price |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **24U Deep Server Rack** | 1 | APC AR3104 | **The Enclosure:** 42" deep to accommodate long GPU chassis and heavy weight (3,000 lbs). | [APC](https://www.apc.com/shop/us/en/products/NetShelter-SX-24U-600mm-Wide-x-1070mm-Deep-Enclosure-with-Sides-Black/P-AR3104) | $1,500 |
| **USRP N3xx Rack Kit** | 1 | Ettus 786467-01 | **Sensor Mounting:** Adapts the half-wide N310 to a standard 1U rack slot. | [Ettus](https://www.ettus.com/all-products/usrp-n3xx-rack-mount-accessory/) | $610 |
| **Keysight 2U Rack Kit** | 1 | Keysight 1CP010A | **Instrument Mounting:** Adapts the MXG benchtop unit to the rack rails. | [Keysight](https://www.keysight.com/us/en/product/1CP010A/rack-mount-flange-front-handle-kit-881mm-h-2u.html) | $350 |
| **M6 Rack Hardware** | 1 | 50-Pack Cage Nuts/Screws | **Essential Fasteners:** You cannot build the rack without these. Includes washers to prevent scratches. | [StarTech](https://www.startech.com/en-us/server-management/cabscrewm6) | $40 |
| **Ventilated 2U Shelf** | 1 | StarTech Cantilever | **Utility Space:** Holds the USRP B210 and system tools. | [StarTech](https://www.startech.com/en-us/server-management/cantshelf22) | $60 |

---

## 4. Connectivity, Protection & Tools
| Item | Qty | Description | Big Picture / Justification | Link | Approx. Price |
| :--- | :---: | :--- | :--- | :--- | :--- |
| **30dB SMA Attenuators** | 4 | Signal "Pads" | **HARDWARE SAFETY:** Essential to prevent the Keysight from destroying USRP front-ends. | [Fairview](https://www.fairviewmicrowave.com/30db-fixed-sma-male-female-attenuator-2-watts-sa18s30db-p.aspx) | $150 |
| **SMA Torque Wrench** | 1 | 8 in-lb Precision | **Signal Integrity:** Ensures every RF connection is perfectly seated for phase stability. | [DigiKey](https://www.digikey.com/en/products/detail/cinch-connectivity-solutions-johnson/141-0000-929/600196) | $220 |
| **40G QSFP+ DAC (2m)** | 6 | High-Speed Interconnect | **The Data Path:** Moves IQ data from servers to the core switch. | [FS.com](https://www.fs.com/products/21254.html) | $300 |
| **BNC to SMA Timing** | 6 | 3ft Shielded Coax | **The Heartbeat:** Distributes 10MHz/1PPS from the clock to the SDRs. | [Pasternack](https://www.pasternack.com/bnc-male-sma-male-rg58cu-cable-assembly-pe3067-p.aspx) | $180 |
| **SSMC to SMA Pigtails** | 4 | 6" LMR-100 | **Port Adaptation:** Brings Sidekiq's internal ports to the rack exterior. | [Fairview](https://www.fairviewmicrowave.com/ssmc-male-sma-female-cable-rg316-ds-coax-fmc0108316ds-p.aspx) | $250 |
| **Cat6a Shielded Patch** | 10 | 1ft/3ft Management | **Control Network:** Connects management ports for remote control and health monitoring. | [Monoprice](https://www.monoprice.com/product?p_id=15147) | $100 |

---

## Final Technical Notes:
*   **Thermal Plan:** GPU servers must be spaced at least 1U apart or have active rack fans installed.
*   **Safety:** Never operate the Keysight MXG without verified attenuation in the path.
*   **Coherence:** All timing cables (BNC-SMA) for the N310 and Sidekiq must be the exact same length to avoid phase skew.
