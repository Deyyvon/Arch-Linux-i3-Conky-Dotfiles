#!/bin/bash

SOUND=`amixer get Master -M | grep -oE off -m 1`
PERC=`amixer get Master -M | grep -oE "[[:digit:]]*%" -m 1`
INT=`echo $PERC | sed 's/%//'`

if [ "$SOUND" != "off" ]; then
	if (($INT > 50)); then
		echo $PERC ""
	elif (($INT <= 50)) && (($INT > 10)); then
		echo $PERC ""
	else
		echo $PERC ""
	fi
else
	echo ""
fi
