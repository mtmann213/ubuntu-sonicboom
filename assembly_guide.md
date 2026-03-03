# Standard Operating Procedure: System Assembly & Integration
**Project: "A40 Deep-Scan" | High-Performance SIGINT/EW Rack**

This SOP details the technical sequence for constructing the A40 Deep-Scan environment. Follow these steps to ensure thermal stability, electrical safety, and signal integrity.

---

## Phase 1: Enclosure & Heavy Infrastructure
1. **Rack Preparation:** Stabilize the **APC 24U Rack**. Install the leveling feet and ensure the rack is grounded to the facility's common ground point.
2. **Bottom-Up Loading:**
   * **U1-U6:** Install the sliding rails for the **(2) Crystal 3U GPU Servers**. Rack the servers in the lowest positions to maintain a low center of gravity.
   * **U7:** Leave 1U of empty space for thermal exhaust.
   * **U8:** Install the **Ruckus ICX Switch**. Ensure the airflow direction (front-to-back) matches the servers.
3. **Power Distribution:** Mount the **Tripp-Lite 20A PDU** vertically in the rear of the rack (if supported) or at the top rear. Plug the Crystal Servers into the high-current outlets.

---

## Phase 2: Sensors, Instrumentation & Timing
1. **SDR Mounting:** Assemble the **USRP N310** into the **Ettus 1U Rack Shelf** and mount at U10. 
2. **Instrumentation:** Install the **Keysight MXG** at U12 using the **1CP010A Rack Kit**. *Note: The MXG is heavy; ensure both front and rear rails are secure.*
3. **Timing Standard:** Mount the **Brandywine NFS220** at U14.
4. **Utility Shelf:** Install the **StarTech Cantilever Shelf** at U16 to hold the **USRP B210** and store the **SMA Torque Wrench**.

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
