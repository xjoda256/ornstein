#!/bin/bash
while :
do
    if systemctl status minecraftd.service |grep -q "running"; then
        printf "󰍳  " > .local/bin/mcsrv
else
        printf "󰍳  " > .local/bin/mcsrv
fi
    sleep 120
done
