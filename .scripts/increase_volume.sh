#!/bin/bash
current_volume=$(pactl get-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo | grep "ront-left:" | sed 's/.* \([0-9]\+\)%.*/\1/')
if (( $(echo "$current_volume < 100" |bc ))); then
        pactl set-sink-volume 0 +3%
fi
