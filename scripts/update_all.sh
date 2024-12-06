#!/bin/bash

# script to update everything together

echo "Running update_nvim.sh..."
./update_nvim.sh

# Check if the first script ran successfully
if [ $? -ne 0 ]; then
    echo "update_nvim.sh failed. Exiting."
    exit 1
fi

echo "Running update_tmux.sh..."
./update_tmux.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_tmux.sh failed. Exiting."
    exit 1
fi

echo "Running update_kitty.sh..."
./update_kitty.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_kitty.sh failed. Exiting."
    exit 1
fi

echo "Running update_hypr.sh..."
./update_hypr.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_hypr.sh failed. Exiting."
    exit 1
fi

echo "Running update_waybar.sh..."
./update_waybar.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_waybar.sh failed. Exiting."
    exit 1
fi

echo "Running update_wofi.sh..."
./update_wofi.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_wofi.sh failed. Exiting."
    exit 1
fi

echo "Running update_btop.sh..."
./update_btop.sh

# Check if the second script ran successfully
if [ $? -ne 0 ]; then
    echo "update_btop.sh failed. Exiting."
    exit 1
fi

echo "Scripts ran successfully!"
