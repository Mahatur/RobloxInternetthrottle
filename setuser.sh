#!/bin/bash

read -p "Enter the target username: " TARGET_USER

# Define paths
OLD_PATH="/home/mahatur/Utility"
NEW_PATH="/home/$TARGET_USER/Utility"

# Replace all occurrences in scripts or configs
find /home/"$TARGET_USER" -type f -exec sed -i "s|$OLD_PATH|$NEW_PATH|g" {} +

echo "Replaced all occurrences of $OLD_PATH with $NEW_PATH for user $TARGET_USER."

