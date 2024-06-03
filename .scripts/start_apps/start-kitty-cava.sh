#! /bin/bash

# Launch the first kitty terminal and run the first utility (cava)
kitty --hold cava &
PID1=$!


# Get the window ID of the first kitty terminal
WINDOW_ID1=$(xdotool search --sync --onlyvisible --pid $PID1)

# Set the first window to floating mode
bspc node "$WINDOW_ID1" -t floating

# Resize and move the first window to the desired position
bspc node "$WINDOW_ID1" -v "-450" "450"

bspc node "$WINDOW_ID1" -z right 10 0

bspc node "$WINDOW_ID1" -z bottom 0 "-230"
