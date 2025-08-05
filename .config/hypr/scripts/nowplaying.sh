#!/bin/bash

info=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

if [[ -n "$info" ]]; then
    echo "  $info"
else
    echo ""
fi
