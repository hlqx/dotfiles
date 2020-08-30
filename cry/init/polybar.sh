#!/usr/bin/env bash
# kill or launch bar depending on its current state

# it works in current state and i don't want to mess with it
# shellcheck disable=SC2015

barName=$(jq -r '.polybar[].bar[].name' ~/.cry/conf.json)
barEnabled=$(jq -r '.polybar[].enabled' ~/.cry/conf.json)
#pgrep polybar && pkill polybar || polybar "$barName"
if [ "$barEnabled" = 1 ]; then
	pgrep polybar && pkill -3 polybar
	polybar "$barName" &
fi
