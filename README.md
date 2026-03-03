# ubuntu-sonicboom

This repository provides a helper script (`avd.sh`) to connect to **Azure Virtual Desktop (AVD)** from Linux using **FreeRDP 3 (Nightly)** with **CAC-based (Smartcard)** authentication and **Google Chrome** for sign-in.

## Quick Start

### 1. Clone the repo
```bash
git clone <your-repo-url>
cd ubuntu-sonicboom
```

### 2. Run the Setup Script
This script installs all dependencies, configures the FreeRDP Nightly repository, and sets up the smartcard service for Ubuntu 24.04.
```bash
chmod +x setup.sh
./setup.sh
```

### 3. Set Your Identity
Add your UPN (email) to your shell profile (e.g., `~/.bashrc`):
```bash
export AVD_UPN="first.m.last.mil@army.mil"
```
Reload your shell: `source ~/.bashrc`

### 4. Connect
Ensure your CAC is inserted, and you have downloaded a fresh `.rdpw` file to `~/Downloads`.
```bash
./avd.sh
```

## How it Works
1.  **Browser Flow:** `avd.sh` launches **Google Chrome (Incognito)** to the Microsoft AAD sign-in page.
2.  **CAC Auth:** Chrome will prompt for your certificate and PIN.
3.  **Redirect:** Once authenticated, Chrome will redirect to a `nativeclient` URL (which may appear as a blank/broken page).
4.  **Copy/Paste:** Copy that **entire URL** from the Chrome address bar and paste it back into your terminal.
5.  **RDP Session:** FreeRDP will use the code from that URL to establish a secure RDP session with your Smartcard redirected.

## Troubleshooting
- **No Reader Detected:** Run `pcsc_scan`. If you don't see your reader, replug it and check `systemctl status pcscd`.
- **Chrome Not Opening:** The script prioritizes `google-chrome --incognito`. If you don't have it, install it via `setup.sh`.
- **Wrongplace URL:** If Chrome redirects to a "Wrongplace" page, hit the "Back" button once and grab the URL with `?code=...`.

## Requirements
- Ubuntu 24.04 (Noble)
- FreeRDP Nightly (with AAD support enabled)
- Google Chrome
- CAC Reader + OpenSC
