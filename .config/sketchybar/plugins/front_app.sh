#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icon_map.sh"

# $INFO is set by sketchybar to the new front app name on front_app_switched
APP_NAME="${INFO:-}"
if [ -z "$APP_NAME" ]; then
  APP_NAME="$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)"
fi

__icon_map "$APP_NAME"
GLYPH="${icon_result:-:default:}"

sketchybar --set front_app \
  icon="$GLYPH" \
  icon.color=$PINK \
  label="$APP_NAME"
