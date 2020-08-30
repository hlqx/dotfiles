#/usr/bin/env bash

cryVersion=$(jq -r '.cry[].version' ~/.cry/conf.json)
cpuType=$(grep 'model name' /proc/cpuinfo | head -n 1 | cut -d ' ' -f 3- | cut -d '@' -f 1)
memoryAmount=$(grep MemTotal /proc/meminfo | cut -c 18- | cut -d ' ' -f 1)
memoryAmountGigabytes=$(echo "scale=1; $memoryAmount/1048576" | bc)

notify-send "$(hostname)" "cry $cryVersion\nLinux $(uname -r)\n$cpuType\n$memoryAmountGigabytes GB RAM\n" -t 5000
