#!/bin/bash

function get-focused-emacs-server-name()
{
    local window=$(i3-msg -t get_tree | jq -r ".. | select(.focused? == true).window")
    xprop -id "$window" EMACS_SERVER_NAME | sed -nE 's/^EMACS_SERVER_NAME.*= "(.+)"/\1/p'
}

function i3-move()
{
    i3-msg focus "$1"
}

function emacs-move()
{
    emacsclient -s "$2" -e "(evil-window-$1 1)"
}

function perform-move()
{
    local server_name=$(get-focused-emacs-server-name)
    if [ -n "$server_name" ]; then
        emacs-move "$1" "$server_name"
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
