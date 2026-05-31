#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"

sketchybar --set clock label="$(date '+%a %-d %b  %I:%M %p')"
