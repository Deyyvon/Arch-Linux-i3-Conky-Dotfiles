#!/bin/bash

# Displays the battery capacity along with an
# icon representing said capacity in the
# status bar.

STATUS=`cat /sys/class/power_supply/BAT0/status`
AVG=`cat /sys/class/power_supply/BAT0/capacity`

if [ "$STATUS" == "Discharging" ]; then
	if (($AVG >= 90)); then
		echo $AVG%
	elif (($AVG <= 90)) && (($AVG > 70)); then
		echo $AVG%
	elif (($AVG <= 70)) && (($AVG > 40)); then
		echo $AVG%
	elif (($AVG <= 40)) && (($AVG > 5)); then
		echo $AVG%
	elif (($AVG <= 5)); then
		i3-nagbar -t warning -m 'The battery is low. Hibernate system?' -b 'Yes' 'systemctl hibernate'
		echo $AVG%
	else
		echo  $AVG%
	fi
else
	echo $AVG%
fi
