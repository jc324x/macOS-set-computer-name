# mac-name

## Synopsis

Three scripts that set `LocalHostName` and `ComputerName` on macOS devices using the
device's serial and an optional CSV file.

## Summary

All three scripts use the device's serial number: 

```bash
serial=$(/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number (system)' | /usr/bin/awk '{print $NF}')
```

`system-name-serial` sets the `LocalHostName` and `ComputerName` to `serial` with no
alteration:

```bash
/usr/sbin/scutil --set ComputerName "$serial"
/usr/sbin/scutil --set LocalHostName "$serial"
```

`system-name-capture` creates a unique name for the device using 

captures part of the serial number (`capture_start` and `capture_end` set the capture range), identifies the model with a cas


`system-name-csv`
`system-name-capture`

`LocalHostName` and `ComputerName` are set with `/usr/sbin/scutil`:

```bash
/usr/sbin/scutil --set ComputerName "$name"
/usr/sbin/scutil --set LocalHostName "$name"
```




## Process

All three scripts get the devices serial number:

`system-name-capture`

Each script has two key markings:

`# --- testing only (comment-out in production) --- #`
`# --- system wide changes below! (enable when ready) --- #`

System wide changes are commented out by default, while testing lines are enabled.
