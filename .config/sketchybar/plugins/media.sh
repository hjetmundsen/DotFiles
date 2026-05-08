#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

INFO="${INFO:-}"

if [ -z "$INFO" ]; then
  sketchybar --set media drawing=off
  exit 0
fi

# Parse JSON without jq dependency
parsed="$(python3 -c '
import json, sys, os
try:
    data = json.loads(os.environ.get("INFO", ""))
    print((data.get("title", "") or "").strip())
    print((data.get("artist", "") or "").strip())
    print((data.get("state", "") or "").strip())
except Exception:
    pass
' 2>/dev/null)"

title="$(echo "$parsed" | sed -n 1p)"
artist="$(echo "$parsed" | sed -n 2p)"
state="$(echo "$parsed" | sed -n 3p)"

if [ "$state" != "playing" ] || [ -z "$title" ]; then
  sketchybar --set media drawing=off
  exit 0
fi

# Compose label, truncate to 30 chars
if [ -n "$artist" ]; then
  label="$title — $artist"
else
  label="$title"
fi
short="${label:0:30}"

sketchybar --set media \
  drawing=on \
  icon="$ICON_MUSIC" \
  icon.color=$PINK \
  label="$short"
