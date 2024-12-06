#!/bin/bash

# Define source files and destination paths
TMUX_CONF="$HOME/.tmux.conf"
SESSIONIZER_SCRIPT="$HOME/.local/bin/tmux-sessionizer"
DESTINATION="../terminal/tmux"

# Check if the source files exist
if [ ! -f "$TMUX_CONF" ]; then
    echo "Tmux config file $TMUX_CONF does not exist. Exiting."
    exit 1
fi

if [ ! -f "$SESSIONIZER_SCRIPT" ]; then
    echo "Tmux sessionizer script $SESSIONIZER_SCRIPT does not exist. Exiting."
    exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DESTINATION"

# Copy files to the destination directory
cp "$TMUX_CONF" "$DESTINATION/"
cp "$SESSIONIZER_SCRIPT" "$DESTINATION/"

# Provide feedback
echo "Tmux configuration files have been copied to $DESTINATION."
