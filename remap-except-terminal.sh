#!/bin/sh

APP=$(xprop -id `xdotool getactivewindow` |awk '/WM_CLASS/{print $4}')

if [ "$APP" = "\"konsole\"" ]; then
	if [ -n "$2" ]; then
		sleep 0.1
		xdotool key --clearmodifiers "$2"
	fi
else
	sleep 0.1
	xdotool key --clearmodifiers "$1"
fi
