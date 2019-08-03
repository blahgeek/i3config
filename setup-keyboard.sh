#!/bin/sh -ex

sudo killall xkeysnail || true
nohup sudo xkeysnail --watch ~/.config/i3/xkeysnail.config.py > /dev/null 2>&1 &
sleep 3

killall xcape || true
xcape -e "Hyper_R=Menu"

xmodmap ~/.Xmodmap
xset r rate 200 25
