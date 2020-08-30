#!/usr/bin/env bash

compositorCmd=$(jq -r '.services[].compositor[].command' ~/.cry/conf.json)
compositorEnabled=$(jq -r '.services[].compositor[].enabled' ~/.cry/conf.json)

if [ "$compositorEnabled" = "1" ]; then
	$($compositorCmd) &		
fi
