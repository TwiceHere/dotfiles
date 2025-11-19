#!/usr/bin/awk -f

BEGIN {
    FS = "[=#]"   # Split on '=' or '#'
}

$1 ~ /^bind/ {
    # Replace $mainMod with SUPER
    gsub(/\$mainMod/, "SUPER", $0)

    # Remove 'bind=' and any extra spaces
    gsub(/^bind[[:space:]]*=+[[:space:]]*/, "", $0)

    # Split keybinding part (e.g., SUPER,Return)
    split($1, kbarr, ",")

    # Print formatted keybinding + command
    print kbarr[1] "  + " kbarr[2] "\r" $2
}

