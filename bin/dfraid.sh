#!/bin/bash
while : 
do
	printf "kalameet $(df -h /mnt/raid |grep /dev/sdb |cut -d ' ' -f '15')% 󰋊 " >.local/bin/dfraid
    sleep 60
done
