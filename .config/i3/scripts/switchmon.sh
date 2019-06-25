#!/usr/bin/bash

function usage() {
    cat << END
Usage: switchmon.sh <monitor-cfg>

<monitor-cfg> can be:
---------------------
left-right  Laptop display on left, external monitor right.
right-left  Laptop display on right, external monitor left.

For the above, if two monitors are connected, the laptop
display is replaced with the other monitor output.
END
}

function notfound() {
    echo "Error: $1 not found in $2"
    return 1
}

# Path to monitor config scripts
MONCFGPATH="$HOME"/.config/i3/scripts/monitorcfg

# Path to background image
export BGIMG="$HOME"/.config/i3/img/wallpapers/cyber-neon.jpg

# Check args
test $# -eq 1 || { usage; exit 1; }

# Determine which monitor config to use
case "$1" in
    left-right)
        "$MONCFGPATH"/left-right.sh || notfound "$1".sh $MONCFGPATH
        ;;
    right-left)
        "$MONCFGPATH"/right-left.sh || notfound "$1".sh $MONCFGPATH
        ;;
    *)
        echo "Error: No monitor config named \"$1\""
        usage
        exit 1
        ;;
esac
