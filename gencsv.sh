#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <start> <end>"
  exit 1
fi

start=$1
end=$2
> inputFile

for i in $(seq $start $end)
do
  echo "$i, $RANDOM" >> inputFile
done

