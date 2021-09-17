#!/bin/sh

# Disable USB auto-suspend for my mouse on startup
sleep 5;
MOUSE="/sys/bus/usb/devices/1-9.5/power/control";
if [ -f "$MOUSE" ]; then
    echo 'on' > $MOUSE;
fi