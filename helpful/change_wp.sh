#!/bin/bash

# Define the directory where your wallpapers are stored
WALLPAPER_DIR="$HOME/Wallpapers"

# Define the path to your hyprlock.conf file
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"

# --- Function to update hyprlock.conf ---
update_hyprlock_conf() {
    local wallpaper_path="$1"
    echo "Updating hyprlock.conf with: $wallpaper_path"

    awk -v new_path="$wallpaper_path" -f - "$HYPRLOCK_CONF" << 'AWK_SCRIPT' > "${HYPRLOCK_CONF}.tmp"
/^    background \{/,/^    \}$/ {
    if ($0 ~ /^[[:space:]]*path = /) {
        print "        path = " new_path
    } else {
        print
    }
    next
}
{ print }
AWK_SCRIPT

    if [ $? -eq 0 ]; then
        mv "${HYPRLOCK_CONF}.tmp" "$HYPRLOCK_CONF"
        if [ $? -ne 0 ]; then
            echo "ERROR: Failed to move temporary hyprlock.conf file."
            rm -f "${HYPRLOCK_CONF}.tmp"
            return 1
        fi
        echo "hyprlock.conf updated successfully."
    else
        echo "ERROR: awk command failed for hyprlock.conf."
        rm -f "${HYPRLOCK_CONF}.tmp"
        return 1
    fi
}

# --- Function to initiate swww and set the wallpaper with animation ---
set_wallpaper_with_swww() {
    local wallpaper_path="$1"

    # Start swww daemon if it's not running
    if ! pgrep -x "swww-daemon" > /dev/null; then
        echo "Starting swww-daemon..."
        swww-daemon &
        sleep 0.5
    fi

    # Get all connected monitors from hyprctl and set wallpaper on each
    monitors=$(hyprctl monitors | grep 'Monitor ' | awk '{print $2}')
    echo "Setting wallpaper on monitors: $monitors"

    for mon in $monitors; do
        echo "Setting wallpaper on monitor: $mon"
        swww img "$wallpaper_path" -o "$mon" --transition-type grow --transition-step 90 --transition-duration 1 --transition-fps 165
    done

    echo "Wallpaper set with animation on all monitors."
}

# --- Main script logic ---

NEW_WALLPAPER=""

if [ -z "$1" ]; then
    # No path given, choose randomly
    echo "No wallpaper path provided. Choosing randomly from $WALLPAPER_DIR..."
    if [ -d "$WALLPAPER_DIR" ]; then
        NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" \) | shuf -n 1)
        if [ -z "$NEW_WALLPAPER" ]; then
            echo "Error: No suitable image files found in $WALLPAPER_DIR."
            exit 1
        fi
    else
        echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist."
        exit 1
    fi
else
    # Path given as a parameter
    NEW_WALLPAPER="$1"
    if [ ! -f "$NEW_WALLPAPER" ]; then
        echo "Error: The provided path is not a valid file: $NEW_WALLPAPER"
        exit 1
    fi
fi

echo "Selected wallpaper: $NEW_WALLPAPER"

# 1. Set wallpaper with swww (handles transitions on all monitors)
set_wallpaper_with_swww "$NEW_WALLPAPER"

# 2. Update hyprlock.conf
update_hyprlock_conf "$NEW_WALLPAPER"

# 3. Generate colors using pywal
echo "Generating colors with pywal..."
if command -v wal &>/dev/null; then
    wal -i "$NEW_WALLPAPER" -n # -n prevents pywal from changing the wallpaper itself
else
    echo "pywal not found, skipping color generation."
fi

# 4. Restart waybar safely
pkill waybar
sleep 0.5
waybar &

echo "Wallpaper and colors updated successfully!"
echo "Note: Hyprlock will use the new background the next time it is invoked."
