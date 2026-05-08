#!/usr/bin/env bash

# Workspaces bound in ~/.aerospace.toml: 1-9, A-G, I, M-Z (skip H, J, K, L
# which are focus-direction keys).
WORKSPACES=(1 2 3 4 5 6 7 8 9 A B C D E F G I M N O P Q R S T U V W X Y Z)

for ws in "${WORKSPACES[@]}"; do
  sketchybar --add item space.$ws left \
    --set space.$ws \
      label="$ws" \
      label.font="JetBrains Mono:Bold:13.0" \
      label.color=$FG_DIM \
      icon.drawing=off \
      background.corner_radius=6 \
      background.height=24 \
      background.color=$BG_TRANSPARENT \
      padding_left=2 \
      padding_right=2 \
      label.padding_left=8 \
      label.padding_right=8 \
      click_script="aerospace workspace $ws" \
      script="$PLUGIN_DIR/aerospace.sh" \
    --subscribe space.$ws aerospace_workspace_change space_windows_change
done
