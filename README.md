# mac-name

## Synopsis

Three scripts that set `LocalHostName` and `ComputerName` on macOS devices using the
device's serial and an optional CSV file.

## Summary

All three scripts use `system_profiler` to access the device's serial number and
`scutil` to set `LocalHostName` and `ComputerName`.

```bash
serial=$(/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number (system)' | /usr/bin/awk '{print $NF}')
```

```bash
/usr/sbin/scutil --set ComputerName "$name"
/usr/sbin/scutil --set LocalHostName "$name"
```

`system-name-serial` sets `LocalHostName` and `ComputerName` to the `serial` with no
alteration.

`system-name-capture` sets a unique name using the following:
* A
* B
* C

`system-name-csv` matches `serial` in a two-column CSV and sets `LocalHostName` and
`ComputerName` to the matching value:

```bash
# --- set value(s) here --- #

csv="/usr/local/YOURORG/assets.csv"

# --- do not edit below --- #

# exit if no csv file found

if [ ! -e "$csv" ]; then
  echo "no file at $csv; exiting"
  exit
fi

serial=$(/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number (system)' | /usr/bin/awk '{print $NF}')
name=$(/usr/bin/awk -F ""$serial,"*" '{print $2}' "$csv")
```




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
