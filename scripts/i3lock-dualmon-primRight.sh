#!/usr/bin/env bash

icon="$HOME/.xlock/icon.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#Center image on one monitor (for dual monitor setup)
#1920/2=810 (width). image=256x256, 256/2=128, 1080/2=540, 540-128=412 (height)
convert "$tmpbg" "$icon" -geometry +2730+1492 -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
