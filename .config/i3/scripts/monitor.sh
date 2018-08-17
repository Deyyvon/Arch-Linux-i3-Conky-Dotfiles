#!/usr/bin/env sh
# Configures i3 based on if an external monitor is plugged in.

LEFT_DISPLAY='HDMI2'	# Left screen from xrandr
RIGHT_DISPLAY='VGA1'	# Right screen from xrandr
INT_DISPLAY='LVDS1'     # Internal display from xrandr

# Check if external monitor is connected.
LEFT_STATUS=$(xrandr | awk -v x="$LEFT_DISPLAY" '$0 ~ x {print $2}' | tr -d '\n')
RIGHT_STATUS=$(xrandr | awk -v x="$RIGHT_DISPLAY" '$0 ~ x {print $2}' | tr -d '\n')

# If it is, configure i3 to use external display.
if [[ $LEFT_STATUS == 'connected' && $RIGHT_STATUS == 'connected' ]]; then
	xrandr --output $LEFT_DISPLAY --primary --auto --left-of $RIGHT_DISPLAY
	#i3-msg "[workspace=1] move workspace to output $LEFT_DISPLAY"
	#i3-msg "[workspace=2] move workspace to output $RIGHT_DISPLAY"
	#i3-msg "[workspace=3] move workspace to output $LEFT_DISPLAY"
	#i3-msg "[workspace=4] move workspace to output $RIGHT_DISPLAY"
	#i3-msg "[workspace=5] move workspace to output $LEFT_DISPLAY"
	#i3-msg "[workspace=6] move workspace to output $RIGHT_DISPLAY"
	#i3-msg "[workspace=7] move workspace to output $LEFT_DISPLAY"
	#i3-msg "[workspace=8] move workspace to output $RIGHT_DISPLAY"
	#i3-msg "[workspace=9] move workspace to output $LEFT_DISPLAY"
	#i3-msg "[workspace=10] move workspace to output $RIGHT_DISPLAY"
# Otherwise, use internal display.
else
	xrandr --output $INT_DISPLAY --primary --auto --output $LEFT_DISPLAY --off --output $RIGHT_DISPLAY --off
fi
