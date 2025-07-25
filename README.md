# RobloxInternetthrottle

> ⚠️ **Disclaimer**:  
> This tool is intended for **educational and diagnostic purposes only**.  
> Misuse on public servers or against other players may violate platform rules.  
> You are solely responsible for any consequences.  
> **Read and follow all instructions first.**

## 🧠 Overview

`RobloxInternetthrottle` uses Linux's traffic control system (`tc`) to throttle or freeze a device’s internet connection, simulating **lag spikes** or **freeze states**.

Discovered unintentionally during poor internet testing — later refined to act as an external desync mechanism for Roblox clients.

When throttled hard enough, Roblox will treat your client as frozen, yet still processes **local input** — allowing things like:

- **Hitting other players' hitboxes** before they can react  
- **Avoiding incoming damage**  
- **Teleport-like behavior** on reconnection

## ✨ Features

- Toggle between:
  - 🟢 **Normal mode**
  - ❄️ **"Freeze" mode**
- External or local control
- Minimal dependencies
- Fast script switching with optional audio cues

## 🛠 Example Use Cases

### 🔌 External throttle (safe & stealthy)
Use a Raspberry Pi, Orange Pi, or any Linux device to sit *between* the game device and the internet:

```
  [Client] <—> [Linux device] <—> [Router]
```

Works with:
- Windows
- Android
- iOS (iPhone)
- macOS
- Game consoles (PS5/Xbox)
- Anything that runs Roblox

### 🖥 Local throttle
Install and run directly on a Linux gaming machine to desync itself.

## 🧩 Requirements

- ✅ Linux (tested on Ubuntu, Arch orangepi, Raspberry Pi OS)
- ✅ `tc` (part of `iproute2`)  
- ✅ Root or sudo privileges
- 🔈 Optional: `paplay` for audible feedback
- 🧠 Optional: `wondershaper` for simpler bandwidth limits

> 📦 Works on any system including **Flatpak-based environments**, as long as host networking is available and `tc` is accessible.

> 👤 Adjust user with `Setuser.sh`
> ⚙️ Adjust interfaces with `Setupnet.sh`

## 🧠 Notes

- You *must* ensure this does **not** break your router, home internet, or interfere with others.
- Avoid long freezes unless testing in safe environments.
- It’s an external-level exploit — Roblox doesn’t know it’s happening unless server-side checks exist, which the same reason you got kicked for bad internet.

## 🪪 License

> **Free to use, modify, and fork.**  
> Use responsibly — and don’t blame the author if it bricks your connection or triggers a ban.
