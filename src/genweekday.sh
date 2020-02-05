#!/bin/bash
#########################################
# Generate Weekday (Mon-Fri)
# author: fox
# email: foxhlchen@gmail.com
#########################################

expyear=$1
n=0
nsat=1
nsun=1

if [ "$1" = "--help" ] || [ "$1x" = "x" ]; then
  echo "Usage: $0 [FILE]"
  echo "Calculate weekday and write it to FILE. if FILE not specify, print to stdout."
  exit 0
fi

if [ "$2x" != "x" ]; then
  file=">> $2"
fi

while true; do
  let n=$n+1
  
  nextday=$(date +%Y%m%d -d${n}day)
  nextdayyear=$(date +%Y -d${n}day)
  
  nextsat=$(date +%Y%m%d -d${nsat}sat)
  if [ $nextday -ge $nextsat  ]; then
    let nsat=$nsat+1
	continue
  fi
  
  nextsun=$(date +%Y%m%d -d${nsun}sun)
  if [ $nextday -ge $nextsun  ]; then
    let nsun=$nsun+1
	continue
  fi

  if [ $nextdayyear -le $expyear  ]; then
    eval "echo $nextday $file"
  else
    break;
  fi

done

