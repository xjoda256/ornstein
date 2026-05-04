#!/bin/bash
while :
do
    printf " $(date +%H:%M)" > ~/.local/bin/time
    sleep 30
done
