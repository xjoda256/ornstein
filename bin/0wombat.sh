#!/bin/bash
while read color
do
	echo -e "\e[38;5;${color}m$(sed -n 1p lorem.txt)"
done < wombat.txt

