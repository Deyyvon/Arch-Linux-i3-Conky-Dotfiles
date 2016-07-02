#!/bin/bash
# Ranks mirror links by speed

# Number of mirrors to use
NUM=10

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup			# Backup mirrorlist
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup			# Uncomment all mirrors
rankmirrors -n $NUM /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist	# Rank mirrors
