#!/bin/bash
INTERFACE="internet"
INTERFACE2="internet"
DOWNLOAD="10"
UPLOAD="0"
PIDFILE="/tmp/wondershaper_toggle.pid"

if [ -f "$PIDFILE" ]; then
    PID=$(cat "$PIDFILE")
    kill -9 $PID 2>/dev/null
    rm "$PIDFILE"
    sudo wondershaper clear $INTERFACE
    sudo wondershaper clear $INTERFACE2
    echo "Wondershaper toggle stopped and cleared."
    exit 0
fi

(
while true; do
    # Apply wondershaper throttling
    sudo wondershaper $INTERFACE $DOWNLOAD $UPLOAD
    sudo wondershaper $INTERFACE2 $DOWNLOAD $UPLOAD
    sleep 2
    
    # Clear wondershaper throttling
    sudo wondershaper clear $INTERFACE
    sudo wondershaper clear $INTERFACE2
    paplay /home/user/Utility/timer.ogg &
    sleep 0.1
done
) &

echo $! > "$PIDFILE"
