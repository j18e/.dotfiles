#!/bin/bash -eu

if tmux ls | grep -q "^\d"; then
    echo "tmux server already running. Attach with tma."
else
    tmux
fi

