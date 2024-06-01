#!/bin/bash

# Get the current keyboard layout
layout=$(swaymsg -t get_inputs | jq -r '.[] | select(.type == "keyboard") | .xkb_active_layout_name')

# Output the current layout
#echo $layout
