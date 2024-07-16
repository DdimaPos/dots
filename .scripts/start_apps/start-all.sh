#! /bin/bash
#verify if it is a restart or a boot(use a flag)
#verify the time of last boot
up_time=$(awk '{print $1}' /proc/uptime)
up_time=${up_time%.*}
if [ $(echo "$up_time < 60" | bc) -ne 0 ];then 
    echo "start apps"
    /home/starplatinum/.scripts/start_apps/start-kitty-cava.sh &
    /home/starplatinum/.scripts/start_apps/start-player.sh &    
    sleep 1.5
    #starting sound
    /home/starplatinum/.scripts/start_apps/start-sounds.sh  
else
    echo "Uptime is 60 seconds or more, not running scripts."
fi 
