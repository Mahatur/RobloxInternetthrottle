#!/bin/bash
INTERFACE="internet"
INTERFACE2="internet"
rm /home/user/Utility/wondershaper_active
sudo tc qdisc del dev $INTERFACE root
sudo tc qdisc del dev $INTERFACE2 root
sudo wondershaper clear $INTERFACE
sudo wondershaper clear $INTERFACE2
paplay /home/user/Utility/Door.ogg &
echo "All traffic controls cleared!"
