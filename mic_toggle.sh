#! /bin/sh

# Original code from:
# 	https://gist.github.com/Vftdan/8db21e38d5f626f8abae2e43e521c8bb

# Mute and unmute microphone
# With icon indicating the state of the mic
# Key bind: ctrl+f9

state=`amixer -D pulse set Capture toggle | gawk 'match($0, /(Front Left|Mono).*\[(.*)\]/, a) {print a[2]}'`
if [ "$state" = "off" ]; then
	icon="microphone-sensitivity-muted"
else
	icon="microphone-sensitivity-high"
fi
notify-send --hint=int:transient:1 -i $icon "Microphone: $state"

