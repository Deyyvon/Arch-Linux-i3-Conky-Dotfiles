#!/bin/bash

SOUND=`amixer get Master -M | grep -oE off -m 1`
PERC=`amixer get Master -M | grep -oE "[[:digit:]]*%" -m 1`
INT=`echo $PERC | sed 's/%//'`

if [ "$SOUND" != "off" ]; then
	if (($INT > 50)); then
		echo "🔊"
	elif (($INT <= 50)) && (($INT > 10)); then
		echo "🔉"
	else
		echo "🔈"
	fi
else
	echo "🔇"
fi
