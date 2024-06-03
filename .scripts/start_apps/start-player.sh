#! /bin/bash
# Launch the spotify
env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --uri=%U &
PID2=$!

# Wait for the second window to appear
#sleep 1
# Get the window ID of the second window
WINDOW_ID2=$(xdotool search --sync --onlyvisible --pid $PID2)

# Set the second window to floating mode
bspc node "$WINDOW_ID2" -t floating

# Resize and move the second window to the desired position
#upper left side
#sleep 1
#bspc node "$WINDOW_ID2" -p 600 300 

#bspc node "$WINDOW_ID2" -z right 10 0

#bspc node "$WINDOW_ID2" -z bottom 0 20
