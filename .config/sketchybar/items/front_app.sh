#!/usr/bin/env bash

sketchybar --add item front_app left \
  --set front_app \
    icon.font="sketchybar-app-font:Regular:16.0" \
    icon.color=$PINK \
    label.color=$FG \
    label.padding_left=4 \
    click_script="open -a 'Mission Control'" \
    script="$PLUGIN_DIR/front_app.sh" \
  --subscribe front_app front_app_switched
