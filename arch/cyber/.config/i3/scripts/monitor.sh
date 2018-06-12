#!/usr/bin/env sh
# Configures i3 based on if an external monitor is plugged in.

EXT_DISPLAY='HDMI1'	# External display from xrandr
INT_DISPLAY='EDP1'	# Internal display from xrandr

# Check if external monitor is connected.
HDMI_STATUS=$(xrandr |  awk -v x="$EXT_DISPLAY" '$0 ~ x {print $2}' | tr -d '\n')

# If it is, configure i3 to use external display.
if [[ $HDMI_STATUS == 'connected' ]]; then
	xrandr --output HDMI1 --primary --auto --left-of eDP1
	i3-msg -q "[workspace=1] move workspace to output $EXT_DISPLAY"
	i3-msg -q "[workspace=2] move workspace to output $INT_DISPLAY"
	i3-msg -q "[workspace=3] move workspace to output $EXT_DISPLAY"
	i3-msg -q "[workspace=4] move workspace to output $INT_DISPLAY"
	i3-msg -q "[workspace=5] move workspace to output $EXT_DISPLAY"
	i3-msg -q "[workspace=6] move workspace to output $INT_DISPLAY"
	i3-msg -q "[workspace=7] move workspace to output $EXT_DISPLAY"
	i3-msg -q "[workspace=8] move workspace to output $INT_DISPLAY"
	i3-msg -q "[workspace=9] move workspace to output $EXT_DISPLAY"
	i3-msg -q "[workspace=10] move workspace to output $INT_DISPLAY"
# Otherwise, use internal display.
else
	xrandr --output eDP1 --primary --auto --output HDMI1 --off
fi
