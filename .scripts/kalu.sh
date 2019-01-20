#!/usr/bin/env bash

# Check if Kalu is installed correctly
/bin/which kalu 2>&1 > /dev/null
if [ "$?" -eq 1 ]; then
    exit 1;
fi

addr=8.8.8.8

# Are we connected to the internet?
cmd='ping -q -w 1 -c 1 "$addr"'
eval "$cmd"
connected=$?

while [ $connected != 0 ]; do
    eval "$cmd"
    connected=$?
    sleep 1;
done

# Once we are, start Kalu
kalu &
