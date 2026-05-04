#!/bin/bash
while :
do
    sensors |grep edge |printf "󰃽 $(cut -b '16,17,20,21')" 
    sleep 30
done
