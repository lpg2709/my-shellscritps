#!/bin/bash

# Change the screen temperature
# 	0 turn off
# 	1 turn on

# Key bind: ctrl+up
# 	1 turn on
# Key bind: ctrl+down
# 	0 turn off

# Dependency
# 	sudo apt install sct

icon="colors-chromagreen"
STATE="off"
if [ $# -eq 0 ]
then
	sct
else
	if [ "$1" -eq "1" ] 
	then
		STATE="on"
		icon="colors-chromablue"
		sct 4500
	else
		sct
	fi
fi

notify-send --hint=int:transient:1 -i $icon "Blue Filter: $STATE"
