#!/usr/bin/env bash

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
  9[0-9]|100) ICON="" COLOR="0xff{{ .dracula.hex.green }}"
  ;;
  [6-8][0-9]) ICON="" COLOR="0xffffffff"
  ;;
  [3-5][0-9]) ICON="" COLOR="0xff{{ .dracula.hex.yellow }}"
  ;;
  [1-2][0-9]) ICON="" COLOR="0xff{{ .dracula.hex.orange }}"
  ;;
  *) ICON="" COLOR="0xff{{ .dracula.hex.red }}"
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="" COLOR="0xff{{ .dracula.hex.green }}"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR
