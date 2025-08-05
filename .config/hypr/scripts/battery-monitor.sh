#!/bin/bash

already_warned_20=false
already_warned_10=false
already_warned_5=false

while true; do
    percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage" | awk '{print $2}' | sed 's/%//')
    charging=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | awk '{print $2}')

    if [[ "$charging" == "discharging" ]]; then
        if (( percentage <= 20 && percentage > 10 )) && [[ "$already_warned_20" == false ]]; then
            notify-send "🔋 Battery Low (20%)" "Connect your charger soon ⚠️"
            already_warned_20=true
        elif (( percentage <= 10 && percentage > 5 )) && [[ "$already_warned_10" == false ]]; then
            notify-send "🔴 Battery Critical (10%)" "Battery is critically low ‼️"
            already_warned_10=true
        elif (( percentage <= 5 )) && [[ "$already_warned_5" == false ]]; then
            notify-send "🚨 Battery Danger (5%)" "Suspending soon to prevent shutdown 💀"
            already_warned_5=true
        fi
    else
        already_warned_20=false
        already_warned_10=false
        already_warned_5=false
    fi

    sleep 30
done
