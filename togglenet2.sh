# togglenet2.sh

INTERFACE="internet"
INTERFACE2="internet"
RATE="100mbps"
BURST="1kbit"
LATENCY="1ms"

CURRENT_QDISC=$(tc qdisc show dev $INTERFACE | grep "tbf")
CURRENT_QDISC2=$(tc qdisc show dev $INTERFACE2 | grep "tbf")

if [ -z "$CURRENT_QDISC" ] && [ -z "$CURRENT_QDISC2" ]; then
    sudo tc qdisc add dev $INTERFACE root tbf rate $RATE burst $BURST latency $LATENCY
    sudo tc qdisc add dev $INTERFACE2 root tbf rate $RATE burst $BURST latency $LATENCY
    echo "Freeze mode activated on both interfaces."
    paplay /home/user/RIT/Sounds/Selffreeze.ogg &
    sleep 1
elif [ -n "$CURRENT_QDISC" ] && [ -n "$CURRENT_QDISC2" ]; then
    paplay /home/user/RIT/Sounds/Selfthaw.ogg &
    sudo tc qdisc del dev $INTERFACE root
    sudo tc qdisc del dev $INTERFACE2 root
    echo "Normal mode restored."
else
    sleep 1
fi
