#!/bin/bash

help() {
  cat <<EOF
"Usage: $(basename $0) [OPTION]... [DIR]"
Display file names with their size in the specified directory if size in bytes is a prime number.
If directory is not specified, current directory is used.

OPTIONS:
  -m, --max     consider only the max size of those which is a prime number in bytes
  -h, --help    prints this help
EOF
}

isPrime() {
  if [ ! $1 -gt 0 ] 2>/dev/null; then
    echo "$1 is not a positive number"
    return 0
  fi
  FACTORS=($(factor $1 | cut -d: -f2))
  if [ ${#FACTORS[@]} -eq 1 ]; then
    return 1
  fi
  return 0
}

# Call getopt to validate the provided input.
OPTIONS=$(getopt -o "hm" -l "help,max" -- "$@")
if [ $? -ne 0 ]; then
  echo
  help
  exit 1
fi

eval set -- "$OPTIONS"

ONLY_MAX=0

while true; do
  case "$1" in
  -h|--help)
    help
    exit 0
    ;;
  -m|--max)
    ONLY_MAX=1
    ;;
  --)
    shift
    break
    ;;
  esac
  shift
done

DIR="$1"

# If directory is not specified, current directory is used.
if [ ! "$DIR" ]; then
  DIR="."
fi

if [ ! -d "$DIR" ]; then
  echo "$DIR is not a directory"
  exit 1
fi

PRIME_FILES=()
PRIME_SIZES=()
MAX_PRIME_SIZE=0

for FILE in $(find "$DIR" -maxdepth 1 -type f); do
  SIZE=$(stat -c "%s" "$FILE")
  isPrime $SIZE
  if [ $? -eq 1 ]; then
    if [ $ONLY_MAX -eq 1 ]; then
      if [ $SIZE -gt $MAX_PRIME_SIZE ]; then
        PRIME_FILES=()
        PRIME_SIZES=()
      fi
      if [ $SIZE -ge $MAX_PRIME_SIZE ]; then
        PRIME_FILES+=($FILE)
        PRIME_SIZES+=($SIZE)
        MAX_PRIME_SIZE=$SIZE
      fi
    else
      PRIME_FILES+=($FILE)
      PRIME_SIZES+=($SIZE)
    fi
  fi
done

LENGTH=${#PRIME_SIZES[@]}
if [ $LENGTH -eq 0 ]; then
  echo "There are no files with a prime size in bytes"
else
  for I in $(seq $LENGTH); do
    echo "${PRIME_FILES[I-1]}:    ${PRIME_SIZES[I-1]}"
  done
fi

exit 0
