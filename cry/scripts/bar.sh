#!/usr/bin/env sh
# kill or launch bar depending on its current state

# it works in current state and i don't want to mess with it
# shellcheck disable=SC2015

barName=$(jq -r '.polybar[].bar[].name' ~/.cry/conf.json)
barEnabled=$(jq -r '.polybar[].enabled' ~/.cry/conf.json)
echo "Bar name: $barName"
echo "Bar enabled: $barEnabled"
#pgrep polybar && pkill polybar || polybar "$barName"
if [ "$barEnabled" = 0 ]; then
	polybar "$barName" &
	jq '.polybar[].enabled = "1"' ~/.cry/conf.json | sponge ~/.cry/conf.json
else
	pkill -3 polybar
	jq '.polybar[].enabled = "0"' ~/.cry/conf.json | sponge ~/.cry/conf.json
fi
