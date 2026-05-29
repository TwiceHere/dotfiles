#!/bin/bash

nmcli dev wifi rescan
ssid=$(nmcli -t -f ACTIVE,SSID dev wifi |
  sed 's/^yes/ /; s/^no/   /; s/^ //; s/\://' |
  fzf --ansi --prompt="Select Wi-Fi: " | xargs)

nmcli --ask device wifi connect "${ssid}" >/dev/null && echo -e "connected to ${ssid}\n"
