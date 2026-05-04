#!/usr/bin/env bash

IFS=$'\n' disks_array=( $(ls -1 /dev/disk/by-label/) )

for line in "${disks_array[@]}"; do
	df -hBG /dev/disk/by-label/$line |sed -n 2p |cut -b 36-40 |tr '\n' ' '
done

