#!/bin/bash

for pid in $(pgrep -f '/sketchybar/plugins/media.sh'); do 
  if [[ "$pid" = "$$" ]]; then
    continue
  fi
  kill -9 "$pid"
done

STATE="$(echo "$INFO" | jq -r '.state')"

if [ "$STATE" = "playing" ]; then
  # MEDIA="$(echo "$INFO" | jq -r '.app + ": " + .title + " - " + .artist')"
  MEDIA_INFO="$(echo "$INFO" | jq -r '.title + " - " + .artist')"

  MEDIA_INFO_TRUNCATED="$MEDIA_INFO"
  if [[ "${#MEDIA_INFO}" -gt 40 ]]; then 
    MEDIA_INFO_TRUNCATED="${MEDIA_INFO:0:39}…"
  fi

  sketchybar --set "$NAME" icon="󰲑" label="${MEDIA_INFO_TRUNCATED}" drawing=on
  sleep 2
  
  RUNTIME=$(echo -e "${MEDIA_INFO}     ")
  for (( i = 0; i < ("${#RUNTIME}" + 1); i++ )); do
    MARQUEE="${RUNTIME:$i:${#RUNTIME}}${RUNTIME}"
    TMP_STR="…${MARQUEE:0:(${#MEDIA_INFO_TRUNCATED} - 2)}…"
    sketchybar --set "$NAME" icon="󰲑" label="${TMP_STR}" drawing=on
    sleep 0.15
  done
  sketchybar --set "$NAME" icon="󰲑" label="${MEDIA_INFO_TRUNCATED}" drawing=on

else
  sketchybar --set "$NAME" drawing=off
fi
