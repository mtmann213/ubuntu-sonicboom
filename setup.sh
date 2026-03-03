#!/usr/bin/env bash
set -euo pipefail

echo "--- ubuntu-sonicboom Setup for Ubuntu 24.04 ---"

# 1. Install standard dependencies
echo "Installing standard dependencies (expect, opensc, etc.)..."
sudo apt update
sudo apt install -y expect opensc pcscd pcsc-tools libccid wget curl google-chrome-stable

# 2. Add FreeRDP Nightly Repository
echo "Adding FreeRDP Nightly repository..."
# Download and dearmor the specific key for 2025/2026 builds
wget -qO- http://pub.freerdp.com/repositories/ADD6BF6D97CE5D8D.asc | gpg --dearmor | sudo tee /usr/share/keyrings/freerdp-nightly.gpg >/dev/null

# Add the source list referencing the keyring
echo "deb [signed-by=/usr/share/keyrings/freerdp-nightly.gpg] http://pub.freerdp.com/repositories/deb/noble/ freerdp-nightly main" | sudo tee /etc/apt/sources.list.d/freerdp-nightly.list > /dev/null

# 3. Install FreeRDP Nightly
echo "Installing freerdp-nightly..."
sudo apt update
sudo apt install -y freerdp-nightly

# 4. Enable Smartcard service
echo "Starting smartcard service (pcscd)..."
sudo systemctl enable --now pcscd

echo "------------------------------------------------"
echo "SETUP COMPLETE."
echo "1. Ensure your CAC is inserted."
echo "2. Run 'pcsc_scan' to verify your reader is detected."
echo "3. Download your .rdpw file to ~/Downloads."
echo "4. Set your identity: export AVD_UPN="first.m.last.mil@army.mil""
echo "5. Run the bridge: ./avd.sh"
echo "------------------------------------------------"
