#!/usr/bin/env bash

BUFFERNAME=$1
CHOOSER="/tmp/hx-yazi"

rm -f $CHOOSER

TARGET_DIR="$(dirname "$(realpath "$BUFFERNAME")")"

tmux display-popup -E -w 90% -h 90% -d "$TARGET_DIR" "yazi \"$BUFFERNAME\" --chooser-file=$CHOOSER" >/dev/tty

if [ -f $CHOOSER ]; then
  cat $CHOOSER
fi
