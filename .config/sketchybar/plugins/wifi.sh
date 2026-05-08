#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# macOS 14+ redacts the SSID for processes without Location Services permission.
# `ipconfig getsummary en0` and `networksetup -getairportnetwork` return the
# literal string "<redacted>" in that case. Use the IP address as the source of
# truth for connectivity, then fall back to whatever name we can read.
ssid="$(ipconfig getsummary en0 2>/dev/null | awk -F ': ' '/ SSID/ {print $2; exit}')"
if [ -z "$ssid" ]; then
  ssid="$(networksetup -getairportnetwork en0 2>/dev/null | awk -F': ' '{print $2}')"
fi

ip="$(ipconfig getifaddr en0 2>/dev/null)"

if [ -z "$ip" ]; then
  # No IP — truly offline
  sketchybar --set wifi \
    icon="$ICON_WIFI_OFF" \
    icon.color=$CORAL \
    label="offline"
elif [ -z "$ssid" ] \
  || [ "$ssid" = "<redacted>" ] \
  || [ "$ssid" = "You are not associated with an AirPort network." ]; then
  # Connected but SSID is unavailable (privacy redaction or unknown network)
  sketchybar --set wifi \
    icon="$ICON_WIFI" \
    icon.color=$CYAN \
    label="wifi"
else
  # Truncate to 18 chars
  short="${ssid:0:18}"
  sketchybar --set wifi \
    icon="$ICON_WIFI" \
    icon.color=$CYAN \
    label="$short"
fi
