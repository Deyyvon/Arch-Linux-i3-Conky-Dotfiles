#!/usr/bin/env bash

if [ -a /etc/pacman.d/mirrorlist-arch.pacnew ]; then
	echo -n 'New mirrorlist found. Backing up...'
	cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist-arch.backup
	echo 'Done.'
	
	echo -n 'Enabling every mirror...'
	sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist-arch.pacnew
	echo 'Done.'

	echo -n 'Ranking mirrors by speed...'
	rankmirrors /etc/pacman.d/mirrorlist-arch.pacnew > /etc/pacman.d/mirrorlist-arch
	echo 'Done.'

	echo -n 'Cleaning up...'
	rm /etc/pacman.d/mirrorlist-arch.pacnew
	echo 'Done.'
	exit 0
fi

#echo 'Backing up mirrorlist.'
#cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

#echo 'Enabling every mirror.'
#sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup

#echo 'Ranking mirrors by speed.'
#rankmirrors /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

#echo 'Done.'
#exit 0
