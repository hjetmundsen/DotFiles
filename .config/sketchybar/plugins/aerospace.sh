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
# Padded with newlines so membership checks below can match a whole line
# without pulling in grep -x/-F portability quirks.
non_empty=$'\n'"$(aerospace list-workspaces --monitor all --empty no 2>/dev/null)"$'\n'

# NOTE: no associative array here (no `declare -A`). macOS ships bash 3.2
# as /bin/bash (last GPLv2 release; Apple never shipped 4.0+), and this
# machine has no newer bash on PATH either — `declare -A` silently fails
# there, and later indexing a letter workspace crashes with "unbound
# variable" under `set -u`, aborting the script before it ever reaches
# the final `sketchybar` call below. Plain substring matching keeps this
# working on whatever bash actually runs it.
has_window() {
  case "$non_empty" in
    *$'\n'"$1"$'\n'*) return 0 ;;
    *) return 1 ;;
  esac
}

# Accumulate one big argv for sketchybar so the bar receives a single
# message and re-renders once instead of 34 times.
args=()
for ws in "${WORKSPACES[@]}"; do
  name="space.$ws"

  # Drawing rule: visible if focused or non-empty.
  if [ "$ws" = "$focused" ] || has_window "$ws"; then
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
