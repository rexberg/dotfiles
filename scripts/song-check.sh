#!/bin/bash

ncmpcppcheck=`ncmpcpp --now-playing "%a - %t"`
error="Couldn't connect to MPD (host = localhost, port = 6600): Connection refused"

if [ ! "$ncmpcppcheck" ]; then
	echo "No song currently playing."
elif [ "$ncmpcppcheck" = "$error" ]; then
	echo "No song currently playing."
else
	echo $ncmpcppcheck
fi
