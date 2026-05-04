#!/bin/bash
for i in {1..18}
do
	echo -en "\e[38;5;$(sed -n ${i}p wombat.txt)m$(sed -n ${i}p lorem.txt) "
done

