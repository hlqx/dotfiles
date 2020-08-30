#!/usr/bin/env bash

notify-send "reload.sh" "Reloading session..." -t 2000
i3-msg reload
exec ~/.cry/scripts/init.sh
