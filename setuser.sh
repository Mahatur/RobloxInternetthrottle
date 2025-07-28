#!/bin/bash

# Automatically detect the username of the current user
TARGET_USER=$(whoami)

# Define the base directory
BASE_DIR="/home/$TARGET_USER/Utility"

# List of config files to update
CONFIG_FILES=("togglenet.sh" "togglenet2.sh" "togglenet3.sh" "togglenet4.sh" "togglenet5.sh" "setupnet.sh")

# Loop through each config file and replace "/home/user" with "/home/$TARGET_USER"
for CONFIG in "${CONFIG_FILES[@]}"; do
    CONFIG_PATH="$BASE_DIR/$CONFIG"

    if [ -f "$CONFIG_PATH" ]; then
        sed -i "s|/home/user|/home/$TARGET_USER|g" "$CONFIG_PATH"
        echo "Updated: $CONFIG_PATH"
    else
        echo "Warning: $CONFIG_PATH not found, skipping..."
    fi
done

echo "All specified config files updated with '/home/$TARGET_USER'."
