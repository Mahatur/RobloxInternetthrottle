# togglenet.sh
INTERFACE="internet"
INTERFACE2="internet"
SPEED="1kbit"

CURRENT_QDISC=$(tc qdisc show dev $INTERFACE | grep "tbf")
CURRENT_QDISC2=$(tc qdisc show dev $INTERFACE2 | grep "tbf")

if [ -z "$CURRENT_QDISC" ] && [ -z "$CURRENT_QDISC2" ]; then
    sudo tc qdisc add dev $INTERFACE root tbf rate $SPEED burst 4kbit latency 500ms
    sudo tc qdisc add dev $INTERFACE2 root tbf rate $SPEED burst 4kbit latency 500ms
    echo "Speed limit added to both interfaces."
    paplay /home/user/Utility/Sounds/Lag.ogg &
    sleep 1
elif [ -n "$CURRENT_QDISC" ] && [ -n "$CURRENT_QDISC2" ]; then
    paplay /home/user/Utility/Sounds/Lag1.ogg &
    sleep 3
    sudo tc qdisc del dev $INTERFACE root
    sudo tc qdisc del dev $INTERFACE2 root
    echo "Speed limits removed from both interfaces."
else
    sleep 1
fi
