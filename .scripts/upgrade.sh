#!/bin/sh
# upgrade.sh
# Ranks mirrors in pacman mirrorlist and performs a full system upgrade.

dir='/etc/pacman.d/'

echo 'Backing up mirrorlist...'
cp $dir'mirrorlist' $dir'mirrorlist.bak'

echo 'Ranking mirrors...'
rankmirrors  $dir'mirrorlist.bak' > $dir'mirrorlist'

echo 'Starting pacman -Syu...'
pacman -Syu
