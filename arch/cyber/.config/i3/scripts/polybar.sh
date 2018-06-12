#!/usr/bin/env sh

bar=top

# Terminate already-running bar instances
killall -q polybar

# Wait until processes have completed shutting down
while pgrep -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar "$bar" &
  done
else
  # Launch polybar
  polybar "$bar" &
fi
