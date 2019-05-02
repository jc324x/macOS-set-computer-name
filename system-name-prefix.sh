#!/bin/bash

# author: Jon Christensen, date: 2018-11-28, macOS: 10.14.1, GitHub / Jamf Nation: jychri 

# --- set value(s) here --- #

prefix=""
suffix=""
div="-"
capture_start=3
capture_end=5

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

# --- do not edit below --- #

serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')
capture=${serial:$capture_start:$capture_end}
model_id=$(system_profiler SPHardwareDataType | grep "Model Identifier" | awk '{print $NF}')

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

# --- test --- #

# printf "test = serial: %s, name: %s. exit! \n" "$serial" "$name"; exit

# --- main! --- #
 
/usr/sbin/scutil --set ComputerName "$name"
/usr/sbin/scutil --set LocalHostName "$name"
