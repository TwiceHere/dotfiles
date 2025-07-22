#!/bin/bash

# Check if the 'coding' session already exists
if tmux has-session -t coding 2>/dev/null; then
  echo "Session 'coding' already exists."
else
  # Create a new session named 'coding'
  tmux new-session -d -s coding

  # Split the session horizontally (pane below)
  tmux split-window -v -t coding
fi

# Attach to the coding session
tmux attach-session -t coding
