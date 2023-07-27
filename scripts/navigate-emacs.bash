#!/bin/bash

function get-emacs-server-name-prop()
{
    local window=$(i3-msg -t get_tree | jq -r ".. | select(.focused? == true).window")
    xprop -id "$window" EMACS_SERVER_NAME | sed -nE 's/^EMACS_SERVER_NAME.*= "(.+)"/\1/p'
}

function get-emacs-server-name-title()
{
    i3-msg -t get_tree | \
        jq -r ".. | select(.focused? == true).window_properties.title" | \
        sed -nE 's/^Emacs:SERVER_NAME=(.+)/\1/p'
}

function get-emacs-server-name()
{
    local name="$(get-emacs-server-name-prop)"
    if [ -z "$name" ]; then
        get-emacs-server-name-title
    else
        echo "$name"
    fi
}

function i3-move()
{
    i3-msg focus "$1"
}

function emacs-move()
{
    # NOTE: simply (windmove-$1) would block for 2 seconds on error: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=64866
    RES="$(emacsclient -s "$2" -e "(condition-case nil (progn (windmove-$1) t) (error nil))")"
    if [ "$RES" != "t" ]; then
        return 1
    fi
}

function perform-move()
{
    local server_name=$(get-emacs-server-name)
    if [ -n "$server_name" ]; then
        emacs-move "$1" "$server_name" || i3-move "$1"
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
