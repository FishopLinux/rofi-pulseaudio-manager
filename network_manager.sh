#!/bin/bash

# Function to list available Wi-Fi networks
list_networks() {
    nmcli device wifi list | awk 'NR>1 {print $2}' # List Wi-Fi SSID names
}

# Function to connect to a Wi-Fi network
connect_wifi() {
    network_name="$1"
    password="$2"
    nmcli device wifi connect "$network_name" password "$password"
}

# Function to disconnect from the current Wi-Fi network
disconnect_wifi() {
    nmcli device disconnect wlan0
}

# Function to show the current network status
show_status() {
    nmcli device status
}

# Function to enable/disable network interface
toggle_network() {
    iface="$1"
    status="$2"
    if [ "$status" == "enable" ]; then
        nmcli device set "$iface" managed yes
        nmcli device connect "$iface"
    elif [ "$status" == "disable" ]; then
        nmcli device disconnect "$iface"
        nmcli device set "$iface" managed no
    fi
}

# Main menu using rofi
choice=$(echo -e "List Wi-Fi Networks\nConnect to Wi-Fi\nDisconnect Wi-Fi\nShow Network Status\nEnable/Disable Network Interface" | rofi -dmenu -p "Network Manager")

case "$choice" in
    "List Wi-Fi Networks")
        networks=$(list_networks)
        selected_network=$(echo "$networks" | rofi -dmenu -p "Select Network")
        if [ -n "$selected_network" ]; then
            echo "$selected_network"
        fi
        ;;
    "Connect to Wi-Fi")
        network_name=$(echo | rofi -dmenu -p "Enter Wi-Fi Network Name")
        password=$(echo | rofi -dmenu -p "Enter Wi-Fi Password" -password)
        if [ -n "$network_name" ] && [ -n "$password" ]; then
            connect_wifi "$network_name" "$password"
            notify-send "Network Manager" "Connected to $network_name"
        fi
        ;;
    "Disconnect Wi-Fi")
        disconnect_wifi
        notify-send "Network Manager" "Disconnected from Wi-Fi"
        ;;
    "Show Network Status")
        network_status=$(show_status)
        echo "$network_status" | rofi -dmenu -p "Network Status"
        ;;
    "Enable/Disable Network Interface")
        iface=$(nmcli device status | grep -i wifi | awk '{print $1}' | rofi -dmenu -p "Select Network Interface")
        if [ -n "$iface" ]; then
            status=$(echo -e "enable\ndisable" | rofi -dmenu -p "Select Action (enable/disable)")
            if [ -n "$status" ]; then
                toggle_network "$iface" "$status"
                notify-send "Network Manager" "$iface $status"
            fi
        fi
        ;;
    *)
        exit 0
        ;;
esac
