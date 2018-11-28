#!/bin/bash

# author: Jon Christensen, date: 2018-11-28, macOS: 10.14.1, GitHub / Jamf Nation: jychri 

# --- set value(s) here --- #

csv="/usr/local/YOURORG/assets.csv"

# --- do not edit below --- #

# exit early if no csv file found

if [ ! -e "$csv" ]; then
  echo "no file at $csv; exiting"; exit
fi

serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')
name=$(awk -F ""$serial,"*" '{print $2}' "$csv")

# --- make changes here --- #

# --- testing only (comment-out in production) --- #

echo "csv: $csv"
echo "serial: $serial"
echo "name: $name"

# --- system wide changes below! (enable when ready) --- #

# /usr/sbin/scutil --set ComputerName "$name"
# /usr/sbin/scutil --set LocalHostName "$name"
