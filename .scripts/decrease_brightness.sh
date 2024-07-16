#!/bin/bash

# Get the display name (assuming primary display)
display_name=$(xrandr --verbose | grep " connected" | awk '{ print $1 }')

# Get the current brightness value
current_brightness=$(xrandr --verbose | grep -i brightness | awk '{print $2}')

# Calculate the new brightness value (decrease by 10%)
new_brightness=$(echo "$current_brightness - 0.1" | bc)

# Ensure the new brightness value doesn't go below 0.1
if (( $(echo "$new_brightness < 0.1" | bc) )); then
    new_brightness=0.1
fi

# Set the new brightness value
xrandr --output "$display_name" --brightness $new_brightness
