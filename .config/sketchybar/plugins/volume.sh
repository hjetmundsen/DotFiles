#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# $INFO is set by sketchybar to the new volume value (0-100) on volume_change.
vol="${INFO:-}"
if [ -z "$vol" ]; then
  vol="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)"
fi

muted="$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)"

# Guard: osascript can return "missing value" or empty during audio device switches.
[[ "$vol" =~ ^[0-9]+$ ]] || vol=0

if [ "$muted" = "true" ] || [ "$vol" = "0" ]; then
  icon="$ICON_VOL_MUTE"
  color=$CORAL
elif [ "$vol" -gt 50 ]; then
  icon="$ICON_VOL_3"
  color=$MINT
elif [ "$vol" -gt 25 ]; then
  icon="$ICON_VOL_2"
  color=$MINT
else
  icon="$ICON_VOL_1"
  color=$MINT
fi

sketchybar --set volume \
  icon="$icon" \
  icon.color=$color \
  label="${vol}%"
