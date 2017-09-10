#!/bin/bash

SETLED=~/.config/i3/setled

dbus-monitor "path='/inputmethod',member='PropertiesChanged'" |
while read -r line; do
    echo "$line"
    CURRENT=$(fcitx-remote)
    if [ "$CURRENT" = "2" ]; then # current active
        $SETLED +caps
    else
        $SETLED -caps
    fi
done
