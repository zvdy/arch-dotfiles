#!/bin/bash

# Set the wallpaper path
random_wallpaper="/home/zvdy/Pictures/wall.gif"

# Terminate already running instances of swaybg and mpv
killall -q swaybg
killall -q mpv

# Wait until the processes have been shut down
while pgrep -x swaybg >/dev/null || pgrep -x mpv >/dev/null; do sleep 1; done

# Check if the selected wallpaper is a video file
if [[ $random_wallpaper == *.mp4 || $random_wallpaper == *.mkv || $random_wallpaper == *.webm ]]; then
    # Set the animated wallpaper using mpv
    mpv --loop --no-audio --no-osc --no-osd-bar --panscan=1.0 --wid=$(xdotool search --class "root" | head -1) "$random_wallpaper" &
else
    # Set the static wallpaper using swaybg
    swaybg -m fill -i $random_wallpaper &
fi

notify-send "$random_wallpaper" &