#!/usr/bin/env bash
initDir="$HOME/.cry/init"

for unit in $initDir/*
do
	echo Executing $unit...
	$unit
	echo
done
