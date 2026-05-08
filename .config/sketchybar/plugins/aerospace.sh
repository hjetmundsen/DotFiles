#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"

# $NAME is "space.<workspace>" e.g. "space.1", "space.A"
WORKSPACE="${NAME#space.}"

# Cache the focused-workspace and non-empty-workspace lists for the duration
# of an event burst. Per-item invocations (sketchybar fans out one process
# per item x event) reuse the cache instead of re-shelling out to aerospace.
# Cache TTL is short (1 second) so it self-invalidates between distinct events.
CACHE_DIR="${TMPDIR:-/tmp}/sketchybar-aerospace"
mkdir -p "$CACHE_DIR" 2>/dev/null

cache_get() {
  local key="$1"
  local cmd="$2"
  local file="$CACHE_DIR/$key"
  if [ -f "$file" ] && [ "$(($(date +%s) - $(stat -f %m "$file" 2>/dev/null || echo 0)))" -lt 1 ]; then
    cat "$file"
  else
    local val
    val="$(eval "$cmd" 2>/dev/null)"
    printf '%s' "$val" > "$file"
    printf '%s' "$val"
  fi
}

# Determine focused workspace.
# On `aerospace_workspace_change` the trigger sets $FOCUSED_WORKSPACE — fast path.
# On other senders ($space_windows_change, etc.) we always re-query aerospace
# directly (no cache) so a stale cached value can't strand the highlight.
if [ -n "${FOCUSED_WORKSPACE:-}" ]; then
  focused="$FOCUSED_WORKSPACE"
else
  focused="$(aerospace list-workspaces --focused 2>/dev/null)"
fi

# Workspaces that have at least one window on ANY monitor. Using
# `--monitor all` (not `--all`, which conflicts with `--empty no`) so
# multi-monitor setups don't lose visibility of workspaces on the other display.
# This list is cached briefly to dedupe the per-item fan-out.
non_empty="$(cache_get non_empty 'aerospace list-workspaces --monitor all --empty no')"

has_windows=false
if [ -n "$non_empty" ]; then
  while IFS= read -r ws; do
    [ "$ws" = "$WORKSPACE" ] && has_windows=true
  done <<< "$non_empty"
fi

# Drawing rule: visible if focused or non-empty.
if [ "$WORKSPACE" = "$focused" ] || [ "$has_windows" = true ]; then
  drawing=on
else
  drawing=off
fi

# Style based on focus.
if [ "$WORKSPACE" = "$focused" ]; then
  sketchybar --set "$NAME" \
    drawing=$drawing \
    label.color=$PINK \
    background.color=$BG_HL \
    background.border_color=$PINK \
    background.border_width=2
else
  sketchybar --set "$NAME" \
    drawing=$drawing \
    label.color=$FG_DIM \
    background.color=$BG_TRANSPARENT \
    background.border_width=0
fi
