#!/usr/bin/env bash



# shellcheck disable=SC2059
# shellcheck disable=SC2128
# reason for this ^: 'It just werks'

textCharLimit="40"
textCutoff=$(echo "$textCharLimit"-3 | bc)

playerctl metadata &> /dev/null || exit

playerState=$(playerctl status)

mprisInfo=($"$(playerctl metadata xesam:title) - $(playerctl metadata xesam:artist)")


if [ "$playerState" = "Playing" ]; then
       icon=" "	
else
	icon=" "
fi

if [ "$(printf "$mprisInfo" | wc -m)" -le "$textCharLimit" ]; then  
	echo "$icon""$mprisInfo"
else
	mprisInfoCut=$(printf "$mprisInfo" | cut -c 1-"$textCutoff" | xargs -0 && printf "...")
	echo "$icon" "$mprisInfoCut"
fi
