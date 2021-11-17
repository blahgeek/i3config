#!/bin/bash

start() {
    nohup "$@" > /dev/null 2>&1 &
}

start zeal
start goldendict
start dunst
start safeeyes

if [[ "$(hostname)" =~ [Bb]raavos ]]; then
    # lack user systemd in Braavos
    start pulseaudio --start
    start redshift
    start rslsync
    start nm-applet
fi

if [[ "$(hostname)" =~ [Oo]ldtown ]]; then
    # start ~/.local/bin/minions
    start ~/.config/i3/scripts/sensible-terminal
    start blueman-applet
fi
