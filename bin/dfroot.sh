#!/bin/bash
while :
do
	printf "$(hostnamectl hostname) $(df -h / |grep /dev/sda2 |cut -d ' ' -f '14')% 󰋊 " > .local/bin/dfroot
    sleep 60
done
