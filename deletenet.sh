#!/bin/bash
INTERFACE="internet"
INTERFACE2="internet"
rm /home/user/RIT/wondershaper_active
sudo tc qdisc del dev $INTERFACE root
sudo tc qdisc del dev $INTERFACE2 root
sudo wondershaper clear $INTERFACE
sudo wondershaper clear $INTERFACE2
paplay /home/user/RIT/Sounds/Chest.ogg &
echo "All traffic controls cleared!"
