#!/usr/bin/env bash

sketchybar --add item cpu right \
  --set cpu \
    update_freq=5 \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    icon="$ICON_CPU" \
    icon.color=$CYAN \
    label="--%" \
    click_script="open -a 'Activity Monitor'" \
    script="$PLUGIN_DIR/cpu.sh"
