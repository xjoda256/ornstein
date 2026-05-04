#!/usr/bin/env bash
#############
## wbwx.sh ##
## ×Joda™ ###
#############

sed -n '10p;13p;16p' .cache/com.gitlab.bitseater.meteo/current.txt | tr '\n' ' ' | awk '{print $1, $2, $4, $5":", $7$8" │"}'

