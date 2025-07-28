#!/bin/bash
# togglenet3.sh
INTERFACE="internet"
INTERFACE2="internet"
DOWNLOAD="10"
UPLOAD="0"
FLAG_FILE="/home/user/RIT/wondershaper_active"

if [ ! -f "$FLAG_FILE" ]; then
    sudo wondershaper $INTERFACE $DOWNLOAD $UPLOAD
    sudo wondershaper $INTERFACE2 $DOWNLOAD $UPLOAD
    touch "$FLAG_FILE"
    echo "You-freeze mode activated."
    paplay /home/user/RIT/Sounds/Otherfreeze.ogg &
else
    sudo wondershaper clear $INTERFACE
    sudo wondershaper clear $INTERFACE2
    rm "$FLAG_FILE"
    echo "Normal mode restored."
    paplay /home/user/RIT/Sounds/Otherthaw.ogg &
fi
