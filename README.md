# AVD on Linux (FreeRDP + Firefox + CAC)

This repo provides a helper script (`avd.sh`) that connects to **Azure Virtual Desktop (AVD)** from Linux using **FreeRDP 3 (`sdl-freerdp3`)**, while using **Firefox** for CAC-based sign-in.

It automates:
- launching FreeRDP with the right AVD/Gov flags
- opening Firefox to the AAD sign-in URL
- prompting you to paste the final redirect URL(s) back into FreeRDP (some tenants require 2 redirects)

> Reality check: Entra ID sign-in is a web/OAuth flow. This script doesn’t remove the browser step; it makes it less painful.

---

## Requirements

### Files
- A `.rdpw` file for your AVD Desktop/App (downloaded from your AVD portal).
- Recommended locations:
  - `~/avd/`
  - `~/Downloads/`

The script will auto-select the **newest** `*.rdpw` it finds in those locations if you don’t specify a file.

### Hardware
- CAC reader + CAC card

### Software
- FreeRDP 3 with `sdl-freerdp3`
- `expect`
- `firefox`
- PC/SC smartcard stack (`pcscd`, CCID driver, OpenSC)

---

## Install packages

### Arch Linux / Archcraft
```bash
sudo pacman -Syu
sudo pacman -S freerdp expect firefox pcsc-lite ccid opensc pcsc-tools
sudo systemctl enable --now pcscd
```

Verify the reader:
```bash
pcsc_scan
```

### Debian/Ubuntu
> Many Debian/Ubuntu releases ship FreeRDP 2.x by default. You need FreeRDP **3.x** (with `sdl-freerdp3`).
> If `sdl-freerdp3` is not available in your repos, you may need a newer repo/backport or to build FreeRDP 3.x.

Typical smartcard dependencies:
```bash
sudo apt update
sudo apt install -y expect firefox pcscd opensc pcsc-tools libccid
sudo systemctl enable --now pcscd
```

### Fedora
```bash
sudo dnf install -y freerdp expect firefox pcsc-lite pcsc-lite-ccid opensc pcsc-tools
sudo systemctl enable --now pcscd
```

---

## Getting the `.rdpw` file

Download the `.rdpw` for your desktop/app from your AVD portal.

If you have multiple desktops/regions, you may end up with multiple `.rdpw` files (e.g., `Army Desktop.rdpw`, `Army Desktop(1).rdpw`, etc.). The script includes a `--list` option to make this manageable.

---

## Setup

1) Put the script somewhere convenient:
```bash
mkdir -p ~/avd
cp avd.sh ~/avd/avd.sh
chmod +x ~/avd/avd.sh
```

2) Put your `.rdpw` in one of:
- `~/avd/` (recommended)
- `~/Downloads/`

3) Set your identity (recommended: UPN) in your shell profile.

### zsh (`~/.zshrc`)
```bash
export AVD_UPN="first.m.last.mil@army.mil"
```

Reload:
```bash
source ~/.zshrc
```

Alternative (if you prefer the exact FreeRDP username format):
```bash
export AVD_USER=".\AzureAD\\first.m.last.mil@army.mil"
```

> Use **either** `AVD_UPN` **or** `AVD_USER`.

---

## Usage

### List available `.rdpw` files (grouped by tenant)
```bash
~/avd/avd.sh --list
```

Output is grouped by `tenantId` and highlights the **newest file per tenant** in **green**.

### Print derived config (no connection attempt)
```bash
~/avd/avd.sh --print-config
```

### Connect (auto-select newest `.rdpw`)
```bash
~/avd/avd.sh
```

### Connect with a specific `.rdpw`
```bash
~/avd/avd.sh "$HOME/avd/Army Desktop.rdpw"
```

### Adjust redirect retries (some tenants require multiple hops)
```bash
MAX_REDIRECTS=5 ~/avd/avd.sh
```

### Use a specific `.rdpw` via environment variable
```bash
RDPW="$HOME/avd/Army Desktop(2).rdpw" ~/avd/avd.sh
```

---

## What to expect during sign-in

1. FreeRDP prints a “Browse to:” URL.
2. The script opens Firefox (private window) to that URL.
3. Complete CAC sign-in in Firefox.
4. Copy the final redirect URL from the address bar (it must contain `?code=...`) and paste it into the terminal when prompted.
5. Sometimes FreeRDP asks for a second redirect. Repeat the copy/paste.

---

## Troubleshooting

### `pcsc_scan` doesn’t see the reader
- Confirm `pcscd` is running:
  ```bash
  systemctl status pcscd
  ```
- Replug the reader / try another USB port.
- Confirm CCID package is installed:
  - Arch: `ccid`
  - Debian/Ubuntu: `libccid`
  - Fedora: `pcsc-lite-ccid`

### Firefox doesn’t prompt for a CAC certificate
- Ensure OpenSC is installed (`opensc`).
- If needed, add the PKCS#11 module in Firefox:
  - Settings → Privacy & Security → Certificates → Security Devices → Load
  - Common module path: `/usr/lib/opensc-pkcs11.so` (path varies)

### In-session CAC websites still don’t work
This script enables smartcard redirection (`/smartcard`), but the remote host pool must also allow it.
Inside the AVD session, verify:
- Device Manager → Smart card readers
- `certmgr.msc` shows CAC certs

If the reader never appears, smartcard redirection may be blocked by policy on the AVD side.

### “User isn’t authorized to access resource …”
That usually means the `.rdpw` you’re using targets a desktop/pool you aren’t assigned to (or your access changed).
- Download a fresh `.rdpw` from the correct desktop tile.
- Use `--list` to see all `.rdpw` files grouped by tenant and pick the right one.

### “wrongplace” redirect appears after showing the `nativeclient?code=...` URL
Some tenants briefly show the correct redirect URL and then redirect to a “wrongplace” page.
Workarounds:
- Copy the `...nativeclient?code=...` URL immediately when it appears.
- If it flips to wrongplace, hit Back once and copy the previous URL.

---

## Security notes

- The redirect URL you paste into the terminal contains a short-lived auth code.
  Treat it like a password: don’t paste it into chat logs, tickets, or screenshots.
- Consider keeping terminal scrollback minimal when authenticating.

---

## Disclaimer

This is an unofficial helper script. Use it in accordance with your organization’s security policies.
