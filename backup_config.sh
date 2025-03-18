#!/bin/bash

# =========================================
# CONFIG BACKUP SCRIPT (Fixed for macOS)
# =========================================

# Define source and destination directories
CONFIGS=(
  "$HOME/.config/lvim:$HOME/Developer/config-files/"
  "$HOME/.config/nvim:$HOME/Developer/config-files/"
  "$HOME/.tmux.conf:$HOME/Developer/config-files/tmux/tmux.conf"
  "$HOME/.zshrc:$HOME/Developer/config-files/zshrc/zshrc"
)

echo "Starting backup process..."
echo "Configs to backup:"

# Loop through configs and backup
for CONFIG in "${CONFIGS[@]}"; do
  IFS=":" read -r SOURCE DESTINATION <<< "$CONFIG"
  echo " - $SOURCE → $DESTINATION"
done

for CONFIG in "${CONFIGS[@]}"; do
  IFS=":" read -r SOURCE DESTINATION <<< "$CONFIG"

  echo "Checking: $SOURCE"

  if [ -d "$SOURCE" ] || [ -f "$SOURCE" ]; then
    read -p " → Found! Do you want to backup $SOURCE to $DESTINATION? (y/n): " RESPONSE
    if [[ "$RESPONSE" =~ ^[Yy]$ ]]; then
      echo "Backing up to $DESTINATION..."
      mkdir -p "$(dirname "$DESTINATION")"  # Create parent directories
      cp -R "$SOURCE" "$DESTINATION"        # Fixed for macOS
      echo " ✅ Successfully backed up $(basename "$SOURCE")"
    else
      echo " ❌ Skipped backing up $SOURCE"
    fi
  else
    echo "⚠️  Warning: $SOURCE does not exist. Skipping..."
  fi
done

echo "🌟 Backup process completed!"

