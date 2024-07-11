#!/bin/bash



thorium-browser

while : ; do
    name=$(xdotool getwindowfocus getwindowname)
    # echo -n "name is $name"
    # printf "\n"
    if [[ $name =~ .*\ -\ Thorium.* ]]; then
        # wmctrl -r :ACTIVE: -e "1,0,22,1920,514"         
        wmctrl -r :ACTIVE: -b add,maximized_horz,maximized_vert
        break
    fi
done





