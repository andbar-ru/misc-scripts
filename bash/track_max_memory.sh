#!/bin/bash

source $HOME/.bash_functions

PROCESS=$1

if [ -z "$1" ]; then
  echo "Process to keep track of is not specified"
  exit 1
fi

maxMem=0
while true; do
  mem=$(totalMemory "$PROCESS" | cut -d' ' -f1 | cut -d. -f1)
  if [ "$mem" = "0" ]; then
    echo
    echo "Max memory: $maxMem MB"
    echo "Finished"
    break
  fi
  if [ $mem -gt $maxMem ]; then
    maxMem="$mem"
  fi
  echo "$mem MB"
  sleep 5
done
