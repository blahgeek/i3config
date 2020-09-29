#!/bin/bash

function get-focussed-window()
{
    i3-msg -t get_tree | jq -r ".. | select(.focused? == true).window_properties.class"
}

function i3-move()
{
    i3-msg focus "$1"
}

function emacs-move()
{
    emacsclient -e "(evil-window-$1 1)"
}

function perform-move()
{
    local focussed_workspace=$(get-focussed-window)
    if [ "$focussed_workspace" = "Emacs" ]; then
        emacs-move "$1"
        local result=$?
        if [ $result -ne 0 ]; then
            i3-move "$1"
        fi
    else
        i3-move "$1"
    fi
}

case "$1" in
    left) ;&
    right) ;&
    up) ;&
    down)
        perform-move "$1";;
    *) echo "command not found";;
esac
