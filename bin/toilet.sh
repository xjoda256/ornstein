#!/bin/bash

for font in /usr/share/figlet/*.tlf; do
	echo "$font"
	toilet -f "$(basename "$font" .tlf)" "xJoda"
	echo
done
