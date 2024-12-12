#!/bin/bash

# Path to the Hyprland configuration file
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"

# Check if the file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Hyprland configuration file not found at $CONFIG_FILE"
    exit 1
fi

# Toggle the kb_variant line
if grep -q "kb_variant = dvorak" "$CONFIG_FILE"; then
    # Replace with empty kb_variant
    sed -i 's/kb_variant = dvorak/kb_variant =/' "$CONFIG_FILE"
    echo "Keyboard layout toggled to default."
else
    # Replace with dvorak kb_variant
    sed -i 's/kb_variant =$/kb_variant = dvorak/' "$CONFIG_FILE"
    echo "Keyboard layout toggled to Dvorak."
fi

# Reload Hyprland configuration
# hyprctl reload
