#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch mybar
echo "---" | tee -a /tmp/polybar_top.log /tmp/polybar_top_i3_invis.log  
polybar top 2>&1 | tee -a /tmp/polybar_top.log & disown
polybar top_i3_invis 2>&1 | tee -a /tmp/polybar_top_i3_invis.log & disown

echo "Bars launched..." 

