#!/bin/bash

# Define source and destination folders
source_dir="./nvim"
destination_dir="$HOME/.config/nvim"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory '$source_dir' does not exist."
  exit 1
fi

# Backup the existing nvim directory if it exists
if [ -d "$destination_dir" ]; then
  echo "Backing up existing nvim configuration to ~/.config/nvim_backup"
  mv "$destination_dir" "$HOME/.config/nvim_backup"
fi

# Move the new nvim configuration
echo "Replacing ~/.config/nvim with the new configuration."
mv "$source_dir" "$destination_dir"

echo "nvim configuration replaced successfully!"
