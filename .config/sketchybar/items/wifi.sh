#!/usr/bin/env bash

sketchybar --add item wifi right \
  --set wifi \
    update_freq=60 \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    icon="$ICON_WIFI" \
    label="..." \
    script="$PLUGIN_DIR/wifi.sh" \
  --subscribe wifi wifi_change
