#!/bin/sh

IMAGE=/tmp/swaylock.png

##################################
# COLORS
##################################
REGULAR_COLOR='#fd956aff'
TEXT_COLOR='#00ffffff'
VERIFYING_COLOR='#8700ffff'
WRONG_COLOR='#c44063ff'
CLEAR_COLOR='#f3d374ff'
INSIDE_COLOR='#01001680'
LINE_COLOR='#010016ff'

##################################
# BLUR OPTIONS
##################################
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

grim "$IMAGE"
convert "$IMAGE" -blur "$BLURTYPE" "$IMAGE"

swaylock -i "$IMAGE" \
    --daemonize \
    --ignore-empty-password \
    --show-failed-attempts \
    --indicator-idle-visible \
    --indicator-radius=75 \
    --font="Source Code Pro" \
    --inside-color="$INSIDE_COLOR" \
    --inside-clear-color="$INSIDE_COLOR" \
    --inside-ver-color="$INSIDE_COLOR" \
    --inside-wrong-color="$INSIDE_COLOR" \
    --ring-color="$REGULAR_COLOR" \
    --ring-clear-color="$CLEAR_COLOR" \
    --ring-ver-color="$VERIFYING_COLOR" \
    --ring-wrong-color="$WRONG_COLOR" \
    --line-color="$LINE_COLOR" \
    --separator-color="$LINE_COLOR" \
    --text-color="$TEXT_COLOR" \
    --text-clear-color="$CLEAR_COLOR" \
    --text-ver-color="$VERIFYING_COLOR" \
    --text-wrong-color="$WRONG_COLOR" \
    --layout-text-color="$TEXT_COLOR" \
    --key-hl-color="$TEXT_COLOR" \
    --bs-hl-color="$CLEAR_COLOR"

rm "$IMAGE"
