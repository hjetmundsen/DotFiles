#!/usr/bin/env bash
# Single-shot, batched workspace refresh.
#
# This script is invoked ONCE per workspace-change event (not per item).
# It queries aerospace exactly once, then emits a single `sketchybar` call
# containing one `--set` per workspace. That replaces the previous fan-out
# model where 34 parallel bash processes each shelled out to aerospace and
# made an independent IPC call to sketchybar — the dominant source of lag
# when switching workspaces quickly.
#
# Bound to a hidden controller item (see items/aerospace.sh) that subscribes
# to `aerospace_workspace_change`.

set -uo pipefail

source "$CONFIG_DIR/colors.sh"

# Must match the list in items/aerospace.sh
WORKSPACES=(1 2 3 4 5 6 7 8 9 A B C D E F G I M N O P Q R S T U V W X Y Z)

# Focused workspace: prefer the value passed via `--trigger ... FOCUSED_WORKSPACE=X`
# (set by aerospace's exec-on-workspace-change hook). Fall back to a query if
# this script was invoked from a different sender.
if [ -n "${FOCUSED_WORKSPACE:-}" ]; then
  focused="$FOCUSED_WORKSPACE"
else
  focused="$(aerospace list-workspaces --focused 2>/dev/null)"
fi

# Non-empty workspaces across all monitors. One shell-out, reused for all items.
non_empty="$(aerospace list-workspaces --monitor all --empty no 2>/dev/null)"

# Build a lookup set for O(1) membership tests.
declare -A HAS_WIN=()
while IFS= read -r ws; do
  [ -n "$ws" ] && HAS_WIN["$ws"]=1
done <<< "$non_empty"

# Accumulate one big argv for sketchybar so the bar receives a single
# message and re-renders once instead of 34 times.
args=()
for ws in "${WORKSPACES[@]}"; do
  name="space.$ws"

  # Drawing rule: visible if focused or non-empty.
  if [ "$ws" = "$focused" ] || [ -n "${HAS_WIN[$ws]:-}" ]; then
    drawing=on
  else
    drawing=off
  fi

  if [ "$ws" = "$focused" ]; then
    args+=(--set "$name"
      drawing=$drawing
      label.color=$PINK
      background.color=$BG_HL
      background.border_color=$PINK
      background.border_width=2)
  else
    args+=(--set "$name"
      drawing=$drawing
      label.color=$FG_DIM
      background.color=$BG_TRANSPARENT
      background.border_width=0)
  fi
done

sketchybar "${args[@]}"
