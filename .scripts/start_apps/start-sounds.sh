#!/bin/bash

#########################################
#From Staplatinum to Arch btw enjoyers#
########################################

#paplay - pipewire/pulseaudio; aplay - alsa
paplay /home/starplatinum/.scripts/start_apps/sounds/start_sound.mp3

#######Prep. the variables related to time and file paths#######
#specify the file to write/read from
output_file="/home/starplatinum/.scripts/start_apps/boot_date.txt"

#get the current date and time
current_date_time=$(date '+%Y-%m-%d %H:%M:%S')
current_date=$(date '+%Y-%m-%d')
current_hour=$(date '+%H')
#current_hour=00 #test case
#get last boot time
boot_date_time=$(cat "$output_file" 2>/dev/null || echo "")
boot_date=$(echo "$boot_date_time" | cut -d ' ' -f 1)
boot_hour=$(echo "$boot_date_time" | cut -d ' ' -f 2 | cut -d ':' -f 1)
################################################################


########compare if current date of boot is same as in file
if [ "$current_date" != "$boot_date" ]; then
    case $current_hour in
        21|22|23|00|01|02|03)
            paplay /home/starplatinum/.scripts/start_apps/sounds/night_g.ogg
            #night_g.ogg
            #sound for night
            echo "night"
            ;;
        04|05|06|07|08|09|10)
            paplay /home/starplatinum/.scripts/start_apps/sounds/morning_g.mp3 #bug. need to replace
            #sound for morning
            echo "early_morning"
            ;;
        11|12|13|14|15)
            paplay /home/starplatinum/.scripts/start_apps/sounds/afternoon_g.ogg 
            #sound for afternoon
            echo "afternoon"
            ;;
        16|17|18|19|20) 
            paplay /home/starplatinum/.scripts/start_apps/sounds/evening_g.ogg 
            #sound for evening
            echo "evening"
            ;;
        *) echo "couldn't process the hour";;
    esac
else 
    #set the threshold for the difference in hours
    threshold=7
    hour_difference=$((current_hour - boot_hour))
    if ((hour_difference > threshold ));then
        #sound for big pause
        paplay /home/starplatinum/.scripts/start_apps/sounds/missing_g.ogg 
        echo "$hour_difference yay"
    fi  
fi

#######################################################3


###########Rewrite the date of last boot##############

#clear the contents of the file
: > "$output_file"
#write the date and time to the file
echo "$current_date_time" > "$output_file"
#echo "Current date and time written to $output_file"
#####################################################