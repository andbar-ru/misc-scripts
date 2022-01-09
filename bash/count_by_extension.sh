#!/bin/bash
# Usage example: git ls-files | count_by_extensions.sh

INPUT=$(</dev/stdin)
declare -A COUNT_BY_EXTENSION

for FILE in $INPUT; do
  FILENAME=$(basename -- "$FILE")
  if [[ ! "$FILENAME" =~ ^[^.]+\.[^.]+$ ]]; then
    EXTENSION="No_extension"
  else
    EXTENSION=${FILENAME##*.}
  fi
  if [ ${COUNT_BY_EXTENSION[$EXTENSION]} ]; then
    COUNT_BY_EXTENSION[$EXTENSION]=$((${COUNT_BY_EXTENSION[$EXTENSION]} + 1))
  else
    COUNT_BY_EXTENSION[$EXTENSION]=1
  fi
done

declare -a EXTENSION_AND_COUNT

for KEY in ${!COUNT_BY_EXTENSION[@]}; do
  EXTENSION_AND_COUNT+=( "${KEY}_=>_${COUNT_BY_EXTENSION[$KEY]}" )
done

readarray -td '' SORTED < <(printf '%s\0' "${EXTENSION_AND_COUNT[@]}" | sort -z -n -t'_' -k3)

for ITEM in ${SORTED[@]}; do
  echo "$ITEM" | tr '_' ' '
done


