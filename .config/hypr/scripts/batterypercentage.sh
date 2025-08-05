#!/bin/bash

# We get battery capacity & status
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

# Set icon based on status and capacity
case "$status" in
    "Charging")
        icon=""
        ;;
    "Full")
        icon=""
        ;;
    "Discharging")
        if [ "$capacity" -ge 90 ]; then
            icon=""
        elif [ "$capacity" -ge 70 ]; then
            icon=""
        elif [ "$capacity" -ge 50 ]; then
            icon=""
        elif [ "$capacity" -ge 30 ]; then
            icon=""
        else
            icon=""
        fi
        ;;
    *)
        icon=""  # If then, error
        ;;
esac

echo "$icon  $capacity%"
