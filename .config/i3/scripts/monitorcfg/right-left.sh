#!/usr/bin/env sh
# Configures i3 based on if an external monitor is plugged in.
# Laptop is on the right, external monitor is on the left.

LEFT_DISPLAY='VGA1'     # Left screen from xrandr
RIGHT_DISPLAY='HDMI1'   # Right screen from xrandr
INT_DISPLAY='LVDS1'     # Internal display from xrandr

# Check if external monitor is connected.
LEFT_STATUS=$(xrandr | awk -v x="$LEFT_DISPLAY" '$0 ~ x {print $2}' | tr -d '\n')
RIGHT_STATUS=$(xrandr | awk -v x="$RIGHT_DISPLAY" '$0 ~ x {print $2}' | tr -d '\n')

bar=top

function pbar() {
    # Clean any running polybars.
    killall -q polybar
    while pgrep -x polybar > /dev/null; do sleep 1; done

    # Put polybars on correct displays.
    for m in {$1,$2}; do
        MONITOR=$m polybar -q "$bar"&
    done
}

function mvi3ws() {
	i3-msg "[workspace=1] move workspace to output $1"
	i3-msg "[workspace=2] move workspace to output $2"
	i3-msg "[workspace=3] move workspace to output $1"
	i3-msg "[workspace=4] move workspace to output $2"
	i3-msg "[workspace=5] move workspace to output $1"
	i3-msg "[workspace=6] move workspace to output $2"
	i3-msg "[workspace=7] move workspace to output $1"
	i3-msg "[workspace=8] move workspace to output $2"
	i3-msg "[workspace=9] move workspace to output $1"
	i3-msg "[workspace=10] move workspace to output $2"
}

# If it is, configure i3 to use external display.
if [[ $LEFT_STATUS == 'connected' && $RIGHT_STATUS == 'connected' ]]; then
	xrandr --output $LEFT_DISPLAY --primary --auto --left-of $RIGHT_DISPLAY

    mvi3ws $LEFT_DISPLAY $RIGHT_DISPLAY

    # Put polybar on appropriate monitors
    pbar $LEFT_DISPLAY $RIGHT_DISPLAY

# If only left connected, use it and laptop.
elif [[ $LEFT_STATUS == 'connected' ]]; then
    xrandr --output $LEFT_DISPLAY --primary --auto --left-of $INT_DISPLAY --output $RIGHT_DISPLAY --off

    mvi3ws $LEFT_DISPLAY $INT_DISPLAY

    # Put polybar on appropriate monitors
    pbar $LEFT_DISPLAY $INT_DISPLAY

# If only right connected, use it and laptop.
elif [[ $RIGHT_STATUS == 'connected' ]]; then
    xrandr --output $RIGHT_DISPLAY --primary --auto --left-of $INT_DISPLAY --output $LEFT_DISPLAY --off

    mvi3ws $RIGHT_DISPLAY $INT_DISPLAY

    # Put polybar on appropriate monitors
    pbar $RIGHT_DISPLAY $INT_DISPLAY

# Otherwise, use internal display.
else
	xrandr --output $INT_DISPLAY --primary --auto --output $LEFT_DISPLAY --off --output $RIGHT_DISPLAY --off

    # Clean any running polybars.
    killall -q polybar
    while pgrep -x polybar > /dev/null; do sleep 1; done

    # Put polybar on appropriate monitors
    MONITOR=$INT_DISPLAY polybar -q "$bar" &
fi

# Set background
feh --bg-scale "$BGIMG"
