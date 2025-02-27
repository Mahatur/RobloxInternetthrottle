#!/bin/bash
INTERFACE="internet"
INTERFACE2="internet"
PIDFILE="/tmp/lag_toggle.pid"

if [ -f "$PIDFILE" ]; then
PID=$(cat "$PIDFILE")
kill -9 $PID
rm "$PIDFILE"
sudo tc qdisc del dev $INTERFACE root
sudo tc qdisc del dev $INTERFACE2 root
sudo tc qdisc add dev $INTERFACE root pfifo_fast
sudo tc qdisc add dev $INTERFACE2 root pfifo_fast
exit 0
fi

(
while true; do
RATE=$((50000 + RANDOM % 100000))kbps
LATENCY=$((1 + RANDOM % 10))ms
sudo tc qdisc add dev $INTERFACE root tbf rate $RATE burst 1kbit latency $LATENCY
sudo tc qdisc add dev $INTERFACE2 root tbf rate $RATE burst 1kbit latency $LATENCY
sleep $(awk -v min=0.10 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
sudo tc qdisc del dev $INTERFACE root
sudo tc qdisc del dev $INTERFACE2 root
paplay /home/user/Utility/timer.ogg &
sleep $(awk -v min=0.10 -v max=1 'BEGIN{srand(); print min+rand()*(max-min)}')
done
) &

echo $! > "$PIDFILE"
