#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

batt_info="$(pmset -g batt 2>/dev/null)"
percent="$(echo "$batt_info" | grep -Eo '[0-9]+%' | head -1 | tr -d '%')"
charging="$(echo "$batt_info" | head -1 | grep -c "'AC Power'")"

# Defensive default
if [ -z "$percent" ]; then
  sketchybar --set battery icon="$ICON_BAT_0" icon.color=$CORAL label="--%"
  exit 0
fi

# Pick icon
if [ "$charging" -gt 0 ]; then
  icon="$ICON_BAT_BOLT"
elif [ "$percent" -gt 75 ]; then
  icon="$ICON_BAT_100"
elif [ "$percent" -gt 50 ]; then
  icon="$ICON_BAT_75"
elif [ "$percent" -gt 25 ]; then
  icon="$ICON_BAT_50"
elif [ "$percent" -gt 10 ]; then
  icon="$ICON_BAT_25"
else
  icon="$ICON_BAT_0"
fi

# Pick color
if [ "$charging" -gt 0 ] || [ "$percent" -gt 30 ]; then
  color=$MINT
elif [ "$percent" -gt 15 ]; then
  color=$YELLOW
else
  color=$CORAL
fi

sketchybar --set battery \
  icon="$icon" \
  icon.color=$color \
  label="${percent}%"
