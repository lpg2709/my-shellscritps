#!/bin/bash

printf "\n  ANSI escape code Colors\n\n"

for i in {0..11}
do
	for j in {0..9}
	do
		n=$((10*${i}+${j}))
		if [ ${n} -gt 108 ] 
		then 
			break 
		fi
		printf "\033[${n}m  ${n}\033[m"
	done
		printf "\n"
done

exit 0

