#!/usr/bin/env bash

INTERFACE='wlan0'

# Check if Kalu is installed correctly
/bin/which kalu 2>&1 > /dev/null
if [ "$?" -eq 1 ]; then
    exit 1;
fi

# Are we connected to the internet?
get_wlan0='ip a | grep "wlan0" | grep -P '"'"'inet(?!6)'"'"
get_eth0='ip a | grep "eth0" | grep -P '"'"'inet(?!6)'"'"
wlan0=$(eval "$get_wlan0")
eth0=$(eval "$get_eth0")

while [[ -z "$wlan0" && -z "$eth0" ]]; do
    sleep 1;
    wlan0=$(eval "$get_wlan0")
    eth0=$(eval "$get_eth0")
done

# Once we are, start Kalu
kalu &
