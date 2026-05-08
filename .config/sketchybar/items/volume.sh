#!/usr/bin/env bash

sketchybar --add item volume right \
  --set volume \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    icon="$ICON_VOL_2" \
    label="--%" \
    click_script="osascript -e 'set volume output muted not (output muted of (get volume settings))'" \
    script="$PLUGIN_DIR/volume.sh" \
  --subscribe volume volume_change
