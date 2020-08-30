#!/usr/bin/env bash

function wallpaperDirectoryFindFail(){
	notify-send "wall.sh" "Failed to find the wallpaper directory. Please check conf.json!"
	exit
}

# set basic vars
cryDir="$HOME/.cry"
lockerDir="$cryDir/scripts/locker"
wallpaperDirectory="$HOME/.wallpapers"
screenResolution=$(xdpyinfo | grep dimensions | cut -d ' ' -f 7)

# cd to wallpaper dir
cd "$wallpaperDirectory" || wallpaperDirectoryFindFail

# use fzf to present wallpapers, and make on into a var
#wallpaperSelector=$(find *.{jpg,png,jpeg,gif,tiff,bmp} 2> /dev/null | cut -d '/' -f 2- | rofi -dmenu -theme ~/.cry/rofi/cry.rasi -i) || exit
wallpaperSelector=$(find ./*.{jpg,png,jpeg,gif,tiff,bmp} 2> /dev/null | rev | cut -d '/' -f 1 | rev | rofi -dmenu -theme "$cryDir/rofi/cry.rasi" -i) || exit

# set fzf selection to a var (wallpaper)
selectedWallpaper="$wallpaperDirectory/$wallpaperSelector"

echo Updating wallpaper location file...

configUpdate(){
#	sed -i "s|^xorg.wallpaper.location=.*|xorg.wallpaper.location=$selectedWallpaper|g" ~/.cry/conf
	jq --arg selectedWallpaper "$selectedWallpaper" '.xorg[].wallpaper[].location = $selectedWallpaper' ~/.cry/conf.json | sponge ~/.cry/conf.json
}

# update wallpaper in centerconf
configUpdate
echo Setting wallpaper...
feh --bg-fill "$selectedWallpaper"
notify-send "wall.sh" "Generating lockscreen wallpaper..." -t 1000
convert "$selectedWallpaper" -geometry "$screenResolution"^ -gravity center -crop "$screenResolution"+0+0 -filter Gaussian -blur 0x8 "$lockerDir"/final.png
notify-send "wall.sh" "Finished generating lockscreen wallpaper." -t 3000
echo Done.
exit
