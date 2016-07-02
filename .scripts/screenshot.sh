#!/bin/bash

DUMP="$HOME/screenshots"

scrot $DUMP/%Y-%m-%d_%H:%M:%S.png
notify-send -a Scrot Screenshot
