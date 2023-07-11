#!/bin/sh

VOLUME=$(pamixer --get-volume-human)

case $1 in
    "--up")
        pamixer --increase 2
        ;;
    "--down")
        pamixer --decrease 2 
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        echo "%{F#7AA6DA}VOL%{F-} ${VOLUME}"
esac
