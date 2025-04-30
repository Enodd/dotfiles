#!/usr/bin/env bash

# monitor.sh - Automatic display management script for Hyprland
# Detects external display connections and adjusts laptop screen accordingly


# Function to check if external monitor is connected
check_external_monitor() {
    if hyprctl monitors | grep -q "Monitor DP-1"; then
        return 0  # External monitor is connected
    else
        return 1  # External monitor is not connected
    fi
}

# Function to disable laptop display
disable_laptop_display() {
    log "External display detected. Disabling laptop display..."
    hyprctl keyword monitor eDP-1,disable
    if [ $? -eq 0 ]; then
        log "Laptop display disabled successfully."
    else
        log "Failed to disable laptop display."
    fi
}

# Function to enable laptop display
enable_laptop_display() {
    log "External display disconnected. Enabling laptop display..."
    hyprctl keyword monitor eDP-1,preferred,auto,1
    if [ $? -eq 0 ]; then
        log "Laptop display enabled successfully."
    else
        log "Failed to enable laptop display."
    fi
}

# Trap SIGINT and SIGTERM to exit gracefully
trap 'log "Script terminated."; exit 0' SIGINT SIGTERM

# Initialize variables for state tracking
external_monitor_connected=false

log "Starting monitor management script..."

# Main loop to continuously check for display changes
while true; do
    if check_external_monitor; then
        # External monitor is connected
        if [ "$external_monitor_connected" = false ]; then
            disable_laptop_display
            external_monitor_connected=true
        fi
    else
        # External monitor is disconnected
        if [ "$external_monitor_connected" = true ]; then
            enable_laptop_display
            external_monitor_connected=false
        fi
    fi

    # Wait before checking again (adjust as needed)
    sleep 2
done

