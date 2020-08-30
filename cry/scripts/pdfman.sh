#!/usr/bin/env bash

pdfGenFail(){
	notify-send "pdfman.sh" "Failed to generate PDF for $selectedManual. Double check that you entered the right manual page name." -t 3000
}

randomNumber=$(( ( RANDOM % 999999999 ) ))
selectedManual=$(man -k . | cut -d ' ' -f 1 | rofi -theme ~/.cry/rofi/cry.rasi -dmenu) || exit
notify-send "pdfman.sh" "Attempting to generating PDF for $selectedManual..." -t 1000
man -Tpdf "$selectedManual" > /tmp/pdfman_$randomNumber.pdf || pdfGenFail
zathura /tmp/pdfman_$randomNumber.pdf
rm /tmp/pdfman_$randomNumber.pdf
