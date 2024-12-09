#!/bin/bash

# Define source and destination paths
SOURCE="$HOME/.config/nvim"
DESTINATION="../terminal/nvim"

# Check if the source directory exists
if [ ! -d "$SOURCE" ]; then
    echo "Source directory $SOURCE does not exist. Exiting."
    exit 1
fi

# Clear out the destination directory
rm -rf "$DESTINATION/"*

# Ensure the destination directory exists
mkdir -p "$DESTINATION"

# Copy contents from source to destination
cp -r "$SOURCE/"* "$DESTINATION/"

# Provide feedback
echo "Contents of $SOURCE have been copied to $DESTINATION."
