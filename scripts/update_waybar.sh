#!/bin/bash

# Define source and destination paths
SOURCE="$HOME/.config/waybar"
DESTINATION="../desktop/waybar"

# Check if the source directory exists
if [ ! -d "$SOURCE" ]; then
    echo "Source directory $SOURCE does not exist. Exiting."
    exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DESTINATION"

# Clear out the destination directory
rm -rf "$DESTINATION/"*

# Copy contents from source to destination
cp -r "$SOURCE/"* "$DESTINATION/"

# Provide feedback
echo "Contents of $SOURCE have been copied to $DESTINATION."
