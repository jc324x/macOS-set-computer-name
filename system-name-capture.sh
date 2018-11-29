#!/bin/bash

# author: Jon Christensen, date: 2018-11-28, macOS: 10.14.1, GitHub / Jamf Nation: jychri 

# --- set value(s) here --- #

prefix=""
suffix=""
div="-"
capture_start=3
capture_end=5

# --- do not edit below --- #

if [ "$4" != "" ] && [ "$prefix" == "" ]; then
	prefix=$4
fi

if [ "$5" != "" ] && [ "$suffix" == "" ]; then
	suffix=$5
fi

if [ "$6" != "" ] && [ "$div" == "" ]; then
	div=$6
fi

if [ "$7" != "" ] && [ "$capture_start" == "" ]; then
	capture_start=$7
fi

if [ "$8" != "" ] && [ "$capture_end" == "" ]; then
	capture_end=$8
fi

serial=$(/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number (system)' | /usr/bin/awk '{print $NF}')
capture=${serial:$capture_start:$capture_end}
model_id=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | /usr/bin/awk '{print $NF}')

case "$model_id" in 
  *MacBookAir*)
    model="AIR"
    ;;
  *MacBookPro*)
    model="PRO"
    ;;
  *MacBook*)
    model="BOOK"
    ;;
  *iMac*)
    model="IMAC"
    ;;
  *Mini*)
    model="MINI"
    ;;
  *MacPro*)
    model="MACPRO"
    ;;
  *)
    model="NA" 
    ;;
esac

name="$prefix$model$div$capture$suffix"

# --- make changes here --- #

# --- testing only (comment-out in production) --- #

echo "serial: $serial"
echo "name: $name"
 
# --- system wide changes below! (enable when ready) --- #

# /usr/sbin/scutil --set ComputerName "$name"
# /usr/sbin/scutil --set LocalHostName "$name"
