#!/bin/bash
while :
do
	printf " capra $(df -h /mnt/capra |grep /dev/sdc |cut -d ' ' -f '14')% 󰋊 " > .local/bin/capra
    sleep 60
done
