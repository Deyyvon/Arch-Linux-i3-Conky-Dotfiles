#!/bin/bash
# Superimpose a lock icon and lock text on a blurred screenshot and call i3lock
# with said image. Supports multiple monitors.
# Adapted from https://github.com/guimeira/i3lock-fancy-multimonitor/blob/master/lock

# Regular expression to find the display dimensions from xrandr
DISPLAY_REGEX="([0-9]+)x([0-9]+)\\+([0-9]+)\\+([0-9]+)"

IMAGE_REGEX="([0-9]+)x([0-9]+)"

# The director of this script
CURR_DIR="$(dirname "$(readlink -f "$0")")"
LOCK="${CURR_DIR}/lock.png"
TEXT="${CURR_DIR}/text.png"
TMPDIR="$(mktemp -dt lock.XXXXXXXXXX)"
OUTPUT_IMAGE="$TMPDIR/i3lock.png"

##################################
# OPTIONS
##################################
# Blur Options
#
# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
BLURTYPE="1x1"
#BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s

# Pixelation
#
# Blur if false
PIXELATE=false

# Display lock text
#
DISPLAY_TEXT=true

# ImageMagick Parameters
#
PARAMS=""





# Parse user args
POSITIONAL=()
for i in "$@"
do
  case $i in
    -h|--help)
      echo "Usage: $0 [-n|--no-text] [-p|--pixelate] [-b=VAL|--blur=VAL]"
      echo "See for blur values: http://www.imagemagick.org/Usage/blur/#blur_args"
      exit
      shift
      ;;
    -b=*|--blur=*)
      VAL="${i#*=}"
      BLURTYPE=(${VAL//=/ })
      shift
      ;;
    -n|--no-text)
      DISPLAY_TEXT=false
      shift
      ;;
    -p|--pixelate)
      PIXELATE=true
      shift
      ;;
    *)
      echo "Unknown option: $i"
      exit
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done
set -- "${POSITIONAL[@]}"

# Take a screenshot of all displays
scrot -z "$OUTPUT_IMAGE"

# Get dimensions of the lock image
LOCK_IMAGE_INFO=$(identify "$LOCK")
[[ ${LOCK_IMAGE_INFO} =~ ${IMAGE_REGEX} ]]
IMAGE_WIDTH=${BASH_REMATCH[1]}
IMAGE_HEIGHT=${BASH_REMATCH[2]}

if ${DISPLAY_TEXT}; then
  # Get dimensions of the text image
  TEXT_IMAGE_INFO=$(identify "$TEXT")
  [[ ${TEXT_IMAGE_INFO} =~ ${IMAGE_REGEX} ]]
  TEXT_WIDTH=${BASH_REMATCH[1]}
  TEXT_HEIGHT=${BASH_REMATCH[2]}
fi

# Get information about displays from xrandr
while read LINE
do
  # If we are reading the line containing the position information...
  if [[ $LINE =~ ${DISPLAY_REGEX} ]]; then
    # ...extract information and set ImageMagick parameters.
    WIDTH=${BASH_REMATCH[1]}
    HEIGHT=${BASH_REMATCH[2]}
    X=${BASH_REMATCH[3]}
    Y=${BASH_REMATCH[4]}
    POS_X=$(($X+$WIDTH/2-${IMAGE_WIDTH}/2))
    POS_Y=$(($Y+$HEIGHT/2-${IMAGE_HEIGHT}/2))

    PARAMS="$PARAMS '$LOCK' '-geometry' '+${POS_X}+${POS_Y}' '-composite'"

    if ${DISPLAY_TEXT}; then
      TEXT_X=$(($X+$WIDTH/2-${TEXT_WIDTH}/2))
      TEXT_Y=$(($Y+$HEIGHT/2-${TEXT_HEIGHT}/2+200))
      PARAMS="$PARAMS '$TEXT' '-geometry' '+${TEXT_X}+${TEXT_Y}' '-composite'"
    fi
  fi
done <<<"$(xrandr)"

# Use ImageMagick to create the lock screen image for i3lock
if $PIXELATE; then
  PARAMS="'${OUTPUT_IMAGE}' '-scale' '10%' '-scale' '1000%' $PARAMS '${OUTPUT_IMAGE}'"
else
  PARAMS="'${OUTPUT_IMAGE}' '-level' '0%,100%,0.6' '-blur' '$BLURTYPE' $PARAMS '${OUTPUT_IMAGE}'"
fi
eval convert $PARAMS

# Lock the screen with the generated lock screen image
/usr/bin/i3lock -i "${OUTPUT_IMAGE}" -t

# Clean up
rm -rf "$TMPDIR"
