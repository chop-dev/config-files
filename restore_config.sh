#!/bin/bash

# =========================================
# CONFIG RESTORE SCRIPT (Fixed for macOS)
# =========================================

# Define source and destination directories for all configs
CONFIGS=(
  "$HOME/Developer/config-files/lvim:$HOME/.config/lvim"
  "$HOME/Developer/config-files/nvim:$HOME/.config/nvim"
  "$HOME/Developer/config-files/tmux/tmux.conf:$HOME/.tmux.conf"
  "$HOME/Developer/config-files/zshrc/zshrc:$HOME/.zshrc"
)

echo "Starting restore process..."
echo "Configs to restore:"

# Loop through configs and restore
for CONFIG in "${CONFIGS[@]}"; do
  IFS=":" read -r SOURCE DESTINATION <<< "$CONFIG"
  echo " - $SOURCE → $DESTINATION"
done

for CONFIG in "${CONFIGS[@]}"; do
  IFS=":" read -r SOURCE DESTINATION <<< "$CONFIG"

  echo "Checking: $SOURCE"

  if [ -d "$SOURCE" ] || [ -f "$SOURCE" ]; then
    read -p " → Found! Do you want to restore $SOURCE to $DESTINATION? (y/n): " RESPONSE
    if [[ "$RESPONSE" =~ ^[Yy]$ ]]; then
      # Backup the existing directory/file if it exists
      if [ -d "$DESTINATION" ] || [ -f "$DESTINATION" ]; then
        backup_dir="${DESTINATION}_backup"
        echo "Backing up existing configuration to '$backup_dir'"
        mv "$DESTINATION" "$backup_dir"
      fi

      # Restore the configuration
      echo "Restoring $SOURCE to $DESTINATION..."
      mkdir -p "$(dirname "$DESTINATION")"  # Create parent directories if needed
      cp -R "$SOURCE" "$DESTINATION"        # Fixed for macOS

      echo " ✅ Successfully restored $(basename "$DESTINATION")"
    else
      echo " ❌ Skipped restoring $DESTINATION"
    fi
  else
    echo "⚠️  Warning: $SOURCE does not exist. Skipping..."
  fi
done

echo "🌟 Restore process completed successfully!"
