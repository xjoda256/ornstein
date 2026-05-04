#!/bin/bash
while :
do
    sensors |grep Package |printf " $(cut -b '17,18,21,22')"
    sleep 30 
done
