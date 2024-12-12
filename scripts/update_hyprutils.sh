#!/bin/bash

# Define source files and destination paths
DVROAK_SCRIPT="$HOME/.local/bin/tmux-sessionizer"
DESTINATION="../custom/hypr-utils"

if [ ! -f "$DVROAK_SCRIPT" ]; then
    echo "Tmux sessionizer script $DVROAK_SCRIPT does not exist. Exiting."
    exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DESTINATION"

# Clear out the destination directory
rm -rf "$DESTINATION/"*

# Copy files to the destination directory
cp "$DVROAK_SCRIPT" "$DESTINATION/"

# Provide feedback
echo "Hypr utils files have been copied to $DESTINATION."
