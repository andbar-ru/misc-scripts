#!/bin/bash

DIR="$HOME/Images/screenshots"
FILE="screenshot.png"

cd $DIR
if [ ! -f "$FILE" ]; then
  touch "$FILE"
fi
for file in *; do
  if [ "$file" != "$FILE" ]; then
    rm "$file"
  fi
done

