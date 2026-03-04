# Standard Operating Procedure: System Assembly & Integration
**Project: "APEX PROWLER" | High-Performance SIGINT/EW Rack**

This SOP details the technical sequence for constructing the APEX PROWLER environment. Follow these steps to ensure thermal stability, electrical safety, and signal integrity.

---

## Phase 0: ESD & Safety Preparation (CRITICAL)
*Goal: Prevent catastrophic damage to sensitive silicon and RF front-ends.*
1. **Workstation Setup:** All assembly must be performed on an **ESD-dissipative mat** grounded to a common point.
2. **Personal Grounding:** Operators **must** wear a grounded **ESD wrist strap** at all times when handling PCIe blades or opening server chassis.
3. **Cable Discharge:** Before connecting any SMA or BNC cable to an SDR, touch the outer connector of the cable to the grounded rack frame to discharge any built-up static on the cable run.
4. **Component Handling:** Hold all PCIe cards (Sidekiq, SeaLevel) only by the metal brackets or the edges of the PCB. Never touch the gold contact fingers or surface-mount components.

---

## Phase 1: Enclosure & Heavy Infrastructure
1. **Rack Preparation:** Stabilize the **APC 24U Rack**. Install the leveling feet and ensure the rack is grounded to the facility's common ground point.
2. **Bottom-Up Loading:**
   *   **U1-U6:** Install the sliding rails for the **(2) Crystal 3U GPU Servers**. Rack the servers in the lowest positions to maintain a low center of gravity.
   *   **U7:** Leave 1U of empty space for thermal exhaust.
   *   **U8-U11:** Install the **Archival Storage Node** (4U). This unit contains 24 HDDs and is extremely heavy.
   *   **U12:** Leave 1U of empty space for thermal exhaust.
   *   **U13:** Install the **Ruckus ICX Switch**. Ensure the airflow direction (front-to-back) matches the servers.
3. **Power Distribution:** Mount the **Tripp-Lite 20A PDU** vertically in the rear of the rack (if supported) or at the top rear. Plug the Crystal Servers and Storage Node into the high-current outlets.

---

## Phase 2: Sensors, Instrumentation & Timing
1. **SDR Mounting:** Assemble the **USRP N310** into the **Ettus 1U Rack Shelf** and mount at U15. 
2. **Instrumentation:** Install the **Keysight MXG** at U17 using the **1CP010A Rack Kit**.
3. **Timing Standard:** Mount the **Brandywine NFS220** at U19.
4. **Utility Shelf:** Install the **StarTech Cantilever Shelf** at U21 to hold the **USRP B210** and store the **SMA Torque Wrench**.

---

## Phase 3: The "Heartbeat" (Timing & Sync)
*Goal: Zero-jitter distribution of the 10MHz and 1PPS references.*
1. **Antenna Feed:** Run the **LMR-240 cable** from the external GPS antenna to the Brandywine's `GPS IN` port.
2. **Synchronized Ingest:**
   * Connect (2) **BNC-to-SMA** cables from the Brandywine 10MHz OUT to the USRP N310.
   * Connect (2) **BNC-to-SMA** cables from the Brandywine 1PPS OUT to the USRP N310.
   * Connect (1) **BNC-to-SSMC** cable to the Sidekiq X4 (via external port) for 10MHz reference.
   * **STRICT RULE:** Ensure the physical lengths of these timing cables are identical to within 1 inch to maintain phase alignment.

---

## Phase 4: Data & Control Network
1. **High-Speed IQ Path:** Connect (6) **40G QSFP+ DAC cables** from the Crystal Servers to the Ruckus switch. This creates the massive data pipe for raw IQ streaming.
2. **Management Network:** Use the **Cat6a Shielded Patch Cables** to connect every management port (Servers, Switch, USRP, Brandywine, Keysight) to the Ruckus switch. This allows the system to be controlled entirely from a single remote IP.
3. **Internal Control:** Connect the **Armored USB 3.0 cables** from the Server to the USRP B210.
4. **Operator Interface:** Connect the **Engineering Workstation** to a 10GbE port on the Ruckus switch using the **Thunderbolt to 10GbE adapter**. This provides the high-bandwidth link for real-time visualization.

---

## Phase 5: RF Safety & Signal Path
1. **Receiver Protection (CRITICAL):** Before any other RF work, screw the **30dB SMA Attenuators** directly onto every RX port of the USRP N310 and Sidekiq pigtails.
2. **Signal Distribution:** Connect the **Phase-Stable SMA Cables** from your antenna manifold to the attenuators.
3. **Torque Validation:** Use the **8 in-lb Torque Wrench** on every single SMA connection. Do not rely on hand-tightening; signal phase will drift if connections are inconsistent.

---

## Phase 6: System Commissioning
1. **Cold Boot Sequence:**
   * **Step 1:** Turn on the Ruckus Switch.
   * **Step 2:** Turn on the Brandywine Timing Standard. **WAIT for GPS LOCK** (Verify on front panel).
   * **Step 3:** Turn on the Mean Well DC Supply for the SDRs.
   * **Step 4:** Boot the Crystal Servers.
2. **Software Validation:**
   * Run `uhd_usrp_probe` -> Verify `ref: external` and `pps: external`.
   * Run `nvidia-smi` -> Verify both A40 GPUs are present and memory is available.
   * Run `Sidekiq_info` -> Verify the PCIe card is detected and internal temp is stable.

---

## Phase 7: Software Environment Setup
1. **OS Configuration:** Install **Ubuntu 22.04 LTS (RT Kernel)** on the Crystal Servers. Enable hugepages to prevent buffer overflows during high-BW streaming.
2. **SDR Drivers:** 
   * Install **UHD 4.4+** for the USRP N310.
   * Install **libsidekiq** and the Epiq driver suite for the Sidekiq X4.
3. **GPU Acceleration:** Install **CUDA 12.x** and **cuFFT**. Verify that the A40s can handle the 400MHz IQ stream using a sample CUDA ingest kernel.
4. **Network Optimization:** Configure the 40GbE interfaces with **9000-byte MTU (Jumbo Frames)** to ensure zero packet loss from the Ruckus switch.

---

## Phase 8: Post-Commissioning Maintenance
1. **Thermal Baseline:** Monitor GPU temperatures during a 1-hour "All-Channels" ingest. Temp should not exceed 80°C.
2. **RF Recalibration:** Every 6 months, use the **Keysight MXG** to perform a system-wide gain/phase calibration.
3. **SMA Connector Care:** Periodically inspect RF pigtails. If the center pin appears retracted or damaged, replace the cable immediately to avoid intermittent phase errors.

---

## Phase 9: Final RF Integration & Calibration (Mission Mode)
1. **Antenna Manifold:** Connect all external antennas (Discone, LPDA, DF Array) to the **1U N-Type-to-SMA Patch Panel**.
2. **RF Matrix Wiring:** Connect the internal side of the patch panel to the **RF Matrix Switch**. Use software to route specific antenna banks to the USRP N310 and Sidekiq X4.
3. **Phase Matching (VNA):** Use the **Copper Mountain USB VNA** to measure the electrical length of the four N310 input cables. All four paths must be phase-matched to within 2 degrees at 2.4GHz for Direction Finding to be accurate.
4. **VSA Software Link:** Link the **Keysight VSA software** on the Workstation to the USRP N310. Verify that complex vector signals generated by the Keysight MXG are being correctly demodulated by the software tier.
