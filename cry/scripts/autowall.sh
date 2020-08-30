#!/usr/bin/env sh

wallpaperLocation=$(jq -r '.xorg[].wallpaper[].location' ~/.cry/conf.json)

# set the wallpaper
feh --bg-fill "$wallpaperLocation"
