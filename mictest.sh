#!/bin/bash


# Loopback to output the input audio.

# Dependency
# 	sudo apt install pavucontrol

function trap_CRTL_C (){
	pactl unload-module module-loopback
	exit 2
}

trap "trap_CRTL_C" 2 


echo "----- MIC TEST RUNNING -----"

pactl load-module module-loopback latency_msec=1

echo "Press [CTRL+C] to stop.."
while :
do
	sleep 1
done

