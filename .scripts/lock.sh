#!/usr/bin/env sh
# lock.sh - Lock script for i3.
# Taken and modified from edijatszik's simple blur script on /r/unixporn.

#TMPBG=/tmp/lock.png					# Path to temp image
#LOCK=~/.config/i3/scripts/lock.sh			# Path to lock icon
#RES=$(xdpyinfo | grep dimensions | awk '{ print $2 }')	# Screen resolution

##################################
# COLORS
##################################
INSIDE_COLOR='#00000080'
INSIDE_VERIFY_COLOR='#00ffff22'
RING_COLOR='#00ffffff'
TEXT_COLOR='#00ffffff'
WRONG_COLOR='#3c3c3cff'
INSIDE_VERIFY_RING_COLOR='#00000080'

# Deactivate screensaver if running.
xscreensaver-command -deactivate && sleep 1 2>/dev/null

# 	--textcolor=$TEXT_COLOR \
#	--textsize=20 \

i3lock -p default -B=10 -S=0 -e -f -k --indicator \
	--insidevercolor=$INSIDE_COLOR \
	--ringvercolor=$INSIDE_VERIFY_RING_COLOR \
	--insidewrongcolor=$INSIDE_VERIFY_COLOR \
	--insidecolor=$INSIDE_COLOR \
 	--verifcolor=$TEXT_COLOR \
	--wrongcolor=$TEXT_COLOR \
	--ringcolor=$RING_COLOR \
	--linecolor=$INSIDE_COLOR \
	--separatorcolor=$RING_COLOR \
	--timecolor=$TEXT_COLOR \
	--datecolor=$TEXT_COLOR \
	--layoutcolor=$TEXT_COLOR \
	--keyhlcolor=$WRONG_COLOR \
	--bshlcolor=$WRONG_COLOR \
	\
	--time-font=orbitron \ #RobotoMono-Light \
	--date-font=orbitron \
	--timestr="%H:%M:%S" \
	--datestr="%A, %m %Y" \
	--keylayout 0
