#!/bin/bash
#################
## another ######
## ×Joda™ #######
## masterpiece ##
#################

SMOUGH=$(printf "smough $(df -hBG / |sed -n 2p |cut -b 36-40) 󰋊 │ ")
KALAMEET=$(printf "kalameet $(df -hBG /mnt/kalameet |sed -n 2p |cut -b 36-40) 󰋊 │ ")
CAPRA=$(printf "capra $(df -hBG /mnt/capra |sed -n 2p |cut -b 36-40) 󰋊 │ ")
TAURUS=$(printf "taurus $(df -hBG /mnt/taurus |sed -n 2p |cut -b 36-40) 󰋊 │ ")
CPU=$(sensors |grep Package |printf " $(cut -b '17,18')° ")
GPU=$(sensors |grep edge |printf "󰢮 $(cut -b '16,17')° ")

echo "${SMOUGH}${KALAMEET}${CAPRA}${TAURUS}${GPU}${CPU}"

