#!/usr/bin/env bash
set -uo pipefail

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# `top -l 1 -n 0` produces a "CPU usage" line like:
#   CPU usage: 5.21% user, 3.10% sys, 91.68% idle
cpu_line="$(top -l 1 -n 0 -s 0 2>/dev/null | grep 'CPU usage')"
user_pct="$(echo "$cpu_line" | awk '{print $3}' | tr -d '%')"
sys_pct="$(echo "$cpu_line" | awk '{print $5}' | tr -d '%')"

if [ -z "$user_pct" ] || [ -z "$sys_pct" ]; then
  sketchybar --set cpu icon.color=$CYAN label="--%"
  exit 0
fi

# Round (busy = user + sys)
total="$(awk -v u="$user_pct" -v s="$sys_pct" 'BEGIN { printf "%d", u + s + 0.5 }')"

if [ "$total" -ge 85 ]; then
  color=$CORAL
elif [ "$total" -ge 60 ]; then
  color=$YELLOW
else
  color=$CYAN
fi

sketchybar --set cpu \
  icon.color=$color \
  label="${total}%"
