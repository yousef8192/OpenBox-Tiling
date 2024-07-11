#!/bin/bash
# Get the coordinates of the active window's
#    top-left corner, and the window's size.
#    This excludes the window decoration.


# Working area
# mohm, 1054 is = 1080 - 26 (where 26 is the bottom margin)
# change 1920 & 1080 to the resolution of your screen
WX="1920" 
WY="1054"
X1=$((($WX/2)))
X2=$((($WX/2)))
Y1=$((($WY/2)))
Y11=$((($WY/2)-13))
Y2=$((($WY/2)))

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




  echo -n "x = $x"
  printf "\n"
  echo -n "y = $y"
  printf "\n"
  echo -n "right_side = $right_side_x"
  printf "\n"
  echo -n "bottom_side = $bottom_y"

  printf "\n"
  printf "\n"


  # if [[ $y -gt 0 ]] && [[ $x -gt 0 ]] && [[ $right_side_x -lt 1920 ]] && [[ $bottom_y -lt 1080 ]];
  # then
  #     echo "YES"
  # else
  #     echo "NO"
  # fi


#   echo -n "x = $x"
#   printf "\n"
#   echo -n "y = $y"
#   printf "\n"
#   echo -n "w = $w"
#   printf "\n"
#   echo -n "h = $h"

#   printf "\n"
#   printf "\n"

  # echo -n "X1 = $X1"
  # printf "\n"
  # echo -n "X2 = $X2"
  # printf "\n"
  # echo -n "Y1 = $Y1"
  # printf "\n"
  # echo -n "Y11 = $Y11"
  # printf "\n"
  # echo -n "Y2 = $Y2"
  # printf "\n"





# W+h

#   if x > 0      ==> make x = 0
#   if x == 0     ==> tile left (i.e. span left half of the screen)

