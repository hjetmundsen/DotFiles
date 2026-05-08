#!/usr/bin/env bash

sketchybar --add item battery right \
  --set battery \
    update_freq=120 \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    icon="$ICON_BAT_0" \
    label="--%" \
    script="$PLUGIN_DIR/battery.sh" \
  --subscribe battery power_source_change system_woke
