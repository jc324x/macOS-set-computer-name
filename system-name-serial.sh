#!/bin/bash

# author: Jon Christensen, date: 2018-11-28, macOS: 10.14.1, GitHub / Jamf Nation: jychri 

# --- do not edit below --- #

serial=$(system_profiler SPHardwareDataType | grep 'Serial Number (system)' | awk '{print $NF}')

# --- make changes here --- #

# --- testing only (comment-out in production) --- #

echo "serial: $serial"

# --- system wide changes below! (enable when ready) --- #

# /usr/sbin/scutil --set ComputerName "$serial"
# /usr/sbin/scutil --set LocalHostName "$serial"
