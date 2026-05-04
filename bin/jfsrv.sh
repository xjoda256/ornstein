#!/bin/bash
while :
    do
        if systemctl status jellyfin.service |grep -q "running"; then
    printf "󰼁  " > .local/bin/jfsrv
else
    printf "󰼁  " > .local/bin/jfsrv
fi
    sleep 120    
done
