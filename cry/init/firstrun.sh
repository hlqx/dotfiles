#!/usr/bin/env bash

ifr=$(jq -r '.cry[].firstrun' ~/.cry/conf.json)

if [ "$ifr" = 1 ]; then
	exec termite -e ~/.cry/scripts/firstrun.sh &
fi
