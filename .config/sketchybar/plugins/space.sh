#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh" # Loads all defined colors

SPACE_ICONS=("󰖟" "" "" "" "" "")

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 \
             --set "$NAME" icon.color="$RED" \
                           icon.font.size=25.0 \
                           icon="${SPACE_ICONS[$1 - 1]}"
else
	sketchybar --animate tanh 5 \
             --set "$NAME" icon.color="$COMMENT" \
                           icon.font.size=25.0 \
                           icon="${SPACE_ICONS[$1 - 1]}"
fi

