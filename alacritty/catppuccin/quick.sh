#!/bin/bash

# Extract colors from pywal JSON
cat ~/.cache/wal/colors.json | jq -r '
"[colors.primary]
background = \"" + .colors.color0 + "\"
foreground = \"" + .colors.color7 + "\"

[colors.normal]
black = \"" + .colors.color0 + "\"
red = \"" + .colors.color1 + "\"
green = \"" + .colors.color2 + "\"
yellow = \"" + .colors.color3 + "\"
blue = \"" + .colors.color4 + "\"
magenta = \"" + .colors.color5 + "\"
cyan = \"" + .colors.color6 + "\"
white = \"" + .colors.color7 + "\"

[colors.bright]
black = \"" + .colors.color8 + "\"
red = \"" + .colors.color9 + "\"
green = \"" + .colors.color10 + "\"
yellow = \"" + .colors.color11 + "\"
blue = \"" + .colors.color12 + "\"
magenta = \"" + .colors.color13 + "\"
cyan = \"" + .colors.color14 + "\"
white = \"" + .colors.color15 + "\""
' >pywal.toml
