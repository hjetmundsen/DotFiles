#!/usr/bin/env bash

COLOR="$RED"

sketchybar --add event aerospace_workspace_change

for i in {0..5}; do
	sid=$((i + 1))

  padding_left=10
  if ((i == 0));then
    padding_left=11
  fi

  padding_right=10
  if ((i == 5));then
    padding_right=14
  fi

  sketchybar --add item  space.$sid left \
             --subscribe space.$sid aerospace_workspace_change \
             --set       space.$sid label.drawing=off \
                                    icon.padding_left=$padding_left \
                                    icon.padding_right=$padding_right \
                                    background.padding_left=-5 \
                                    background.padding_right=-5 \
                                    click_script="aerospace workspace $sid" \
                                    script="$CONFIG_DIR/plugins/space.sh $sid"
done

sketchybar --add item spacer.1 left \
	         --set      spacer.1 background.drawing=off \
                               label.drawing=off \
	                             icon.drawing=off \
	                             width=5

sketchybar --add bracket spaces '/space\..*/' \
	         --set         spaces background.height=26 \
                                background.border_width="$BORDER_WIDTH" \
                                background.border_color="$COLOR" \
                                background.corner_radius="$CORNER_RADIUS" \
                                background.color="$BAR_COLOR" \

sketchybar --add item spacer.2 left \
	         --set      spacer.2 background.drawing=off \
                               label.drawing=off \
	                             icon.drawing=off \
	                             width=5

# sketchybar --add item separator left \
# 	         --set      separator icon= \
#                                 icon.font="$FONT:Regular:16.0" \
#                                 background.padding_left=8 \
#                                 background.padding_right=15 \
#                                 label.drawing=off \
#                                 associated_display=active \
#                                 icon.color="$YELLOW"
