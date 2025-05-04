#!/usr/bin/env bash

check_external_monitor() {
    if hyprctl monitors | grep -q "Monitor DP-1\|Monitor DP-2"; then
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

if check_external_monitor; then
  # External monitor is connected
  if [ "$external_monitor_connected" = false ]; then
    disable_laptop_display
  fi
else
  # External monitor is disconnected
  if [ "$external_monitor_connected" = true ]; then
    enable_laptop_display
  fi
fi

