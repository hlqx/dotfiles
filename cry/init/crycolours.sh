#!/usr/bin/env bash

sed "s/HIGHLIGHTCOLORCODE/$(jq -r '.services[].rofi[].highlightcolor' ~/.cry/conf.json)/g" ~/.cry/rofi/cry_template.rasi > ~/.cry/rofi/cry.rasi
