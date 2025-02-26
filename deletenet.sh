#!/bin/bash
INTERFACE="internet"
INTERFACE2="internet"

sudo tc qdisc del dev $INTERFACE root
sudo tc qdisc del dev $INTERFACE root
sudo wondershaper clear $INTERFACE
sudo wondershaper clear $INTERFACE
paplay /home/user/Utility/Door.ogg &
echo "All traffic controls cleared!"
