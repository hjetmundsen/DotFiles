#!/usr/bin/env bash

sketchybar --add item clock right \
  --set clock \
    update_freq=10 \
    icon="$ICON_CLOCK" \
    icon.color=$CYAN \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    label="--:--" \
    script="$PLUGIN_DIR/clock.sh"
