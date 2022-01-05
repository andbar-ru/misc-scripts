#!/bin/bash
source ./scripts/locations.sh

# Предварительно в файле NewVieLayersMap.vue надо поменять значения следующих свойств:
# center: Coordinate = [33.4, 69.1]
# zoom: number = 10

xdotool mousemove ${LOCATION_LAYERS_BUTTON[@]}
xdotool click 1
xdotool sleep 1
xdotool mousemove 2407 282 # scrollbar
xdotool mousedown 1
xdotool mousemove 2407 498
xdotool mouseup 1
xdotool mousemove 2054 428 # Морские порты РФ
xdotool click 1
xdotool mousemove 2395 167
xdotool sleep 0.5
xdotool click 1
