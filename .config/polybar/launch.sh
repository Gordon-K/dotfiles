#!/bin/bash

dir="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch mybar
echo "---" | tee -a /tmp/polybar_top.log
polybar -q top -c "$dir/config.ini" 2>&1 | tee -a /tmp/polybar_top.log & disown

echo "Bars launched..." 

