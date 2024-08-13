#!/usr/bin/env bash

if [[ -z $INFO ]]; then
    exit
fi
sketchybar --set "$NAME" label=S$(echo $INFO | jq -r '."display-1"') label.drawing=on 