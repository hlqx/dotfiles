#!/usr/bin/env sh

compositorServiceState=$(jq -r '.services[].compositor[].enabled' ~/.cry/conf.json)
compositorCommand=$(jq -r '.services[].compositor[].command' ~/.cry/conf.json)
arun=0
echo "Compositor service state: $compositorServiceState"
echo "Comositor command: $compositorCommand"

if [ "$compositorServiceState" = 1 ]; then
	if [ "$arun" = 0 ]; then
		echo "Setting it to 0, and killing the compositor..."
		pntk=$(echo $compositorCommand | cut -d ' ' -f 1)
		pkill -3 $(pkill $pntk)
		notify-send "compositing.sh" "Compositor stopped." -t 1000
		tco=0
		arun=1
	fi
fi

if [ "$compositorServiceState" = 0 ]; then
	if [ "$arun" = 0 ]; then
		echo "Setting it to 1, and starting the compositor..."
		notify-send "compositing.sh" "Compositor started." -t 1000
		$($compositorCommand) &
		tco=1
		arun=1
	fi
fi

if [ "$tco" = 1 ]; then
	jq '.services[].compositor[].enabled = "1"' ~/.cry/conf.json | sponge ~/.cry/conf.json
else
	jq '.services[].compositor[].enabled = "0"' ~/.cry/conf.json | sponge ~/.cry/conf.json
fi
