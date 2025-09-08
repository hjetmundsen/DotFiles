#!/usr/bin/env bash

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ "$PERCENTAGE" = "" ]; then
	exit 0
fi

ICON_FONT_SIZE=30
case ${PERCENTAGE} in
9[0-9] | 100)
	ICON=""
	;;
[6-8][0-9])
	ICON=""
	;;
[3-5][0-9])
	ICON=""
	;;
[1-2][0-9])
	ICON=""
	;;
*) ICON="" ;;
esac

if [ "$CHARGING" != "" ]; then
	ICON=""
  ICON_FONT_SIZE=18
fi

sketchybar --set "$NAME" icon="$ICON" icon.font.size="$ICON_FONT_SIZE" label="${PERCENTAGE}% "
