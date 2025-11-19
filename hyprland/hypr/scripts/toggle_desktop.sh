#!/usr/bin/env bash

# Get the current workspace ID
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Define the target workspace
target_workspace=9

# If the current workspace is 9, go back to the previous workspace
if [ "$current_workspace" -eq "$target_workspace" ]; then
  hyprctl dispatch workspace previous
else
  hyprctl dispatch workspace $target_workspace
fi
