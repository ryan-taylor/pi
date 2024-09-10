#!/bin/bash

# Function to find the backlight device
find_backlight() {
    for dir in /sys/class/backlight/*; do
        if [ -d "$dir" ]; then
            echo "$dir"
            return
        fi
    done
    echo ""
}

# Find the backlight device
BACKLIGHT_DEV=$(find_backlight)

if [ -z "$BACKLIGHT_DEV" ]; then
    echo "Error: No backlight device found"
    exit 1
fi

# Function to turn display off
display_off() {
    echo 0 > "$BACKLIGHT_DEV/brightness"
    echo "Display turned off"
}

# Function to turn display on
display_on() {
    max_brightness=$(cat "$BACKLIGHT_DEV/max_brightness")
    echo "$max_brightness" > "$BACKLIGHT_DEV/brightness"
    echo "Display turned on"
}

# Check the command-line argument
if [ "$1" = "off" ]; then
    display_off
elif [ "$1" = "on" ]; then
    display_on
elif [ "$1" = "boot" ]; then
    display_on
else
    echo "Usage: $0 [on|off|boot]"
    exit 1
fi
