#! /bin/sh

# Show the curent status of the microphone: muted or unmuted
# Key bind: ctrl+f10

state=`amixer -D pulse get Capture | gawk 'match($0, /(Front Left|Mono).*\[(.*)\]/, a) {print a[2]}'`
if [ "$state" = "off" ]; then
		icon="microphone-sensitivity-muted"
	else
		icon="microphone-sensitivity-high"
fi
notify-send --hint=int:transient:1 -i $icon "Microphone: $state"

