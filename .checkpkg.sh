#!/bin/bash
cmd=`pacman -Qu | wc -l`

if [ $cmd = 0 ]; then
  echo "no updates"
elif [ $cmd = 1 ]; then
  echo "1 update"
elif [ $cmd > 1 ]; then
  echo "$cmd updates"
fi
