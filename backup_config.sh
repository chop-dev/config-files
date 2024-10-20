#!/bin/bash

# NVIM BACKUP
# ===========================

# Define source and destination directories
NVIM_SOURCE="$HOME/.config/nvim"
NVIM_DESTINATION="$HOME/Developer/config-files/nvim"

# Create the destination directory if it doesn't exist
mkdir -p "$NVIM_DESTINATION"

# Copy the nvim folder to the destination
cp -r "$NVIM_SOURCE/"* "$NVIM_DESTINATION/"

echo "Neovim configuration copied to $NVIM_DESTINATION"

# TMUX ( To Be Added )
# ===========================


# ZSH ( To Be Added )
# ===========================

# GIT PUSH 
# ===========================

