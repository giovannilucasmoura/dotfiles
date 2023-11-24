#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
info=""

if [ "$player_status" = "Playing" ]; then
    info="▶ $(playerctl metadata artist) - $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    info="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

if [ ${#info} -gt 50 ]; then
    info="${info:0:50}..."
fi

echo "$info"
