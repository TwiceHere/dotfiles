#!/usr/bin/env bash

WINDOW_INFO=$(niri msg focused-window)
LOG="$HOME/dotfiles/myscripts/window_log.txt"

if [ -n "$WINDOW_INFO" ]; then
  echo $WINDOW_INFO | wl-copy
else
  echo "No window currently focused." >>$LOG
  # notify-send "Focused Window Info" "No window currently focused."
fi
