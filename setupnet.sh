#!/bin/bash

# File directory
SCRIPT_DIR="/home/user/Utility"
FILES=("togglenet.sh" "togglenet2.sh" "togglenet3.sh" "togglenet4.sh" "togglenet5.sh" "deletenet.sh")

# Function to list all available network interfaces
list_interfaces() {
    ip -o link show | awk -F': ' '{print $2}'
}

# Function to prompt user for interface selection
select_interfaces() {
    local interfaces=($(list_interfaces))
    local num_interfaces=${#interfaces[@]}

    if [ "$num_interfaces" -eq 0 ]; then
        echo "No network interfaces found!"
        exit 1
    fi

    echo "Available network interfaces:"
    for i in "${!interfaces[@]}"; do
        echo "$((i+1)). ${interfaces[$i]}"
    done

    read -p "Select primary interface (number): " choice1
    INTERFACE=${interfaces[$((choice1-1))]}

    read -p "Select secondary interface (optional, press Enter to use the same as primary): " choice2
    if [[ -n "$choice2" ]]; then
        INTERFACE2=${interfaces[$((choice2-1))]}
    else
        INTERFACE2="$INTERFACE"  # Duplicate primary interface if secondary is not chosen
    fi
}

# Run interface selection
select_interfaces

# Function to update INTERFACE lines in files
update_interface_in_file() {
    local file="$1"
    sed -i "s/^INTERFACE=\".*\"/INTERFACE=\"$INTERFACE\"/" "$file"
    sed -i "s/^INTERFACE2=\".*\"/INTERFACE2=\"$INTERFACE2\"/" "$file"
}

# Update each file with the selected interfaces
for file in "${FILES[@]}"; do
    FILE_PATH="$SCRIPT_DIR/$file"
    if [[ -f "$FILE_PATH" ]]; then
        update_interface_in_file "$FILE_PATH"
        echo "Updated $FILE_PATH"
    else
        echo "Warning: $FILE_PATH not found!"
    fi
done

echo "Interface settings updated in all scripts."
