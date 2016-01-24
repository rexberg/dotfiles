#!/bin/bash
cmd=$(pacman -Qu | wc -l)

if [ "$cmd" -eq 0 ]; then
  echo "no updates"
elif [ "$cmd" -eq 1 ]; then
  echo "1 update"
elif [ "$cmd" -gt 1 ]; then
  echo "$cmd updates"
fi
