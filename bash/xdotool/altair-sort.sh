#!/bin/sh

xdotool sleep 0.1
xdotool key Control_R+Shift_R+i
xdotool sleep 2
xdotool key Control_R+o
xdotool type "!sort"
xdotool key Return
xdotool key Control_R+Shift_R+i
