#!/bin/sh
# Prevent laptop display from resetting when sway is reloaded.
# Usage: clamshell.sh <laptop_display>

if [ -z "$1" ]; then
	echo "clamshell.sh: argument required: laptop display" >&2
	exit 1
fi

if cat /proc/acpi/button/lid/LID/state | grep -q open; then
	swaymsg output "$1" enable
else
	swaymsg output "$1" disable
fi
