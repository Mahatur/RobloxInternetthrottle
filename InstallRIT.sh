#!/bin/bash

# Exit on any error
set -e

# Detect the real user (even if script is run via sudo)
TARGET_USER=$(logname)
TARGET_HOME="/home/$TARGET_USER"
SOURCE_DIR="$TARGET_HOME/Downloads/RobloxInternetthrottle-main"
TARGET_DIR="$TARGET_HOME/RIT"

# Check for root (prevent execution as root)
if [ "$EUID" -eq 0 ]; then
    echo "❌ Please run this script as a normal user, not root."
    exit 1
fi

# Confirm source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Source directory '$SOURCE_DIR' not found."
    echo "➡️ Make sure you've extracted 'RobloxInternetthrottle-main' to your Downloads folder."
    exit 1
fi

# Move the folder
echo "📦 Moving RobloxInternetthrottle-main to ~/RIT..."
mv "$SOURCE_DIR" "$TARGET_DIR"

# Make scripts executable
chmod +x "$TARGET_DIR/setuser.sh"
chmod +x "$TARGET_DIR/setupnet.sh"

# Change to the RIT directory
cd "$TARGET_DIR"

# Run setuser.sh
echo "⚙️ Running setuser.sh..."
./setuser.sh

# Run setupnet.sh
echo "⚙️ Running setupnet.sh..."
./setupnet.sh

echo "✅ RobloxInternetthrottle installed and configured successfully!"
