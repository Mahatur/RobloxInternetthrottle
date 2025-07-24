# RobloxInternetthrottle

> ⚠️ **Disclaimer**: This project is intended for **educational and diagnostic purposes only**. Do not use this to exploit Roblox or interfere with other users' gameplay. You are responsible for how you use this tool. read and follow instructions first!!!.

## Overview

This script leverages Linux's traffic control (`tc`) capabilities to throttle internet speed to an extreme degree — simulating lag on demand.  
It can create a **"freeze" effect** in Roblox, which may allow teleporting, invulnerability, or other desynchronization effects when executed properly.

Discovered when testing network latency during personal slow internet conditions.

## Key Features

- Toggle between **normal** and **"freeze"** mode
- Works with any Linux system that supports `tc` and/or `wondershaper`
- Can be run on the client itself or externally (e.g. Raspberry Pi)

## Example Use Cases

- **External control**:  
  Raspberry Pi 4B (running the script) controlling the internet link to a **Windows PC**, Android device, IOS iphone, MACos, consoles, or any other game client.

- **Local use**:  
  Run directly on a **Linux-based gaming PC** to control its own connection delay.

## Requirements

- Linux OS (tested on Ubuntu)
- `tc` (traffic control utility, part of `iproute2`)
- Optional: `paplay` for sound feedback
- Root/sudo privileges

## Notes

- The `RATE`, `BURST`,`LATENCY`, and `wondershaper` settings are purposely set to make traffic **extremely throttled**.
- Adjust interface names as needed (`ip addr` to see yours).
- Sound cues are optional and customizable.

## License

Do whatever you want with it — just don’t blame the author if it breaks your router or gets you banned.
