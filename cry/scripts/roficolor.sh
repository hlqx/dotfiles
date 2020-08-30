#!/usr/bin/env sh

# shellcheck disable=SC2059
# fuck off shellcheck suck my dick

colorChoices="Green\nBlue\nRed\nYellow\nPink\nPurple\nWhite"
colorChosen=$(printf "$colorChoices" | rofi -theme "$HOME/.cry/rofi/cry.rasi" -dmenu -i || exit ) || exit

case "$colorChosen" in
	Green) selectedColor=80C990 ;;
	Blue) selectedColor=A3B8EF ;;
	Red) selectedColor=EFA6A2 ;;
	Yellow) selectedColor=A69460 ;;
	Pink) selectedColor=F2A1C2 ;;
	Purple) selectedColor=E6A3DC ;;
	White) selectedColor=c0c0c0
esac

if [ -n "$selectedColor" ]
then
	cd ~/.cry/rofi || exit
	sed s/HIGHLIGHTCOLORCODE/$selectedColor/g "$HOME"/.cry/rofi/cry_template.rasi > "$HOME"/.cry/rofi/cry.rasi
	jq --arg selectedColor "$selectedColor" '.services[].rofi[].highlightcolor = $selectedColor' ~/.cry/conf.json | sponge ~/.cry/conf.json
else
	exit
fi
