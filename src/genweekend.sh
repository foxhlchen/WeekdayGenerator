#!/bin/bash
#########################################
# Generate Weekend (Sat-Sun)
# author: fox
# email: foxhlchen@gmail.com
#########################################

expyear=$1
n=0

if [ "$1" = "--help" ] || [ "$1x" = "x" ]; then
  echo "Usage: $0 [FILE]"
  echo "Calculate weekend date and write it to FILE. if FILE not specify, print to stdout."
  exit 0
fi

if [ "$2x" != "x" ]; then
  file=">> $2"
fi

while true; do
  let n=$n+1
  nextsat=$(date +%Y%m%d -d${n}sat)
  nextsun=$(date +%Y%m%d -d${n}sun)
  nextsatyear=$(date +%Y -d${n}sat)
  nextsunyear=$(date +%Y -d${n}sun)

  if [ $nextsatyear -le $expyear  ]; then
    eval "echo $nextsat $file"
  fi

  if [ $nextsunyear -le $expyear  ]; then
    eval "echo $nextsun $file"
  else
    break;
  fi

done

