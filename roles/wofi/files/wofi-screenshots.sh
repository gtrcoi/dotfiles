#!/bin/bash

# Define your screenshot directory
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# 1. Get the files
# 2. Add the img: prefix for Wofi
# 3. Pipe to wofi in dmenu mode
selected=$(
  ls "$SCREENSHOT_DIR" |
    sed "s|^|img:$SCREENSHOT_DIR/|" |
    wofi --dmenu \
      --cache-file /dev/null \
      --allow-images \
      --columns 3 \
      --define "image-size=250x141" \
      --conf ~/.config/wofi/wallpaper \
      --sort-order=default
) #--conf=$HOME/.config/wofi/config)

# Optional: Open the selected file with your image viewer (e.g., sxiv, imv, or feh)
if [ -n "$selected" ]; then
  # Strip the "img:" prefix before opening
  file_path=$(echo "$selected" | sed 's/^img://')
  xdg-open "$file_path"
fi
