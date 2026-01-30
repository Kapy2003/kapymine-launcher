<center><img src="https://raw.githubusercontent.com/Kapy2003/Kapymine-Launcher/refs/heads/main/kapymine.png" alt="Kapymine Launcher Icon" width="110" /></center>

# 🎮 Kapymine Launcher

**A fast, minimal, Bash-based Minecraft launcher wrapper for Linux power users.**

Kapymine Launcher is a **high-performance Minecraft launcher wrapper written entirely in Bash**, built for users who want a **clean, no-bloat, OG Linux experience**.
It is optimized for **Arch Linux**, **Hyprland**, and lightweight desktop environments.

Designed with simplicity and speed in mind — no Electron, no telemetry, just pure shell.

---

## ✨ Why Kapymine?

🚀 **Lightning-fast & lightweight**
Built using Bash + Yad, Kapymine runs instantly and consumes almost no system resources.

🎨 **Custom Yad UI (Zenity → Yad upgrade)**
A modern, color-coded interface for better UX:

* 🟢 **Play** button — Emerald Green `#27ae60`
* 🔵 **Install** button — Belize Blue `#2980b9`

🧠 **Beginner-friendly, power-user approved**
Perfect for Linux newbies who want things to *just work*, while still respecting the Linux philosophy.

📺 **Made for the Linux community**
Created with **Mrwho hq** viewers in mind — clean tools, no nonsense.

---

## 🚀 Features

✅ Auto-creates **offline Minecraft accounts** (PrismLauncher compatible)<br>
✅ Automatically fetches the **latest vanilla Minecraft version** from Mojang’s official manifest<br>
✅ Auto-generates and manages **multiple Minecraft instances**<br>
✅ Clean **Yad-based GUI** with color-coded actions<br>
✅ Fully **PrismLauncher-compatible instance structure**<br>
✅ Simple install & uninstall scripts<br>
✅ No background services, no tracking, no bloat<br>

---

## 📂 Project Structure

```
Kapymine-Launcher/
├── kapymine-launcher.sh   # Main launcher script
├── install.sh             # Installer script
├── uninstall.sh           # Uninstaller script
├── kapymine.png           # Application icon
└── README.md              # Documentation
```

---

## 🧩 Dependencies

* `jq` – JSON parsing
* `yad` – GUI dialogs
* `uuidgen` – Instance identifiers

---

## 💻 Installation

### 🟦 Arch Linux / Arch-based Distros

```bash
sudo pacman -S --needed git jq yad util-linux
git clone https://github.com/Kapy2003/Kapymine-Launcher.git --depth 1
cd Kapymine-Launcher
./install.sh && exit
```

### 🟩 Debian / Ubuntu-based Distros

```bash
sudo apt update
sudo apt install git jq yad uuid-runtime
git clone https://github.com/Kapy2003/Kapymine-Launcher.git --depth 1
cd Kapymine-Launcher
./install.sh
```

---

## 🗑️ Uninstallation

```bash
cd Kapymine-Launcher
./uninstall.sh
```

---

## ⚠️ Disclaimer

> **This project is intended for educational and personal use only.**
> Kapymine Launcher is not affiliated with Mojang or Microsoft.
> Users are responsible for complying with Minecraft’s EULA.

---

## ❤️ Credits

* Mojang — Minecraft & version manifests
* PrismLauncher — instance structure inspiration
* Linux community — for keeping things clean & fast

---

**Kapymine Launcher — Minecraft, the Linux way.** 🐧🎮
