#!/usr/bin/env bash

# echo "polybars launched..."

# Make sure we have xrandr.
if ! command -v xrandr >/dev/null 2>&1; then
  exit
fi

# Terminate already running bar instances.
killall -q polybar

# Wait until the processes have been shut down.
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example bar(s).
for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload top &
done

# # Launch bar(s)
# # polybar dummy -q &
# # polybar top -q &
# # polybar bottom -q  &
