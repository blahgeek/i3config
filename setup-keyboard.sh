#!/bin/sh -ex

sudo killall xkeysnail || true
nohup sudo xkeysnail --watch ~/.config/i3/xkeysnail.config.py > /dev/null 2>&1 &
sleep 2

xmodmap ~/.Xmodmap
xset r rate 200 25
