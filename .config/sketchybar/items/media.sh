#!/usr/bin/env bash

sketchybar --add item media right \
  --set media \
    drawing=off \
    icon.font="JetBrainsMono Nerd Font:Bold:14.0" \
    icon="$ICON_MUSIC" \
    icon.color=$PINK \
    label.max_chars=30 \
    click_script="osascript -e 'tell application \"Music\" to playpause' 2>/dev/null || osascript -e 'tell application \"Spotify\" to playpause' 2>/dev/null" \
    script="$PLUGIN_DIR/media.sh" \
  --subscribe media media_change
