#!/bin/bash

# author: Jon Christensen, date: 2018-11-28, macOS: 10.14.1, GitHub / Jamf Nation: jychri 

# --- do not edit below --- #

serial=$(/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number (system)' | /usr/bin/awk '{print $NF}')
name="$serial"

# --- make changes here --- #

# --- testing only (comment-out in production) --- #

echo "serial: $serial"
echo "name: $name"
 
# --- system wide changes below! (enable when ready) --- #

# /usr/sbin/scutil --set ComputerName "$name"
# /usr/sbin/scutil --set LocalHostName "$name"
