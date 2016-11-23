#!/bin/bash

SETLED=~/.config/i3/setled

CURRENT=$(ibus engine)
if [ "$CURRENT" = "rime" ]; then
    ibus engine xkb:us::eng
    $SETLED -caps
else
    ibus engine rime
    $SETLED +caps
fi
