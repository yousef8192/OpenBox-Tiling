#!/bin/bash



# Working area
# mohm, 1054 is = 1080 - 26 (where 26 is the bottom margin)
# change 1920 & 1080 to the resolution of your screen
SCREEN_W="1920"
SCREEN_H="1054"


unset x y w h
eval $(xwininfo -id $(xdotool getactivewindow) |
  sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
         -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
         -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )

w=$((($w)+1))
right_side_x=$((($x)+($w)))

bottom_y=$((($y)+($h)+5))

if [[ $x -eq 1 ]]
then
    x="0"
fi

y=$((($y)-22)) 



wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
if [[ $y -gt 0 ]] && [[ $x -gt 0 ]] && [[ $right_side_x -lt 1920 ]] && [[ $bottom_y -lt 1080 ]]
then
    name=$(xdotool getwindowfocus getwindowname)
    if [[ $name =~ .*\ -\ Thorium.* ]] || [[ $name =~ .*\ -\ mpv.* ]]; then
        wmctrl -r :ACTIVE: -e "1,1,0,958,1053"
        wmctrl -r :ACTIVE: -b add,maximized_vert
    else
        wmctrl -r :ACTIVE: -e "1,0,0,958,1053"
        wmctrl -r :ACTIVE: -b add,maximized_vert
    fi
elif [[ $x -gt 0 ]]
# if [[ $x -gt 0 ]]
then
    wmctrl -r :ACTIVE: -b add,maximized_horz
else
    # wmctrl -r :ACTIVE: -e "1,0,0,958,1053"
    wmctrl -r :ACTIVE: -b add,maximized_vert
fi


# W+h
#   if x > 0      ==> make x = 0
#   if x == 0     ==> tile left (i.e. span left half of the screen)



