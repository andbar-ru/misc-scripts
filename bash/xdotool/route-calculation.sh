#!/bin/bash
source ./scripts/locations.sh
TARGET_ID="9124"

xdotool mousemove ${LOCATION_MAIN_MENU[@]}
xdotool click 1
xdotool sleep 0.3
xdotool mousemove ${LOCATION_MENU_5_1_13[@]}
xdotool click 1
xdotool sleep 0.3
xdotool mousemove ${LOCATION_MENU_5_1_13_2[@]}
xdotool click 1
xdotool sleep 0.5
xdotool mousemove 2274 367
xdotool click 1
xdotool type "$TARGET_ID"
xdotool sleep 2
xdotool mousemove 2408 489
xdotool click 1
xdotool sleep 0.3
xdotool mousemove_relative 0 50
xdotool click 1
xdotool sleep 0.5
xdotool mousemove 1993 262
xdotool mousedown 1
xdotool mousemove 1942 213
xdotool mouseup 1
xdotool mousemove 3183 261
xdotool click 1
xdotool sleep 0.3
xdotool click 1
xdotool mousemove 2271 213
xdotool click 1
xdotool mousemove 2066 304
xdotool click 1

# Заполнить данные точки конца маршрута.
xdotool sleep 1
xdotool mousemove 1954 595
xdotool click 1
xdotool type 55031719+
xdotool key Tab
xdotool type 020592177+
xdotool key Tab
xdotool key Tab
xdotool type 31032021
xdotool key Tab
xdotool type 1254
