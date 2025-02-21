#!/bin/bash

# Directories to search for projects
SEARCH_DIRS=(~/projects/ ~/.config/)

# Get list of directories
PROJECTS=$(find "${SEARCH_DIRS[@]}" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)

# Use fzf to select a project
SELECTED_PROJECT=$(echo "$PROJECTS" | fzf --height 20% --reverse --prompt "Select project: ")

# Exit if nothing is selected
[ -z "$SELECTED_PROJECT" ] && exit 1

# Extract project name (for tmux session name)
SESSION_NAME=$(basename "$SELECTED_PROJECT" | tr . _)

# Check if tmux session exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    # If session exists, create a new window
    tmux new-window -t "$SESSION_NAME" -c "$SELECTED_PROJECT"
else
    # If session doesn't exist, create a new one
    tmux new-session -s "$SESSION_NAME" -c "$SELECTED_PROJECT"
fi
