#!/bin/sh -ex

# Use xkeysnail instead of xmodmap to remap keys because it works across keyboards (hotplug)
# And it's much simpler
sudo killall xkeysnail || true
nohup sudo xkeysnail --watch ~/.config/i3/xkeysnail.config.py > /dev/null 2>&1 &
sleep 3

# Capslock is now Super_R.
# Use it for IM switching only, remove it from mod4

# We need to add Super_R to another mod to make the removing working
xmodmap -e "remove mod4 = Super_R"
xmodmap -e "add mod3 = Super_R"

xset r rate 200 25
