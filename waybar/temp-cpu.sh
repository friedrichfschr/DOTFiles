#!/usr/bin/env bash

# read CPU temperature and classify
temp=$(cat /sys/class/hwmon/hwmon1/temp1_input)
c=$((temp / 1000))
cls="normal"
(( c >= 80 )) && cls="critical"
(( c >= 60 && c < 80 )) && cls="warning"

# output JSON that Waybar expects
printf '{"text":"CPU %s°C","class":"%s"}\n' "$c" "$cls"
