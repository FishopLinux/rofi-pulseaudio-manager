#!/bin/bash

# Function to get a list of sinks (output devices)
list_sinks() {
    pactl list short sinks | awk '{print $1 " " $2}'
}

# Function to switch the default sink
set_sink() {
    pactl set-default-sink "$1"
}

# Function to list sources (input devices)
list_sources() {
    pactl list short sources | awk '{print $1 " " $2}'
}

# Function to set the default source
set_source() {
    pactl set-default-source "$1"
}

# Function to control volume
change_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ "$1"
}

# Main menu
choice=$(echo -e "Switch Output Device\nSwitch Input Device\nAdjust Volume\nMute/Unmute" | rofi -dmenu -p "Audio Manager")

case "$choice" in
    "Switch Output Device")
        device=$(list_sinks | rofi -dmenu -p "Select Output Device" | awk '{print $1}')
        if [ -n "$device" ]; then
            set_sink "$device"
            notify-send "Audio Manager" "Output device switched to $(pactl list sinks | grep -A 1 "Name: $(pactl list short sinks | grep "^$device" | awk '{print $2}')" | grep Description | cut -d: -f2 | xargs)"
        fi
        ;;
    "Switch Input Device")
        device=$(list_sources | rofi -dmenu -p "Select Input Device" | awk '{print $1}')
        if [ -n "$device" ]; then
            set_source "$device"
            notify-send "Audio Manager" "Input device switched to $(pactl list sources | grep -A 1 "Name: $(pactl list short sources | grep "^$device" | awk '{print $2}')" | grep Description | cut -d: -f2 | xargs)"
        fi
        ;;
    "Adjust Volume")
        volume=$(echo -e "+5%\n-5%" | rofi -dmenu -p "Adjust Volume")
        if [ "$volume" == "+5%" ] || [ "$volume" == "-5%" ]; then
            change_volume "$volume"
            notify-send "Audio Manager" "Volume adjusted: $volume"
        fi
        ;;
    "Mute/Unmute")
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        notify-send "Audio Manager" "Mute status toggled"
        ;;
    *)
        exit 0
        ;;
esac
