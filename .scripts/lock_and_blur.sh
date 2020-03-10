#!/usr/bin/env sh

# set the icon and a temporary location for the screenshot to be stored
icon="$HOME/repos/dotfiles/walls/wall_20.png"
# tmpbg='/tmp/screen.png'

# take a screenshot
# scrot "$tmpbg"

# blur the screenshot by resizing and scaling back up
# convert "$tmpbg" -filter Gaussian -blur 0x8 "$tmpbg"
#convert "$icon" -filter Gaussian -blur 0x8 "$icon"

# overlay the icon onto the screenshot
#convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# lock the screen with the blurred screenshot
# i3lock -i "$tmpbg"
i3lock -i "$icon"
