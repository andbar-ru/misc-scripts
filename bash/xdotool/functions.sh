#!/bin/bash

runDevToolsSnippet() {
  if [ ! $1 ]; then
    echo "You must provide snippet name"
    return 1
  fi

  SNIPPET="$1"

  WINDOW_ID=$(xdotool getactivewindow)
  GEOMETRY=$(xwininfo -id $WINDOW_ID | grep 'geometry' | grep -oP '\d+x\d+') # e.g. 1288x1159
  IFS='x' read -ra DIMENSIONS <<< "$GEOMETRY"
  WIDTH=${DIMENSIONS[0]}
  X=$((WIDTH - 180))
  Y=90
  WINDOW_ID_HEX=$(printf 0x%x $WINDOW_ID)
  GRABC_CMD="grabc -w $WINDOW_ID_HEX -l +$X+$Y"
  TIMEOUT=10
  TIME=0

  xdotool sleep 0.1
  xdotool key Control_R+Shift_R+i
  COLOR0=$($GRABC_CMD)

  while [[ $($GRABC_CMD) == $COLOR0 ]]; do
    if [ $TIME -gt $TIMEOUT ]; then
      exit 1
    fi
    TIME=$((TIME + 1))
    sleep 1
  done

  xdotool key Control_R+o
  xdotool type "!$SNIPPET"
  xdotool key Return
  xdotool key Control_R+Shift_R+i
}

