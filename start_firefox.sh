#!/bin/sh
# Start Firefox in the background
firefox --kiosk "$1" &
FIREFOX_PID=$!

sleep 5

# Resize the Firefox window
xdotool search --onlyvisible --class Firefox windowsize 100% 100%

# Wait for the Firefox process to exit
wait $FIREFOX_PID
EXIT_STATUS=$?

# Exit the script with the same status as Firefox
exit $EXIT_STATUS