#!/bin/bash

# Get initial status
last_status=$(upower -i /org/freedesktop/UPower/devices/line_power_AC | grep 'online' | awk '{print $2}')

while true; do
    current_status=$(upower -i /org/freedesktop/UPower/devices/line_power_AC | grep 'online' | awk '{print $2}')
    
    if [[ "$current_status" != "$last_status" ]]; then
        if [[ "$current_status" == "yes" ]]; then
            notify-send "🔌 Charger Connected" "Your laptop is now charging ⚡"
        else
            notify-send "🔋 Charger Disconnected" "Your laptop is running on battery 🔻"
        fi
        last_status="$current_status"
    fi

    sleep 5
done
