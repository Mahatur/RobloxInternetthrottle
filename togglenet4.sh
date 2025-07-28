#!/bin/bash
# togglenet4.sh
INTERFACE="internet"
INTERFACE2="internet"
DELAY="25000ms"

CURRENT_QDISC=$(tc qdisc show dev $INTERFACE | grep "netem")
CURRENT_QDISC2=$(tc qdisc show dev $INTERFACE2 | grep "netem")

if [ -z "$CURRENT_QDISC" ] && [ -z "$CURRENT_QDISC2" ]; then
    sudo tc qdisc add dev $INTERFACE root netem delay $DELAY
    sudo tc qdisc add dev $INTERFACE2 root netem delay $DELAY
    echo "Delays added to both interfaces."
    paplay /home/user/RIT/Teleport.ogg
    sleep 1
elif [ -n "$CURRENT_QDISC" ] && [ -n "$CURRENT_QDISC2" ]; then
    paplay /home/user/RIT/Teleport1.ogg
    sudo tc qdisc del dev $INTERFACE root netem
    sudo tc qdisc del dev $INTERFACE2 root netem
    echo "Delays removed from both interfaces."
fi
