#!/usr/bin/env bash

temp=$(cat /sys/class/hwmon/hwmon3/temp1_input)
c=$((temp / 1000))
cls="normal"
(( c >= 80 )) && cls="critical"
(( c >= 60 && c < 80 )) && cls="warning"

printf '{"text":"GPU %s°C","class":"%s"}\n' "$c" "$cls"
