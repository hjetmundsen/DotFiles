#!/usr/bin/env bash
# Workspaces bound in ~/.aerospace.toml: 1-9, A-G, I, M-Z (skip H, J, K, L
# which are focus-direction keys).
#
# We create one item per workspace (no script, no event subscription) plus a
# single hidden "controller" item that subscribes to aerospace_workspace_change
# and refreshes ALL workspace items in a single batched sketchybar call.
# This eliminates the per-item fan-out that previously spawned 34 parallel
# bash processes on every workspace switch.

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
      click_script="aerospace workspace $ws"
done

# Hidden controller: invisible item whose sole job is to receive the
# aerospace_workspace_change event and run the batched refresh script once.
sketchybar --add item aerospace_controller left \
  --set aerospace_controller \
    drawing=off \
    updates=on \
    script="$PLUGIN_DIR/aerospace.sh" \
  --subscribe aerospace_controller aerospace_workspace_change

# Prime the initial state so workspaces render correctly at startup
# (without waiting for the first workspace change).
"$PLUGIN_DIR/aerospace.sh" >/dev/null 2>&1 &
