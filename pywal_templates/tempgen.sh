#!/bin/bash

CONFIG_PATH="$HOME/dotfiles/starship/starship.toml"
TEMPLATE_PATH="$HOME/.cache/wal/templates/starship.toml"

# Create templates directory if it doesn't exist
mkdir -p "$HOME/.cache/wal/templates"

# Copy current config and replace colors with pywal variables
sed -e 's/#a3aed2/{color1}/g' \
  -e 's/#090c0c/{color0}/g' \
  -e 's/#769ff0/{color4}/g' \
  -e 's/#394260/{color8}/g' \
  -e 's/#212736/{color0}/g' \
  -e 's/#1d2230/{color8}/g' \
  -e 's/#e3e5e5/{color7}/g' \
  -e 's/#a0a9cb/{color7}/g' \
  "$CONFIG_PATH" >"$TEMPLATE_PATH"

echo "Starship template generated at $TEMPLATE_PATH"
echo "All your formatting and symbols are preserved!"
